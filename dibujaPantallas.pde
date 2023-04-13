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
    cercador.display();
    c.display();
    updateCursor();
    //peli.display(100,100,500,300,1);
    buscar.display();
    
  }
  
}

void dibujaPantallaAddButton(){
  
  if(pantalla == PANTALLA.ADD_BUTTON){
    
    pushStyle();
    
    portada.setEnabled(false);
    p.setVisible(false);
    cercador.display();
    c.display();
    pantalla_addLista.display();
    pantalla_addMovie.display();
    
    pantalla_addLista.setEnabled(true);
    pantalla_addMovie.setEnabled(true);
    updateCursor();

    popStyle();
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
    
    rectMode(CENTER);
    fill(getFirstColor());
    rect(width/2, height/2+50, 800, 400, 20);
    
    crearMovie.display();
    fill(getFirstColor()); textFont(getFontAt(1)); textSize(18); textAlign(LEFT);
    text("Crear película",width/2+42, height/2+205);
    
    fill(getThirdColor()); textFont(getFontAt(1)); textSize(20); textAlign(LEFT);
    text("TÍTULO", width/2-50, 280);
    addNameMovie.display();
    text("DIRECTOR:", width/2-50, 360);
    text("AÑO:", width/2-50, height/2+85);
    addNameDirector.display();
    text("GÉNERO:", width/2-50, height/2+140);
    
    anys.display();
    genere.display();
    updateCursor();
    popStyle();
    
    rectMode(LEFT);
    rect(330, 280, 570, 580, 10);
    fill(0); textSize(18); textFont(getFontAt(2));
    text("(foto)", 390, 320);
    
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
    //liked.display();
    
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
    
    vistas.display(260, 131, 1090, 600);
    next.display(); prev.display();
    
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
    
    popStyle();
  }
}
