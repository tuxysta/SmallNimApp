
import nigui, strutils, os, math, random


type CustomButton1 = ref object of Button
method handleDrawEvent(control: CustomButton1, event: DrawEvent) =
  let canvas = event.control.canvas
  canvas.areaColor = rgb(0, 255, 255)
  canvas.textColor = rgb(255,255, 255)
  canvas.lineColor = rgb(255, 255, 255)
  canvas.drawRectArea(0, 0, control.width, control.height)
  canvas.drawTextCentered(control.text)
  canvas.drawRectOutline(0, 0, control.width, control.height)

type CustomButton2 = ref object of Button
method handleDrawEvent(control: CustomButton2, event: DrawEvent) =
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
  var w = newWindow("game")
  w.height = 500
  w.width = 500





  var container = newLayoutContainer(Layout_Vertical)
  var file1 = newLayoutContainer(Layout_Horizontal)
  var file2 = newLayoutContainer(Layout_Horizontal)
  file2.height = 250


  w.add(container)
  
  container.add(file1)
  container.add(file2)

  var quit = newButton("Quit")
  quit.widthMode = WidthMode_Expand

  file1.add(quit)
  var text1 = newButton()
  text1.widthMode = WidthMode_Expand
  file1.add(text1)
  var text = newTextArea()
  text.editable = true
  file2.add(text)




  quit.onClick = proc(event: ClickEvent) =
    app.quit()

  #but.onClick = proc(event: ClickEvent) =
    ##try:
    ##except Exception:
      ##app.quit()
      ##app.run()

  if Key_Q.isDown() and Key_ControlL.isDown():
    app.quit()
  w.show()
  app.run()

run1()
