enum PANTALLA {INICIO, LOG_IN, ADD_LISTA, ADD_MOVIE, MOVIE_CARD};
PANTALLA pantalla = PANTALLA.ADD_MOVIE;

void setup(){
  fullScreen();
  noStroke();
  setColors();
  setFonts();
  textAlign(CENTER);
  setGUI();
  conexionBBDD();
  
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
  break;
  }
}
