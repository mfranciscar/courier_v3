class PopUp {
  
  // Dimensions
  float x, y, w, h;
  
 // Propietats
 PImage img;
 String title;
 String message;
 
 SquareButton bAceptar;
 float buttonW = 120;
 float buttonH = 40;
 
 boolean visible = false;
 boolean enabled = false;
 
 // Constructor
 
 PopUp(String title, String message, float x, float y, float w, float h){
   this.title = title;
   this.message = message;
   this.x = x; this.y = y; 
   this.w = w; this.h = h;
   this.bAceptar = new SquareButton("Acceptar", x , y + 100, buttonW, buttonH);
 }
 
 //Setters
 
 void setEnabled(boolean b){
   this.enabled = b;
 }
 
 void setImage(PImage img){
   this.img = img;
 }
 
 void setTexts(String title, String message){
   this.title = title;
   this.message = message;
 }
 
 void setVisible(boolean b){
   this.visible = b;
   if(!this.visible){
     this.bAceptar.setEnabled(false);
   }
   else {
     this.bAceptar.setEnabled(true);
   }
 }
 
 // Dibuixa el PopUp
 
 void display(){
   
   if(this.visible){
     float b = 40;
     
     pushStyle();
     
     // Rectangle
     strokeWeight(5); stroke(getSecondColor());
     fill(getFirstColor());
     rectMode(CENTER);
     rect(x, y, w, h, b/2);
     line(x-w/2, y - h/2 + 2*b , x+w/2, y - h/2 + 2*b);
     
  
     
     fill(getThirdColor()); textSize(20); textAlign(CENTER); textFont(getFontAt(2));
     text(message, x, y - h/2 + 4*b);
     
     fill(getThirdColor()); textSize(16); textAlign(CENTER); textFont(getFontAt(1));
     text(title, x , y - h/2 + 1.3*b);
     
     // Botó d'Acceptar
     bAceptar.display();
     popStyle();
   }
 }
 
  
}
