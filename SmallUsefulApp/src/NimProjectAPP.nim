
#
#The MIT License (MIT)
#Copyright © 2021 <Baram Rosenstock>

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

from calc/calc import winq
import nigui
from  rng/rng import run1
from NumberGuess/game import winl
from encrypttext/encrypttext import run1


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

var window = newWindow("Choose!")
window.height = 300
window.width = 400

var con = newLayoutContainer(Layout_Vertical)
var middleCon = newLayoutContainer(Layout_Horizontal)
var middleCon1 = newLayoutContainer(Layout_Horizontal)
var middleCon2 = newLayoutContainer(Layout_Horizontal)

middleCon.height = 100
middleCon1.height = 100
middleCon2.height = 100

window.add(con)
con.add(middleCon)
con.add(middleCon1)
con.add(middleCon2)




var but1 = newButton("Calc")
var but2 = newButton("Guessing Game")
var but3 = newButton("Random")
var but4 = newButton("Encrypt")
var but5 = newButton("Quit")




but1.widthMode = WidthMode_Expand
but2.widthMode = WidthMode_Expand
but3.widthMode = WidthMode_Expand
but4.widthMode = WidthMode_Expand
but5.widthMode = WidthMode_Expand



middleCon.add(but1)
middleCon.add(but2)
middleCon1.add(but3)
middleCon1.add(but4)
middleCon2.add(but5)





but1.onClick = proc(event: ClickEvent) =
  calc.winq()
  window.dispose()

but2.onClick = proc(event: ClickEvent) =
  game.winl()
  window.dispose()


but3.onClick = proc(event: ClickEvent) =
  rng.run1()
  window.dispose()


but4.onClick = proc(event: ClickEvent) =
  encrypttext.run1()
  window.dispose()

but5.onClick = proc(event: ClickEvent) =
  app.quit()
  
if Key_Q.isDown() and Key_ControlL.isDown():
  app.quit()


window.show()
app.run()


