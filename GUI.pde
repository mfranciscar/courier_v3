Button b1;
RoundButton rb1, rb2, rb3;
SquareButton logIn, crearLista, crearMovie, portada;
color bgColor = 0;
PImage img, img1, icona1, icona2, icona3, icona4;
Counter anys;
PImage iconaMes, iconaMenys;
Select genere;
String[] selectValues = {"Acción", "Aventuras", "Ciencia ficción", "Comedia", "Drama", "Suspense"};
Carrousel c;
String titol = "";
PopUp p;
String title = "Operación realizada";
String message = "La película se ha añadido correctamente.";

CheckBoxStarList estrelletes;
String[] imgs = {"starON.png", "starOFF.png"};

String[] noms = {"seven.png", "death_proof.png", "fight_club.png",
                 "godfather.png", "schindlers_list.png", "sexto_sentido.png",
                 "sleepers.png"};

int n = 0;
boolean logged = false;

Card peli;
String[] info1 = {"Seven", 
                  "David Fincher",
                  "1995",
                  "Drama"};
                  
DataTable t;
float[] colWidths = {20, 80};
int files = 3, columnes = 2;
String[] headers = {"Número", "Unitat"};

void setGUI(){
  
  pushStyle();
  
  icona1 = loadImage("log_in.png");
  icona2 = loadImage("add.png");
  icona3 = loadImage("search.png");
  icona4 = loadImage("busca.png");
  
  b1 = new Button("C", 0, 0, 120, 120);
  rb1 = new RoundButton(icona1, 1300, 60, 35);
  rb2 = new RoundButton(icona2, 1200, 60, 35);
  rb3 = new RoundButton(icona3, 1100, 60, 35);
  
  userText = new TextField(width/2-253, height/2+25, 485, 35);
  passwordText = new TextField(width/2-253, height/2+115, 485, 35);
  cercador = new TextField(160, 40, 800, 45);
  
  logIn = new SquareButton("Iniciar sesión", width/2, height/2+200, 200, 35);
  
  addNameList = new TextField(width/2-60, 300, 380, 35);
  addDescription = new TextArea(width/2-60, 420, 380, 100, 35, 3);
  crearLista = new SquareButton("Crear lista", width/2+120, height/2+200, 200, 35);
  
  iconaMes = loadImage("mes.png");
  iconaMenys = loadImage("menys.png");
  addNameMovie = new TextField(width/2-60, 260, 380, 35);
  anys = new Counter(iconaMes, iconaMenys, width/2+155, height/2+45, 100, counterH);
  crearMovie = new SquareButton("Añadir película", width/2+120, height/2+220, 200, 35);
  addNameDirector = new TextField(width/2-60, height/2-40, 380, 35);
  addActors = new TextField(width/2-60, height/2-15, 380, 35);
  
  genere = new Select(selectValues, width/2+75, height/2+85, selectW, selectH);
  
  c = new Carrousel(width/2-565, height/2+30, 1100, 380, 4);
  c.setImages(noms);
  c.setButtons("bPrev.png", "bNext.png");
  
  estrelletes = new CheckBoxStarList(5, imgs, width/2+80, height/2 + 140, 40, 40);
  estrelletes.setCheckBoxStars(3);
  
  portada = new SquareButton("Añadir imagen", width/2-230, height/2+40, 260, 400);
  
  p = new PopUp(title, message, width/2, height/2+20, 500, 300);
  
  img1 = loadImage("seven.png");
  peli = new Card(info1);
  peli.setImage(img1);
  
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
