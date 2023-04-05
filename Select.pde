class Select {
  
  float x, y, w, h;          // Posició i dimensions
  String[] texts;            // Valors possibles
  String selectedValue;      // Valor Seleccionat
  
  boolean collapsed = true;  // Plegat / Desplegat
  boolean enabled;           // Abilitat / desabilitat
  
  float lineSpace = 10;      // Espai entre línies
  
  Select(String[] texts, float x, float y, float w, float h){
    
    this.texts = texts;
    this.selectedValue = "";
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.enabled = true;
    this.collapsed = true;
  }
  
  void display(){
    pushStyle();
    noStroke(); rectMode(CORNER);
    rect(x, y, w, h, 5);
    
    fill(getThirdColor());
    rect(x + 215, y, 30, h, 5);
    
    fill(getFirstColor()); noStroke();
    //println(mouseX, mouseY);
    triangle(x+225, y+10, x+235, y+10, x+230, y+20);
   
    fill(0); textAlign(LEFT); textFont(getFontAt(2)); textSize(18);
    text(selectedValue, x+10, y+20);
    
    if(!this.collapsed){
      
      fill(255); stroke(0);
      rectMode(CORNER);
      rect(x, y+h, w, (h + lineSpace)*texts.length);
      
      for(int i=0; i<texts.length; i++){
        
        if(i== clickedOption()){
          fill(200); noStroke();
          rect(x+1, y+4 + h + (h + lineSpace)*i - 2, w-2 , h + lineSpace - 8);
        }
        
        fill(0);
        text(texts[i], x+10, y + 2*h + (h + lineSpace)*i);
      }
    }
    popStyle();
  }
  
  void setCollapsed(boolean b){
    this.collapsed = b;
  }
  
  void toggle(){
    this.collapsed = !this.collapsed;
  }
  
  
  void update(){
    int option = clickedOption();
    selectedValue = texts[option];
  }
  
 // Indica si el cursor està sobre el select
 boolean mouseOverSelect(){
   if(this.collapsed){
     return (mouseX >= x) && 
            (mouseX <= x + w) && 
            (mouseY >= y) && 
            (mouseY <= y + h); 
   }
   else {
     return (mouseX>= x) && 
            (mouseX<= x + w) && 
            (mouseY>= y) && 
            (mouseY<= y + h + (h + lineSpace)*texts.length); 
   }
 }
 
 int clickedOption(){
   int i = (int)map(mouseY, y + h, y + h + (h + lineSpace)*texts.length, 
                            0, texts.length);
   return i;
 }
 
 String selectedValue(){
   return selectedValue;
 }
 
}
