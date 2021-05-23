import md5, nigui




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


var win = newWindow("hash")
win.height = 500
win.width = 500



var container = newLayoutContainer(Layout_Vertical)
var newcontainer= newLayoutContainer(Layout_Horizontal)
var newcontainer1 = newLayoutContainer(Layout_Horizontal)
var bottomcontainer = newLayoutContainer(Layout_Horizontal)



win.add(container)
container.add(newcontainer)
container.add(newcontainer1)
container.add(bottomcontainer)

var inputTextArea = newTextArea("")
var outputTextArea = newTextArea("")

inputTextArea.fontFamily = "Courier New"
outputTextArea.fontFamily = "Courier New"

inputTextArea.fontSize = 18
outputTextArea.fontSize = 18


inputTextArea.editable = true
outputTextArea.editable = false



var fbutton = newButton("Hash")
var quit = newButton("Quit")
fbutton.widthMode = WidthMode_Expand
quit.widthMode = WidthMode_Expand

newcontainer.add(fbutton)
newcontainer.add(quit)
newcontainer1.add(inputTextArea)
bottomcontainer.add(outputTextArea)


fbutton.onClick = proc(event: ClickEvent) =
  outputTextArea.text = $toMD5(inputTextArea.text)


quit.onClick = proc(event: ClickEvent) =

  app.quit()

if Key_Q.isDown() and Key_ControlL.isDown():
  app.quit()

proc win10() =

  win.show()
  app.run()

  