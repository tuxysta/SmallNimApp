
#
#The MIT License (MIT)
#Copyright © 2021 <Protonfire0>

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


import os, nigui, strutils, parseutils, math, random, times

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

var win = newWindow("Calc")
win.height = 1000
win.width = 1000

var container = newLayoutContainer(Layout_Vertical)
var newcontainer1 = newLayoutContainer(Layout_Horizontal)
var sidecontainer1 = newLayoutContainer(Layout_Horizontal)
var sidecontainer = newLayoutContainer(Layout_Horizontal)
var bottomContainer = newLayoutContainer(Layout_Horizontal)
var topContainer = newLayoutContainer(Layout_Horizontal)
newcontainer1.height = 20


win.add(container)
container.add(newcontainer1)
container.add(sidecontainer1)
container.add(sidecontainer)
container.add(topContainer)
container.add(bottomContainer)

var inputTextArea = newTextArea("")
var outputTextArea = newTextArea("")

inputTextArea.fontFamily = "Courier New"
outputTextArea.fontFamily = "Courier New"
inputTextArea.fontSize = 18
outputTextArea.fontSize = 18

inputTextArea.editable = true
outputTextArea.editable = false

var fbutton6 = newButton("Guess a number between 0 and 1000")
var fbutton7 = newButton("Guess")



fbutton6.widthMode = WidthMode_Expand
fbutton7.widthMode = WidthMode_Expand


fbutton6.fontSize = 36
fbutton7.fontSize = 36

randomize() 
var a = rand(1000)

proc bar() =

  if a > inputTextArea.text.parseInt():
    outputTextArea.text = "Too small"
  if a < inputTextArea.text.parseInt():
    outputTextArea.text = "Too big"
  if a == inputTextArea.text.parseInt():
    outputTextArea.text = "Just right!!"



var quit = newButton("Quit")
quit.widthMode = WidthMode_Expand

newcontainer1.add(quit)
topContainer.add(inputTextArea)
sidecontainer.add(fbutton7)
sidecontainer1.add(fbutton6)
bottomContainer.add(outputTextArea)

fbutton7.onClick = proc(event: ClickEvent) =
  randomize() 


fbutton7.onClick = proc(event: ClickEvent) =

  try:

    bar()
  except Exception:
    app.quit()
    app.run()
 

quit.onClick = proc(event: ClickEvent) =

  app.quit()

if Key_Q.isDown() and Key_ControlL.isDown():
  app.quit()




proc rungame*() =
  win.show()
  app.run()