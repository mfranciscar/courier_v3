class SquareButton {
  
 // Propietats d'un botó:
 float x, y, w, h;  // Posició i dimensions
 
 // Colors de contorn, farciment, actiu i desactiu
 color fillColor, strokeColor, fillColorOver, fillColorDisabled;    // Icona del botó
 
 String textBoto;
 
 boolean enabled;    // Abilitat / desabilitat
 
 // Mètode Constructor
 SquareButton(String textBoto, float x, float y, float w, float h){
   this.textBoto = textBoto;
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.enabled = true;
   fillColor = color(getColorAt(2));
   fillColorOver = color(getSecondColor());
   fillColorDisabled = color(getFirstColor());
 }
 
 // Setters
 
 void setEnabled(boolean b){
   this.enabled = b;
 }
 
 
 // Dibuixa el botó
 void display(){
   pushStyle();
   if(!enabled){
     fill(fillColorDisabled);  // Color desabilitat
   }
   else if(mouseOverButton()){
     fill(fillColorOver);      // Color quan ratolí a sobre
   }
   else{
     fill(fillColor);          // Color actiu però ratolí fora
   }
   noStroke();        //Color i gruixa del contorn
   rectMode(CENTER); strokeWeight(2); stroke(getFirstColor()); 
   rect(this.x, this.y, this.w, this.h, 10);   // Rectangle del botó
   
   textAlign(CENTER); textFont(getFontAt(1)); fill(getFirstColor()); textSize(18);
   text(textBoto, this.x , this.y + 5);
   popStyle();
 }
 
 // Indica si el cursor està sobre el botó
 boolean mouseOverButton(){
   return mouseX >= this.x - this.w/2 && mouseX <= this.x + 100 &&
          mouseY >= this.y - this.h/2 && mouseY <= this.y + this.h/2; 
 }
  
}
