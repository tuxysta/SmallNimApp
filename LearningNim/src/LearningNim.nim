
#
#The MIT License (MIT)
#Copyright © 2021 <Protonfire0>

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
import nigui
from calc/calc import runcalc
from  rng/rng import runrng
from NumberGuess/game import rungame
from encrypttext/encrypttext import runencrypttext
from hash/hash import runHash
from edit/edit import runedit

from WordCount/WordCount import runcount


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
window.height = 370
window.width = 500

var con = newLayoutContainer(Layout_Vertical)
var middleCon = newLayoutContainer(Layout_Horizontal)
var middleCon1 = newLayoutContainer(Layout_Horizontal)
var middleCon2 = newLayoutContainer(Layout_Horizontal)
var bottomCon = newLayoutContainer(Layout_Horizontal)

middleCon.height = 100
middleCon1.height = 100
middleCon2.height = 100
bottomCon.height = 100

window.add(con)
con.add(middleCon)
con.add(middleCon1)
con.add(middleCon2)
con.add(bottomCon)




var but1 = newButton("Calc")
var but2 = newButton("Guessing Game")
var but3 = newButton("Random")
var but4 = newButton("Encrypt")
var but5 = newButton("Hash")
var but6 = newButton("Word Count")
var but7 = newButton("Edit")
var but8 = newButton("Quit")



but1.widthMode = WidthMode_Expand
but2.widthMode = WidthMode_Expand
but3.widthMode = WidthMode_Expand
but4.widthMode = WidthMode_Expand
but5.widthMode = WidthMode_Expand
but6.widthMode = WidthMode_Expand
but7.widthMode = WidthMode_Expand
but8.widthMode = WidthMode_Expand



middleCon.add(but1)
middleCon.add(but2)
middleCon1.add(but3)
middleCon1.add(but4)
middleCon2.add(but5)
middleCon2.add(but6)
bottomCon.add(but7)
bottomCon.add(but8)





but1.onClick = proc(event: ClickEvent) =
  calc.runcalc()
  window.dispose()

but2.onClick = proc(event: ClickEvent) =
  game.rungame()
  window.dispose()


but3.onClick = proc(event: ClickEvent) =
  rng.runrng()
  window.dispose()


but4.onClick = proc(event: ClickEvent) =
  encrypttext.runencrypttext()
  window.dispose()
but5.onClick = proc(event: ClickEvent) =
  hash.runHash()
  window.dispose()
but6.onClick = proc(event: ClickEvent) =
  WordCount.runcount()

but7.onClick = proc(event: ClickEvent) =
  edit.runedit()

but8.onClick = proc(event: ClickEvent) =
  app.quit()
if Key_Q.isDown() and Key_ControlL.isDown():
  app.quit()


window.show()
app.run()


