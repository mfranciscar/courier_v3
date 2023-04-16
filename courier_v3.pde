enum PANTALLA {INICIO, LOG_IN, ADD_MOVIE, MOVIE_CARD, LISTAS, PELIS_VISTAS, PELIS_PENDIENTES};
PANTALLA pantalla = PANTALLA.MOVIE_CARD;

void setup(){
  fullScreen();
  noStroke();
  setColors();
  setFonts();
  textAlign(CENTER);
  conexionBBDD();
  setGUI();
  fullScreen();
}

void draw(){
  background(getThirdColor());
  drawGUI();
  
  switch(pantalla){
  case LOG_IN:
    dibujaPantallaLogIn();
    break;
  case INICIO:
    dibujaPantallaInicio();
    break;
  case ADD_MOVIE:
    dibujaPantallaAddMovie();
  case MOVIE_CARD:
    dibujaPantallaMovieCard();  
  case LISTAS:
    dibujaPantallaListas();
  case PELIS_VISTAS:
    dibujaPantallaVistas();
  case PELIS_PENDIENTES:
    dibujaPantallaPendientes();
  break;
  }
}
