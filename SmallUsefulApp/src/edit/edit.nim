
#I have to include ""https://github.com/trustable-code/NiGui/blob/master/license.md"."

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


