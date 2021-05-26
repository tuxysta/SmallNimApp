
#
#The MIT License (MIT)
#Copyright © 2021 <Protonfire0>

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


import os, nigui
from strutils import parseInt, parseFloat, formatFloat, intToStr
from math import log10, round

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
var newcontainer = newLayoutContainer(Layout_Horizontal)
var sidecontainer = newLayoutContainer(Layout_Horizontal)
var sidecontainer1 = newLayoutContainer(Layout_Horizontal)
var topContainer = newLayoutContainer(Layout_Horizontal)
var topContainer1 = newLayoutContainer(Layout_Horizontal)
var middleContainer = newLayoutContainer(Layout_Horizontal)
var middleContainer1 = newLayoutContainer(Layout_Horizontal)
var bottomContainer = newLayoutContainer(Layout_Horizontal)
newcontainer.width = 1000
newcontainer.height = 50
newcontainer1.height = 20


win.add(container)
container.add(newcontainer1)
container.add(newcontainer)
container.add(sidecontainer1)
container.add(topContainer)
container.add(topContainer1)
container.add(middleContainer)
container.add(middleContainer1)
container.add(sideContainer)
container.add(bottomContainer)
var inputTextAreaLabel = newTextArea("The two boxes under this hold two numbers, refered to as they. The top box one is operated on, and the bottom one is used to operate. If there is a one number operation, the top box is used. You can infer te rest from the buttons. If not, request help from google or me.")
var inputTextArea = newTextArea("")
var inputTextArea1 = newTextArea("")
var outputTextArea = newTextArea("")
inputTextArea.fontFamily = "Courier New"
inputTextArea1.fontFamily = "Courier New"
outputTextArea.fontFamily = "Courier New"
inputTextAreaLabel.fontFamily = "Courier New"

inputTextAreaLabel.fontSize = 18
inputTextArea.fontSize = 18
inputTextArea1.fontSize = 18
outputTextArea.fontSize = 18

inputTextAreaLabel.editable = false
inputTextArea.editable = true
inputTextArea1.editable = true
outputTextArea.editable = false

var fbutton = newButton("FloatMath")
var fbutton1 = newButton("+")
var fbutton2 = newButton("-")
var fbutton3 = newButton("*")
var fbutton4 = newButton("/")
var fbutton5 = newButton("n^2")
var fbutton6 = newButton("n^3")
var fbutton7 = newButton("log10")

fbutton.widthMode = WidthMode_Expand
fbutton1.widthMode = WidthMode_Expand
fbutton2.widthMode = WidthMode_Expand
fbutton3.widthMode = WidthMode_Expand
fbutton4.widthMode = WidthMode_Expand
fbutton5.widthMode = WidthMode_Expand
fbutton6.widthMode = WidthMode_Expand
fbutton7.widthMode = WidthMode_Expand

fbutton.fontSize = 36
fbutton1.fontSize = 36
fbutton2.fontSize = 36
fbutton3.fontSize = 36

fbutton4.fontSize = 36
fbutton5.fontSize = 36
fbutton6.fontSize = 36
fbutton7.fontSize = 36


var quit = newButton("Quit")
var pibutton = newButton("pi")
var ebutton = newButton("e")
pibutton.widthMode = WidthMode_Expand
ebutton.widthMode = WidthMode_Expand
quit.widthMode = WidthMode_Expand

ebutton.fontSize = 18
pibutton.fontSize = 18



newcontainer1.add(quit)
newcontainer.add(inputTextAreaLabel)
sideContainer.add(pibutton)
sideContainer.add(ebutton)
topContainer.add(inputTextArea)
topContainer1.add(inputTextArea1)
middleContainer1.add(fbutton)
middleContainer1.add(fbutton1)
middleContainer1.add(fbutton2)
middleContainer1.add(fbutton3)
middleContainer1.add(fbutton4)
sidecontainer1.add(fbutton5)
sidecontainer1.add(fbutton6)
sidecontainer1.add(fbutton7)
bottomContainer.add(outputTextArea)


var floattrue = false;
fbutton.onClick = proc(event: ClickEvent) =
  try:
    if floattrue == true:
      floattrue = false;
    else:
      floattrue = true;
  except Exception:
    app.quit()
    app.run()
fbutton1.onClick = proc(event: ClickEvent) =
  try:
    if floattrue:
      outputTextArea.text = (inputTextArea.text.parseFloat() + inputTextArea1.text.parseFloat()).formatFloat()
    else:
      outputTextArea.text = intToStr(inputTextArea.text.parseInt() + inputTextArea1.text.parseInt())
  except Exception:

    app.quit()
    app.run()


fbutton2.onClick = proc(event: ClickEvent) =
  try:
    if floattrue:
      outputTextArea.text = (inputTextArea.text.parseFloat() - inputTextArea1.text.parseFloat()).formatFloat()
    else:
      outputTextArea.text = intToStr(inputTextArea.text.parseInt() - inputTextArea1.text.parseInt())

  except Exception:
    app.quit()
    app.run()


fbutton3.onClick = proc(event: ClickEvent) =
  try:
    if floattrue:
      outputTextArea.text = (inputTextArea.text.parseFloat() * inputTextArea1.text.parseFloat()).formatFloat()
    else:
      outputTextArea.text = intToStr(inputTextArea.text.parseInt() * inputTextArea1.text.parseInt())
  except Exception:
    app.quit()
    app.run()


fbutton4.onClick = proc(event: ClickEvent) =
  try:
    if floattrue:
      outputTextArea.text = (inputTextArea.text.parseFloat() / inputTextArea1.text.parseFloat()).formatFloat()
    else:
      outputTextArea.text = intToStr(int(inputTextArea.text.parseInt() / inputTextArea1.text.parseInt()))
  except Exception:
    app.quit()
    app.run()

pibutton.onClick = proc(event: ClickEvent) =

  inputTextArea.text = "3.1415"

ebutton.onClick = proc(event: ClickEvent) =
  inputTextArea.text = "2.7182"

fbutton5.onClick = proc(event: ClickEvent) =
  try:
    if floattrue:
      outputTextArea.text = (inputTextArea.text.parseFloat() * inputTextArea.text.parseFloat()).formatFloat()
    else:
      outputTextArea.text = intToStr(inputTextArea.text.parseInt() * inputTextArea.text.parseInt())
  except Exception:
    app.quit()
    app.run()

fbutton6.onClick = proc(event: ClickEvent) =
  try:
    if floattrue:
      outputTextArea.text = (inputTextArea.text.parseFloat() * inputTextArea.text.parseFloat() * inputTextArea.text.parseFloat()).formatFloat()
    else:
      outputTextArea.text = intToStr(inputTextArea.text.parseInt() * inputTextArea.text.parseInt() * inputTextArea.text.parseInt())
  except Exception:
    app.quit()
    app.run()
fbutton7.onClick = proc(event: ClickEvent) =
  try:
    outputTextArea.text = log10(inputTextArea.text.parseFloat()).formatFloat()

  except Exception:
    app.quit()
    app.run()

quit.onClick = proc(event: ClickEvent) =

  app.quit()

if Key_Q.isDown() and Key_ControlL.isDown():
  app.quit()


proc winq*() = 


  win.show()
  app.run()

