
#
#The MIT License (MIT)
#Copyright © 2021 <Baram Rosenstock>

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import nigui, strutils, os, math, random
proc run1*() =
  app.init()
  var w = newWindow("random")
  w.height = 500
  w.width = 500





  var container = newLayoutContainer(Layout_Vertical)
  var file2 = newLayoutContainer(Layout_Horizontal)
  var file3 = newLayoutContainer(Layout_Horizontal)
  var file4 = newLayoutContainer(Layout_Horizontal)
  var file5 = newLayoutContainer(Layout_Horizontal)
  var file6 = newLayoutContainer(Layout_Horizontal)

  w.add(container)
  file4.width = 500
  file3.width = 500
  file4.height = 30
  file3.height = 30

  file6.width = 500
  file6.height = 15
  container.add(file6)

  container.add(file3)
  container.add(file4)
  container.add(file2)
  container.add(file5)


  var but = newButton("Generate a random int between the two ints you inputed above. They have to be valid ints.")
  but.widthMode = WidthMode_Expand
  file2.add(but)
  var text = newTextArea()
  text.editable = false
  text.fontSize = 48
  file5.add(text)

  var text1label = newTextArea("Small number on top, big number below.")
  text1label.editable = false
  file6.add(text1label)
  var text1 = newTextArea()
  text1.editable = true
  file3.add(text1)
  var text2 = newTextArea()
  file4.add(text2)
  text2.editable = true






  but.onClick = proc(event: ClickEvent) =

    var a = parseInt(text1.text) 
    var b = parseInt(text2.text)
    text.text = intToStr((rand(a..b)))
  w.show()
  app.run()

