
#The MIT License (MIT)
#Copyright © 2021 <Baram Rosenstock>

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


import nigui
from strutils import toUpper, parseInt


 
proc caesar(s: string, k: int, decode = false): string =
  var k = if decode: 26 - k else: k
  var result = ""
  for i in toUpper(s):
    if ord(i) >= 65 and ord(i) <= 90:
      result.add(chr((ord(i) - 65 + k) mod 26 + 65))
  return result;

     

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
  var file3 = newLayoutContainer(Layout_Vertical)
  var file4 = newLayoutContainer(Layout_Horizontal)
  w.add(container)
  file4.height = 750
  file3.height = 100
  file1.height = 5
  container.add(file1)

  container.add(file3)
  container.add(file2)
  container.add(file4)


  var quit = newButton("Quit")
  var decrypt = newButton("Decrypt")
  var but = newButton("Press this button when you have inputed text and key and are ready to encrypt. The bottom input is key, the top is text.")
  but.fontSize = 12
  but.widthMode = WidthMode_Expand
  quit.widthMode = WidthMode_Expand
  decrypt.widthMode = WidthMode_Expand
  file1.add(decrypt)
  file2.add(but)
  file1.add(quit)


  var text1 = newTextArea()
  text1.editable = true
  file3.add(text1)

  var text2 = newTextArea()
  text1.editable = true
  file3.add(text2)

  var text3 = newTextArea()
  text3.editable = false
  file4.add(text3)
  var decode = false;



  quit.onClick = proc(event: ClickEvent) =
    app.quit()
  
  
  
  decrypt.onClick = proc(event: ClickEvent) =
    decode = true;


  but.onClick = proc(event: ClickEvent) =
    try:

      text3.text = caesar(text1.text, text2.text.parseInt(), decode)
    except Exception:
      app.quit()
      app.run()

  if Key_Q.isDown() and Key_ControlL.isDown():

    app.quit()
  
  w.show()
  app.run()

