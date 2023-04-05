// Component Camp de Text

class TextField {
  
  // Propietats del camp de text
  int x, y, h, w;
  
  // Colors
  color bgColor = color(getThirdColor());
  color fgColor = color(getThirdColor());
  color selectedColor = color(getSecondColor());
  
  // Text del camp
  String text = "";
  int textLength = 0;
  int textSize = 30;

  boolean selected = false;
   
  // Constructor
  TextField(int x, int y, int w, int h) {
      this.x = x; this.y = y; this.w = w; this.h = h;
   }
  
  // Dibuixa el Camp de Text
  void display() {

      pushStyle();
      if (selected) {
         fill(selectedColor);
      } else {
         fill(bgColor);
      }
      
      noStroke();
      rectMode(CORNER);
      rect(x, y, w, h, 5);
      
      fill(0); textAlign(LEFT);
      textSize(22); textFont(getFontAt(2));
      text(this.text, x + 10, y + textSize - 5);
      popStyle();
   }
   
   String getValue(){
     return this.text;
   }
   
   // Afegeix, lleva el text que es tecleja
   void keyPressed(char key, int keyCode) {
      if (this.selected) {
         if (keyCode == (int)BACKSPACE) {
            removeText();
         } else if (keyCode == 32) {
            addText(' '); // SPACE
         } else {
            
           boolean isKeyCapitalLetter = (key >= 'A' && key <= 'Z');
           boolean isKeySmallLetter = (key >= 'a' && key <= 'z');
           boolean isKeyNumber = (key >= '0' && key <= '9');
           
      
           if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
               addText(key);
           }
         }
      }
   }
   
   void removeAllText(){
     this.text = "";
   }
   
   // Afegeix la lletra c al final del text
   void addText(char c) {
         this.text += c;
         textLength++;
   }
   
   // Lleva la darrera lletra del text
   void removeText() {
      if (textLength - 1 >= 0) {
         text = text.substring(0, textLength - 1);
         textLength--;
      }
   }

   // Indica si el ratolí està sobre el camp de text
   boolean mouseOverTextField() {
      if (mouseX >= this.x && mouseX <= this.x + this.w) {
         if (mouseY >= this.y && mouseY <= this.y + this.h) {
            return true;
         }
      }
      return false;
   }
   
   // Selecciona el camp de text si pitjam a sobre
   // Deselecciona el camp de text si pitjam a fora
   void isPressed() {
      if (mouseOverTextField()) {
         this.selected = true;
      } else {
         this.selected = false;
      }
   }
}
