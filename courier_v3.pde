enum PANTALLA {INICIO, LOG_IN, ADD_LISTA, ADD_MOVIE, MOVIE_CARD, ADD_BUTTON, LISTAS, PELIS_VISTAS, PELIS_PENDIENTES};
PANTALLA pantalla = PANTALLA.INICIO;

void setup(){
  fullScreen();
  noStroke();
  setColors();
  setFonts();
  textAlign(CENTER);
  setGUI();
  conexionBBDD();
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
  case ADD_LISTA:
    dibujaPantallaAddLista(); 
  case ADD_MOVIE:
    dibujaPantallaAddMovie();
  case MOVIE_CARD:
    dibujaPantallaMovieCard();
  case ADD_BUTTON:
    dibujaPantallaAddButton();  
  case LISTAS:
    dibujaPantallaListas();
  case PELIS_VISTAS:
    dibujaPantallaVistas();
  case PELIS_PENDIENTES:
    dibujaPantallaPendientes();
  break;
  }
}
