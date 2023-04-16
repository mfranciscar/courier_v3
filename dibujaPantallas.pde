TextField userText, passwordText, cercador;
TextField addNameList, addNameMovie, addNameDirector, addActors;
TextArea addDescription;

void dibujaPantallaLogIn(){
  pushStyle();
  fill (getFirstColor());
  rect(width/2 - 300, height/2 - 150, 600, 400, 10);
  image(icona1, width/2, height/2-60, 90, 90);
  
  textFont(getFontAt(1)); fill(getThirdColor()); textSize(24); textAlign(LEFT);
  text("USUARIO:", width/2-250, height/2+15);
  text("CONTRASEÑA:", width/2-250, height/2+105);
  
  if(pantalla == PANTALLA.LOG_IN){
    portada.setEnabled(false);
    userText.display();
    passwordText.display();
    logIn.display();
    userText.isPressed();
    passwordText.isPressed();
    
    pantalla_addLista.setEnabled(false);
    pantalla_addMovie.setEnabled(false);
    popStyle();

  }
  
}


void dibujaPantallaInicio(){
  
  
  if(pantalla == PANTALLA.INICIO){
    
    portada.setEnabled(false);
    p.setVisible(false);
    c.display();
    
    cercador.display();
    buscar.display();
    updateCursor();
  }
  
}



void dibujaPantallaAddMovie(){
  if(pantalla == PANTALLA.ADD_MOVIE){
    pushStyle();
    
    p.setVisible(false);
    portada.setEnabled(true);
    rectMode(CENTER);
    fill(getFirstColor());
    rect(width/2, height/2+40, 800, 480, 20);
    
    crearMovie.display();
    fill(getThirdColor()); textFont(getFontAt(1)); textSize(20); textAlign(LEFT);
    text("TÍTULO", width/2-60, 235);
    addNameMovie.display();
    text("DIRECTOR", width/2-60, 310);
    text("AÑO", width/2-60, height/2+60);
    text("ESTADO", width/2-60, height/2+15);
    addNameDirector.display();
    text("GÉNERO", width/2-60, height/2+110);
    text("PUNTUACIÓN", width/2-60, height/2+170);
    estrelletes.display();
    anys.display();
    portada.display();
    genere.display();
    estado.display();
    
    p.display();
    p.setEnabled(true);
    
    
    updateCursor();
    
    
    if(img!=null){
      image(img, width/2-230, height/2+40, 260, 400);
      textSize(34); textAlign(RIGHT);
      text(titol, 750, 750);
    }
    
    
    popStyle();
    
  }
}

void dibujaPantallaMovieCard(){
  if(pantalla == PANTALLA.MOVIE_CARD){
    pushStyle();
    
    portada.setEnabled(false);
    
    fill(getFirstColor());
    rect(0, 121, 250, 645);
    
    seen.display();
    to_see.display();
    
    rectMode(CORNER);
    fill(getThirdColor()); stroke(getFirstColor()); strokeWeight(3);
    rect(330, 170, 950, 530);
    String prova = "seven.png";
    PImage prova1 = loadImage(prova);
    textAlign(LEFT);
    textFont(getSecondFont()); fill(0); textSize(34); 
    text("Título: Seven", 750, 250);
    textFont(getFontAt(2)); fill(0); textSize(25);
    text("Director: David Fincher", 750, 300);
    text("Año de publicación: 1995", 750, 360);
    text("Género: Drama", 750, 420);
    text("Valoración:", 750, 480);
    rectMode(CORNER);
    image(prova1, 550, 430, 300, 420);
    valor.display();
    
    popStyle();
    
  }
}

void dibujaPantallaListas(){
  if(pantalla == PANTALLA.LISTAS){
    pushStyle();
    
    portada.setEnabled(false);
    
    fill(getFirstColor());
    rect(0, 121, 250, 645);
    
    seen.display();
    to_see.display();
    
    cercador.display();
    buscar.display();
    
    updateCursor();
    
    popStyle();
  }
}

void dibujaPantallaVistas(){
  if(pantalla == PANTALLA.PELIS_VISTAS){
    pushStyle();
    
    portada.setEnabled(false);
    
    fill(getFirstColor());
    rect(0, 121, 250, 645);
    
    seen.display();
    to_see.display();
    
    Seven.display();
    
    vistas.display(260, 131, 1090, 600);
    next.display(); prev.display();
    
    cercador.display();
    buscar.display();
    
    updateCursor();
    
    popStyle();
    
  }
}

void dibujaPantallaPendientes(){
  if(pantalla == PANTALLA.PELIS_PENDIENTES){
    pushStyle();
    
    portada.setEnabled(false);
    
    fill(getFirstColor());
    rect(0, 121, 250, 645);
    
    seen.display();
    to_see.display();
    
    pendientes.display(260, 131, 1090, 600);
    next.display(); prev.display();
    
    cercador.display();
    buscar.display();
    
    updateCursor();
    
    popStyle();
  }
}
