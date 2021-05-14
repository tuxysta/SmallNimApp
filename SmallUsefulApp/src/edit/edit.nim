#The MIT License (MIT)
#Copyright © 2021 <Baram Rosenstock>

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


import nigui, strutils, os
proc run*() =
  app.init()
  var w = newWindow("Edit")
  w.height = 500
  w.width = 500



  var container = newLayoutContainer(Layout_Vertical)
  var instruction = newLayoutContainer(Layout_Horizontal)
  instruction.width = 500
  instruction.height = 10
  var filepath = newLayoutContainer(Layout_Horizontal)
  filepath.width = 500
  filepath.height = 20
  var file1 = newLayoutContainer(Layout_Horizontal)
  var file2 = newLayoutContainer(Layout_Horizontal)





  w.add(container)
  container.add(instruction)
  container.add(filepath)
  container.add(file1)
  container.add(file2)
  



  var instruct = newTextArea("Write the path of a text file in the bar below. Then press the file button. Keep the path in the bar! Edit in the big area, then press save. This only works if you have the path in the bar.")
  instruction.add(instruct)
  instruct.editable = false

  var filepath1 = newTextArea()
  filepath.add(filepath1)
  filepath1.editable = true

  var but = newButton("File")
  file2.add(but)

  var area = newTextArea()
  file1.add(area)

  var save = newButton("Save")
  file2.add(save)




  but.onClick = proc(event: ClickEvent) =
    area.text = readFile(filepath1.text)

  save.onClick = proc(event: ClickEvent) =
    removeFile(filepath1.text)
    writeFile(filepath1.text, area.text)

  
  w.show()
  app.run()


