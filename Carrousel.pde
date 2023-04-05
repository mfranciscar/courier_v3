
class Carrousel {
   
  // Dimensions del carrousel
  int x, y, w, h;
  float imgW;
  float margeH = 20;

  // Informació del carrousel
  int numTotalImatges, numImatgesVisibles;
  
  // Index imatge actual
  int currentImage;
  
  // Títols de les imatges
  String[] noms;
  
  // Imatges del carrousel
  PImage[] imgs;
  
  // Botons del carrousel
  RoundButton bPrev, bNext;
  
  // Constructor
  Carrousel(int x, int y, int w, int h, int nv){
    this.x = x; this.y = y; this.w = w; this.h = h;
    this.numImatgesVisibles = nv; 
    this.currentImage = 0;
    this.imgW = (w - margeH*(nv-1)) / (float) nv;
    

  }
  
  // Setters
  
  void setImages(String[] noms){
    this.noms = noms;
    this.numTotalImatges = noms.length;
    this.imgs = new PImage[noms.length];
    for(int i=0; i<imgs.length; i++){
      imgs[i] = loadImage(noms[i]);
    }
  }
  
  void setButtons(String img1, String img2){
    PImage imgPrev = loadImage(img1);
    bPrev = new RoundButton(imgPrev, x-35, y, 30);
    
    PImage imgNext = loadImage(img2);
    bNext = new RoundButton(imgNext, x + w + 55, y, 30);
  }
  
  void next(){
    if(this.currentImage<this.numTotalImatges - this.numImatgesVisibles){
      this.currentImage++;
    }
  }
  
  void prev(){
    if(this.currentImage>0){
      this.currentImage--;
    }
  }
  
  
  // Dibuixa el Mosaic
  void display(){
    
    for(int i=0; i<this.numImatgesVisibles; i++){
      
      int index = i + this.currentImage;
      float xPos = x + i*(this.imgW + this.margeH);
      
      // Imatge a mostrar
      PImage img = imgs[index];
      image(img, xPos+140, y, this.imgW, h);
      
    }
    
    if(bNext!=null){
      bNext.display();
    }
    if(bPrev!=null){
      bPrev.display();
    }
  }
  
  void checkButtons(){
    if(bNext.mouseOverButton() && bNext.enabled){
      this.next();
    }
    else if(bPrev.mouseOverButton() && bPrev.enabled){
      this.prev();
    }
  }
  
  boolean checkCursor(){
    if(bNext.mouseOverButton() && bNext.enabled){
      return true;
    }
    else if(bPrev.mouseOverButton() && bPrev.enabled){
      return true;
    }
    return false;
  }

  
}
