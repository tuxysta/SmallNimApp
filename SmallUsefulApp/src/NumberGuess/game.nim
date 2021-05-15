
import nigui, strutils, os, math, random


type CustomButton1 = ref object of Button
method handleDrawEvent(control: CustomButton, event: DrawEvent) =
  let canvas = event.control.canvas
  canvas.areaColor = rgb(0, 255, 255)
  canvas.textColor = rgb(255,255, 255)
  canvas.lineColor = rgb(255, 255, 255)
  canvas.drawRectArea(0, 0, control.width, control.height)
  canvas.drawTextCentered(control.text)
  canvas.drawRectOutline(0, 0, control.width, control.height)

type CustomButton2 = ref object of Button
method handleDrawEvent(control: CustomButton, event: DrawEvent) =
  let canvas = event.control.canvas
  canvas.areaColor = rgb(255, 0, 0)
  canvas.textColor = rgb(55, 55, 55)
  canvas.lineColor = rgb(255, 255, 255)
  canvas.drawRectArea(0, 0, control.width, control.height)
  canvas.drawTextCentered(control.text)
  canvas.drawRectOutline(0, 0, control.width, control.height)
  
proc newButton(text = ""): Button =
  result = new CustomButton1
  result.init()
  result.text = text
 

proc newButton1(text = ""): Button =
  result = new CustomButton2
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
  file4.height = 30
  file3.height = 30
  file1.height = 5
  file6.height = 15
  container.add(file1)
  container.add(file6)

  container.add(file3)
  container.add(file4)
  container.add(file2)
  container.add(file5)

  var quit = newButton("Quit")
  var but = newButton("Generate a random int between the two ints you inputed above. They have to be valid ints.")
  but.widthMode = WidthMode_Expand
  quit.widthMode = WidthMode_Expand
  file2.add(but)
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
  file3.add(text1)
  var text2 = newTextArea()
  file4.add(text2)
  text2.editable = true




  quit.onClick = proc(event: ClickEvent) =
    app.quit()

  but.onClick = proc(event: ClickEvent) =
    try:
     
    except Exception:
      app.quit()
      app.run()

  if Key_Q.isDown() and Key_ControlL.isDown():
    app.quit()
  w.show()
  app.run()

run1()
