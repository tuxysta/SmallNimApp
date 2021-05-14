#I have to include https://github.com/trustable-code/NiGui/blob/master/license.md

from calc/calc import win
import os, nigui, strutils, parseutils, math
from  edit/edit import run
from  rng/rng import run1


app.init()

var window = newWindow("Go here to satisfy the MIT license. https://github.com/trustable-code/NiGui/blob/master/license.md")
window.height = 200
window.width = 200

var con = newLayoutContainer(Layout_Vertical)
var middleCon = newLayoutContainer(Layout_Horizontal)

var middleCon1 = newLayoutContainer(Layout_Horizontal)
middleCon.height = 100
middleCon1.height = 100
window.add(con)
con.add(middleCon)
con.add(middleCon1)



var but1 = newButton("Calc")
var but2 = newButton("Edit")
var but3 = newButton("Random")
var but4 = newButton("Quit")


but1.widthMode = WidthMode_Expand
but2.widthMode = WidthMode_Expand
but3.widthMode = WidthMode_Expand
but4.widthMode = WidthMode_Expand


middleCon.add(but1)
middleCon.add(but2)
middleCon1.add(but3)
middleCon1.add(but4)




but1.onClick = proc(event: ClickEvent) =
  calc.win()
but2.onClick = proc(event: ClickEvent) =
  edit.run()

but3.onClick = proc(event: ClickEvent) =
  rng.run1()

but4.onClick = proc(event: ClickEvent) =
  app.quit()
if Key_Q.isDown() and Key_ControlL.isDown():
    app.quit()


window.show()
app.run()