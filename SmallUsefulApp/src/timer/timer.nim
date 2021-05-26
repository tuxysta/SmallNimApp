import nigui
import strutils



type CustomButton = ref object of Button
method handleDrawEvent(control: CustomButton, event: DrawEvent) =
  let canvas = event.control.canvas
  canvas.areaColor = rgb(0, 255, 255)
  canvas.textColor = rgb(55, 55, 55)
  canvas.lineColor = rgb(255, 255, 255)
  canvas.drawRectArea(0, 0, control.width, control.height)
  canvas.drawTextCentered(control.text)
  canvas.drawRectOutline(0, 0, control.width, control.height)

proc newButton(text = ""): Button =
  result = new CustomButton
  result.init()
  result.text = text



app.init()

var win = newWindow("Word Count")
win.height = 700
win.width = 700

var container = newLayoutContainer(Layout_Vertical)
var newcontainer = newLayoutContainer(Layout_Horizontal)
var newcontainer1 = newLayoutContainer(Layout_Horizontal)
var bottomcontainer = newLayoutContainer(Layout_Horizontal)


win.add(container)
container.add(newcontainer)
container.add(newcontainer1)
container.add(bottomcontainer)

var quit = newButton("Quit")
var count = newButton("Count Words")
var inputTextArea = newTextArea("")
var outputTextArea = newTextArea("")

inputTextArea.editable = true
outputTextArea.editable = false


quit.widthMode = WidthMode_Expand


quit.fontFamily = "Courier New"
count.fontFamily = "Courier New"
inputTextArea.fontFamily = "Courier New"
outputTextArea.fontFamily = "Courier New"

quit.fontSize = 18
count.fontSize = 18
inputTextArea.fontSize = 18
outputTextArea.fontSize = 18

newcontainer.add(quit)
newcontainer.add(count)
newcontainer1.add(inputTextArea)
bottomcontainer.add(outputTextArea)




count.onClick = proc(event: ClickEvent) =
  outputTextArea.text = intToStr(int(len(inputTextArea.text) / 6))

quit.onClick = proc(event: ClickEvent) =
  app.quit()

