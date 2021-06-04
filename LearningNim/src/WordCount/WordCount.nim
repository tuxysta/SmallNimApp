
#
#The MIT License (MIT)
#Copyright © 2021 <Protonfire0>

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



import nigui
import strutils
import parseutils



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

var win = newWindow("Rough Word Count")
win.height = 700
win.width = 800

var container = newLayoutContainer(Layout_Vertical)
var newcontainer = newLayoutContainer(Layout_Horizontal)
var newcontainer1 = newLayoutContainer(Layout_Horizontal)
var bottomcontainer = newLayoutContainer(Layout_Horizontal)


win.add(container)
container.add(newcontainer)
container.add(newcontainer1)
container.add(bottomcontainer)

var quit = newButton("Quit")
var count = newButton("Count")
var inputTextArea = newTextArea("")
var outputTextArea = newTextArea("")

inputTextArea.editable = true
outputTextArea.editable = false


quit.widthMode = WidthMode_Expand
count.widthMode = WidthMode_Expand


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
  outputTextArea.text = intToStr(len(split(inputTextArea.text, ' ')))

quit.onClick = proc(event: ClickEvent) =
  app.quit()


proc runcount*() = 
  win.show()
  app.run()



