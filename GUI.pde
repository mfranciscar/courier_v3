Button b1;
RoundButton rb1, rb2, rb3, buscar;
SquareButton logIn, crearLista, crearMovie, portada, pantalla_addLista, pantalla_addMovie, Seven;
SquareButton seen, to_see, liked;
color bgColor = 0;
PImage img, img1, icona1, icona2, icona3, icona4;
Counter anys;
PImage iconaMes, iconaMenys;
Select genere, estado;
String[] genero = {"Acción", "Aventuras", "Ciencia ficción", "Comedia", "Drama", "Suspense"};
String[] estat = {"Vista", "Pendiente"};
Carrousel c;
String titol = "";
PopUp p;
String title = "Operación realizada";
String message = "La película se ha añadido correctamente.";

CheckBoxStarList estrelletes, valor;
String[] imgs = {"starON.png", "starOFF.png"};

String[] noms = {"seven.png", "death_proof.png", "fight_club.png",
                 "godfather.png", "schindlers_list.png", "sexto_sentido.png",
                 "sleepers.png"};

int n = 0;
boolean logged = false;

DataTable vistas, pendientes;
SquareButton next, prev;
float tableW = 950, tableH = 300;
int files = 10, columnesV = 5, columnesP = 4;
String[] headersVistas = {"Película", "Director", "Año", "Género", "Valoración"};
String[] headersPendientes = {"Película", "Director", "Año", "Género"};
float[] colWidthsV = {23, 30, 9, 18, 20};
float[] colWidthsP = {35, 35, 10, 20};
int compW = 200, compH = 80;
float popW = 600, popH = 340;
float confW = 600, confH = 340;
float buttonW = 120, buttonH = 60;

String estado1 = "Vista";


void setGUI(){
  
  pushStyle();
  
  icona1 = loadImage("log_in.png");
  icona2 = loadImage("add.png");
  icona3 = loadImage("search.png");
  icona4 = loadImage("busca.png");
  
  b1 = new Button("C", 0, 0, 120, 120);
  rb1 = new RoundButton(icona1, 1300, 60, 40);
  rb2 = new RoundButton(icona2, 1200, 60, 40);
  rb3 = new RoundButton(icona3, 1100, 60, 40);
  
  userText = new TextField(width/2-253, height/2+25, 485, 35);
  passwordText = new TextField(width/2-253, height/2+115, 485, 35);
  cercador = new TextField(160, 40, 700, 45);
  buscar = new RoundButton(icona4, 910, 60, 30);
  
  logIn = new SquareButton("Iniciar sesión", width/2, height/2+200, 250, 35);
  
  addNameList = new TextField(width/2-60, 300, 380, 35);
  addDescription = new TextArea(width/2-60, 420, 380, 100, 35, 3);
  crearLista = new SquareButton("Crear lista", width/2+120, height/2+200, 200, 35);
  
  iconaMes = loadImage("mes.png");
  iconaMenys = loadImage("menys.png");
  addNameMovie = new TextField(width/2-60, 240, 380, 35);
  anys = new Counter(iconaMes, iconaMenys, width/2+155, height/2+55, 100, counterH);
  crearMovie = new SquareButton("Añadir película", width/2+120, height/2+220, 200, 35);
  addNameDirector = new TextField(width/2-60, height/2-70, 380, 35);
  addActors = new TextField(width/2-60, height/2-15, 380, 35);
  
  genere = new Select(genero, width/2+75, height/2+85, selectW, selectH);
  estado = new Select(estat, width/2+75, height/2-5, selectW, selectH);
  
  c = new Carrousel(width/2-565, height/2+30, 1100, 400, 4);
  c.setImages(noms);
  c.setButtons("bPrev.png", "bNext.png");
  
  estrelletes = new CheckBoxStarList(5, imgs, width/2+80, height/2 + 140, 40, 40);
  estrelletes.setCheckBoxStars(3);
  
  valor = new CheckBoxStarList(5, imgs, 930, 450, 40, 40);
  valor.setCheckBoxStars(5);
  
  portada = new SquareButton("Añadir imagen", width/2-230, height/2+40, 260, 400);
  
  p = new PopUp(title, message, width/2, height/2+20, 500, 300);
  
  
  pantalla_addLista = new SquareButton("Crear lista", width/2+450, 135, 200, 35);
  pantalla_addMovie = new SquareButton("Añadir película", width/2+450, 170, 200, 35);
  
  seen = new SquareButton("Vistas", 124, 170, 249, 35);
  to_see = new SquareButton("Pendientes", 124, 210, 249, 35);
  liked = new SquareButton("Me gustan", 124, 250, 249, 35);
  
  
  String[][]info = getInfoTaulaPeliculaVistas();
  vistas = new DataTable(files, columnesV);
  vistas.setHeaders(headersVistas);
  vistas.setData(info);
  vistas.setColumnWidths(colWidthsV);
  next = new SquareButton("NEXT", 61+250/2, 700, 250/2-2, buttonH);
  prev = new SquareButton("PREV", 62, 700, 250/2-2, buttonH);
  
  pendientes = new DataTable(files, columnesP);
  pendientes.setHeaders(headersVistas);
  pendientes.setData(info);
  pendientes.setColumnWidths(colWidthsP);
  
  Seven = new SquareButton("", 400, 230, 230, 50);
  
  popStyle();
  
}

void drawGUI(){
  
  // Zona Principal
  fill(getThirdColor());
  rect(marginH, marginV, width, height);
  
  // Zona Banner
  fill(getFirstColor());
  rect(0, 0, bannerWidth, bannerHeight);
  fill(0);
  textFont(getFontAt(2));
  b1.display();
  rb1.display();
  rb2.display();
  rb3.display();
  updateCursor();
}
