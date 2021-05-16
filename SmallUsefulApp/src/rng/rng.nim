
#
#The MIT License (MIT)
#Copyright © 2021 <Baram Rosenstock>

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import nigui
from random import randomize, rand
from strutils import parseInt, inttoStr

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

proc run1*() =
  app.init()
  var w = newWindow("random")
  w.height = 1000
  w.width = 1000





  var container = newLayoutContainer(Layout_Vertical)
  var file1 = newLayoutContainer(Layout_Horizontal)
  var file2 = newLayoutContainer(Layout_Horizontal)
  var file3 = newLayoutContainer(Layout_Horizontal)
  var file4 = newLayoutContainer(Layout_Horizontal)
  var file5 = newLayoutContainer(Layout_Horizontal)
  var file6 = newLayoutContainer(Layout_Horizontal)

  w.add(container)
  file1.height = 5
  file2.height = 30
  file3.height = 30
  file4.height = 17
  file6.height = 15
  container.add(file1)
  container.add(file2)
  container.add(file3)
  container.add(file4)
  container.add(file5)
  container.add(file6)

  var quit = newButton("Quit")
  var button = newButton("Generate a random int between the two ints you inputed above. They have to be valid ints.")
  button.widthMode = WidthMode_Expand
  quit.widthMode = WidthMode_Expand
  file4.add(button)
  file1.add(quit)

  var text = newTextArea()
  text.editable = false
  text.fontSize = 48
  file5.add(text)


  var text1label = newButton("Small number on top, big number below.")
  text1label.widthMode = WidthMode_Expand

  file6.add(text1label)
  var text1 = newTextArea()
  text1.editable = true
  file2.add(text1)
  var text2 = newTextArea()
  file3.add(text2)
  text2.editable = true




  quit.onClick = proc(event: ClickEvent) =
    app.quit()

  button.onClick = proc(event: ClickEvent) =
    try:
      var a = parseInt(text1.text) 
      var b = parseInt(text2.text)
      randomize()
      text.text = intToStr((rand(a..b)))
    except Exception:
      app.quit()
      app.run()

  if Key_Q.isDown() and Key_ControlL.isDown():
    app.quit()
  w.show()
  app.run()

run1()
