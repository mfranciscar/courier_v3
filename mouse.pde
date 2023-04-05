void mousePressed(){
  
  if(pantalla==PANTALLA.INICIO){
    cercador.isPressed();
    c.checkButtons();
  }
  
  if(b1.mouseOverButton() && b1.enabled){
    bgColor = color(255, 0, 0);
    pantalla = PANTALLA.INICIO;
  }
  
  if(rb1.mouseOverButton() && rb1.enabled){
    rb1.setEnabled(false);
    rb2.setEnabled(true);
    rb3.setEnabled(true);
    pantalla = PANTALLA.LOG_IN;
    
  }
  
  else if(rb2.mouseOverButton() && rb2.enabled){
    rb2.setEnabled(false);
    rb1.setEnabled(true);
    rb3.setEnabled(true);
    pantalla = PANTALLA.ADD_BUTTON;
  }
  
  else if(rb3.mouseOverButton() && rb3.enabled){
    rb3.setEnabled(false);
    rb2.setEnabled(true);
    rb1.setEnabled(true);
  }
  else if(logIn.mouseOverButton() && logIn.enabled){
    if(comprovaLogin()){
      pantalla = PANTALLA.INICIO;
    }
  }
  else if(crearLista.mouseOverButton() && crearLista.enabled){
    bgColor = color(255);
    pantalla = PANTALLA.INICIO;
  }
  
  if(genere.mouseOverSelect() && genere.enabled){
    if(!genere.collapsed){
      genere.update();    // Fer acció amb valor
    }
    genere.toggle();        // Plegar o desplegar
  }
  
  if(portada.mouseOverButton() && portada.enabled){
    // Obrim el dialeg
    selectInput("Selecciona una imatge ...", "fileSelected");
  }
  
  if(pantalla_addLista.mouseOverButton() && pantalla_addLista.enabled){
    pantalla = PANTALLA.ADD_LISTA;
  }
  
  if(pantalla_addMovie.mouseOverButton() && pantalla_addMovie.enabled){
    bgColor = color(255, 0, 0);
    pantalla = PANTALLA.ADD_MOVIE;
  }
  
  userText.isPressed();
  passwordText.isPressed();
  addNameList.isPressed();
  
  addNameMovie.isPressed();
  addDescription.isPressed();
  addNameDirector.isPressed();
  addActors.isPressed();
  
  updateCursor();
  
  anys.update();
  estrelletes.checkMouse();
  
  
   if(crearMovie.mouseOverButton() && crearMovie.enabled){

     // Agafar els valors dels camps del formulari
     String valorYear = String.valueOf(anys.getValue());
     String valorNom = addNameMovie.getValue();
     String valorDirector = addNameDirector.getValue();
     String valorGenero = genere.selectedValue();
     int numEstrellas = estrelletes.getNumSelected();    
     
    // Inserir a la BBDD
    
    // Resetear camps del formulari    
    insertInfoTaulapelicula(valorNom, valorYear, valorDirector, valorGenero, numEstrellas);
    p.setVisible(true);
    resetFormulari();
    
  }
  
  
  else if(crearMovie.mouseOverButton() && crearMovie.enabled){
    // Resetear camps del formulari
    resetFormulari();
    
  }
  
  if(p.bAceptar.mouseOverButton() && p.bAceptar.enabled){
    p.setVisible(false);
    pantalla = PANTALLA.INICIO;
  }
  else {
    p.setVisible(true);
  }
  
}

void resetFormulari(){
    anys.resetValue();
    addNameMovie.removeAllText();
    addNameDirector.removeAllText();
}
  

// Modifica el cursor
void updateCursor(){
  
  if((b1.mouseOverButton() && b1.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
  if((rb1.mouseOverButton() && rb1.enabled)||
     (rb2.mouseOverButton() && rb2.enabled)||
     (rb3.mouseOverButton() && rb3.enabled)){
     cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
  if(anys.mouseOverButtons()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
  if(c.checkCursor()){
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }
  
}

void keyPressed() {
    if(pantalla == PANTALLA.LOG_IN){
       userText.keyPressed(key, (int)keyCode);
       passwordText.keyPressed(key, (int)keyCode);
    }
    else if(pantalla == PANTALLA.INICIO){
       cercador.keyPressed(key, (int)keyCode);
       if (keyCode==LEFT){
           c.prev();
       }
       else if(keyCode==RIGHT){
           c.next();
       }
    }
    else if(pantalla == PANTALLA.ADD_LISTA){
       addNameList.keyPressed(key, (int)keyCode);
       addDescription.keyPressed(key, (int)keyCode);
    }
    else if(pantalla == PANTALLA.ADD_MOVIE){
       addNameMovie.keyPressed(key, (int)keyCode);
       addNameDirector.keyPressed(key, (int)keyCode);
       addActors.keyPressed(key, (int)keyCode);
    }
       comprovaLogin();
       
    
}

// Comprova si el login és correcte
boolean comprovaLogin() {
   if (userText.text.equals("admin") && 
       passwordText.text.equals("12345")) {
      return true;
   } else {
      return false;
   }
}
