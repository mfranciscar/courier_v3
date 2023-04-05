// Classe Counter

class Counter {
  
  // Valor del comptador
  int value = 2000;
  int minValue = 1900, maxValue = 2023;
  int stepValue = 1;
  
 // Propietats d'un counter:
 float x, y, w, h;  // Posició i dimensions
 
 // Colors de farciment i contorn
 color fillColor, strokeColor;
 
 PImage iconaMes, iconaMenys;       // Icones del botó

 
 // Mètode Constructor
 Counter(PImage iconaMes, PImage iconaMenys, float x, float y, float w, float h){
   this.iconaMes = iconaMes;
   this.iconaMenys = iconaMenys;
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   fillColor = color(155, 155, 155);
   strokeColor = color(0);
 }
 
 int getValue(){
   return this.value;
 }
 
 // Setters
 
 void setInitialValue(int n){
   this.value = n;
 }
 
 void setValues(int minValue, int maxValue){ 
   this.minValue = minValue; 
   this.maxValue = maxValue;
 }
 
 // Dibuixa el botó
 void display(){
   
   pushStyle();
   fill(getThirdColor());                            // Color 
   noStroke();      //Color i gruixa del contorn
   rect(this.x, this.y, this.w + 2*this.h, this.h, 5);   // Rectangle del botó
   
   fill(0); textFont(getFontAt(2)); textSize(20); textAlign(LEFT);
   text(value, 765, height/2+50);
   
   // Icona del botó
   fill(getThirdColor()); noStroke();
   rect(this.x + 110, this.y, this.h, this.h, 5);
   image(iconaMes, this.x + 110, this.y, this.h, this.h);
   fill(getThirdColor());
   rect(this.x + 150, this.y, this.h, this.h, 5);
   image(iconaMenys, this.x + 150, this.y, this.h, this.h);
   
   popStyle();
 }
 
 void resetValue(){
   this.value = this.minValue;
 }
 
 boolean mouseOverButtons(){
   return mouseOverButtonMes() || mouseOverButtonMenys();
 }
 
 // Indica si el cursor està sobre el botó Més
 boolean mouseOverButtonMes(){
   return mouseX >= this.x + this.w && mouseX <= this.x + this.w + this.h &&
          mouseY >= this.y && mouseY <= this.y + this.h; 
 }
 
 // Indica si el cursor està sobre el botó Menys
 boolean mouseOverButtonMenys(){
   return mouseX >= this.x + this.w + this.h && mouseX <= this.x + this.w + 2*this.h &&
          mouseY >= this.y && mouseY <= this.y + this.h; 
 }
 
 void increment(){
   this.value += stepValue;
   if(this.value>this.maxValue){
     this.value = this.maxValue;
   }
 }
 
 void decrement(){
   this.value -= stepValue;
   if(this.value<this.minValue){
     this.value = this.minValue;
   }
 }
 
 void update(){
   if(mouseOverButtonMes()){
     increment();
   }
   else if(mouseOverButtonMenys()){
     decrement();
   }
 }
  
}
