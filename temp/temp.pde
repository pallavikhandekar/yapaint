boolean eraserMode = false;
boolean shapesMode = false;
boolean penMode = true;
boolean dragging = false;
int ST1;
int ST2;
int ST3;
int SW = 1;
final static int PEN=1;
final static int LINE = 2;
final static int RECTANGLE=3;
final static int TRIANGLE=4;
final static int ELLIPSES=5;
final static int STARS=6;
final static int POLYGON=7;
final static int ERASE=10;


int drawShape;
int [] pre_pixels;

float [] p1x = new float[0]; // hold the mouse pressed marks
float [] p1y = new float[0];
float [] p2x = new float[0]; // hold the mouse pressed marks
float [] p2y = new float[0];

int count=0;
int countPolygon=0;
int pX1,pX2;
int pY1,pY2;
float startReference=0;//start reference for polygon
 
void setup() {
  size(800,800);
  background(255);
  stroke(0);
  strokeWeight(2);
  rectMode(CENTER);
   smooth();
  colorButton();
  weight();
}
 
void draw() {
     //background(255);  
       if(dragging && shapesMode){
      background(255);
  }
    if(eraserMode == false) {
   drawShapes();
   freeDraw();
  }
  eraserTool();
  eraserSetup();
  weight();
  weightButton();
  topRect();
  colorButton();
  colorSet();
  clearButton();
  clearSet();
  ellipseButton();
  ellipseButtonClicked();
 
}

void ellipseButton(){
  
  rect(20,190,40,40);
  textAlign(CENTER);
  stroke(0);
  fill(0);
  text("S", 20,205); 
}

void ellipseButtonClicked(){
  if(mousePressed){
    if(mouseX < 60 && mouseY < 230 && mouseY > 150){
        drawShape = ELLIPSES;
    }
  }
}
   
void colorButton() {
  stroke(0);
  strokeWeight(2);
  fill(200,0,0);
  rect(10,10,20,20);
  fill(255,124,0);
  rect(10,30,20,20);
  fill(255,247,0);
  rect(10,50,20,20);
  fill(0,200,0);
  rect(30,10,20,20);
  fill(0,0,200);
  rect(30,30,20,20);
  fill(229,0,255);
  rect(30,50,20,20);
  fill(0,0,0);
  rect(10,70,20,20);
  fill(255);
  rect(30,70,20,20);
  fill(255);
  line(40,20,760,20);
  rect(20,485,40,630);
  rect(780,500,40,600);
}
 
void colorSet() {
  if(mousePressed) {
    if(mouseX < 20) {
      if(mouseY < 20) {
        ST1 = 200;
        ST2 = 0;
        ST3 = 0;
      } else if(mouseY < 40 && (mouseY > 20)) {
        ST1 = 255;
        ST2 = 124;
        ST3 = 0;
      } else if(mouseY < 60 && (mouseY > 40)) {
        ST1 = 255;
        ST2 = 247;
        ST3 = 0;
      } else if(mouseY < 80 && (mouseY > 60)) {
        ST1 = 0;
        ST2 = 0;
        ST3 = 0;
      }
    } else if(mouseX > 20 && (mouseX < 40)) {
        if(mouseY < 20) {
        ST1 = 0;
        ST2 = 200;
        ST3 = 0;
        } else if(mouseY < 40 && (mouseY > 20)) {
          ST1 = 0;
          ST2 = 0;
          ST3 = 200;
        } else if(mouseY < 60 && (mouseY > 40)) {
          ST1 = 229;
          ST2 = 0;
          ST3 = 255;
        } else if(mouseY < 80 && (mouseY > 60)) {
          ST1 = 255;
          ST2 = 255;
          ST3 = 255;
        }
    }
  }
}
 
void clearButton() {
  rect(20,105,40,50);
  textAlign(CENTER);
  stroke(0);
  fill(0);
  text("C", 20,120);
}
 
void clearSet() {
  if(mousePressed) {
    if(mouseX < 40 && (mouseY < 130) && (mouseY > 80)) {
      background(255);
    }
  }
}
void freeDraw() {
  
      
  if(mousePressed) {
      stroke(ST1,ST2,ST3);
      strokeWeight(SW);
      line(mouseX, mouseY, pmouseX, pmouseY);
}
}
 
void topRect() {
  fill(255);
  stroke(0);
  rect(400,10,718,20);
  stroke(ST1,ST2,ST3);
  strokeWeight(SW);
  line(50,10,750,10);
  stroke(0);
  strokeWeight(2);
  line(40,20,760,20);
}
 
void weight() {
  stroke(0);
  fill(255);
  strokeWeight(2);
  rect(780,20,40,40);
  rect(780,60,40,40);
  rect(780,100,40,40);
  rect(780,140,40,40);
  rect(780,180,40,40);
  stroke(ST1,ST2,ST3);
  fill(ST1,ST2,ST3);
  ellipse(780,20,1,1);
  ellipse(780,60,2,2);
  ellipse(780,100,3,3);
  ellipse(780,140,4,4);
  ellipse(780,180,5,5);
}
 
void weightButton() {
  if(mousePressed) {
    if(mouseX > 760) {
      if(mouseY < 40) {
        SW = 1;
      } else if(mouseY < 80 && (mouseY > 40)) {
        SW = 2;
      } else if(mouseY < 120 && (mouseY > 80)) {
        SW = 3;
      } else if(mouseY < 160 && (mouseY > 120)) {
        SW = 4;
      } else if(mouseY < 200 && (mouseY > 160)) {
        SW = 5;
      }
    }
  }
}
 
void eraserSetup() {
  rectMode(CENTER);
  stroke(0);
  strokeWeight(2);
  fill(255);
  rect(20,150,40,40);
  fill(0);
  textAlign(CENTER);
  text("E",20,165);
  if(mousePressed) {
    if((mouseX > 760) || ((mouseX < 40) && ((mouseY > 170) || (mouseY < 130)))) {
      eraserMode = false;
    } else if((mouseX < 40) && (mouseY < 170) && (mouseY > 130)) {
        eraserMode = true;
    }
  }
}
 
void eraserTool() {
  if(mousePressed) {
    if(eraserMode == true) {
      noStroke();
      fill(255);
      rectMode(CENTER);
      rect(mouseX, mouseY, 20, 20);
      stroke(0);
    } else if(eraserMode == false) {
    }
  }
}
void drawLine()
{
    for (int i=0; i<count; i++) { 
      beginShape();
      line(p1x[i],p1y[i],p2x[i],p2y[i]);
      endShape();    
    }
    
    if (mousePressed && mouseButton == LEFT) {
        line(pX1, pY1, pX2,pY2);
    } 
}


void drawRectangle() {
 
  float sizex = pX2 - pX1;
  float sizey = pY2 - pY1; 
  for (int i=0; i<count; i++) {
    beginShape();
    vertex(p1x[i], p1y[i]);
    vertex(p2x[i], p1y[i]);
    vertex(p2x[i], p2y[i]);
    vertex(p1x[i], p2y[i]);
    endShape(CLOSE);
  }
    if (mousePressed && mouseButton == LEFT) {
        rect(pX1, pY1, sizex,sizey);
     } 
}

void drawTriangle(){
 for(int i=0;i<count;i++)
 {
    beginShape(TRIANGLES);
    vertex(p1x[i], p1y[i]);
    vertex(p2x[i], p2y[i]);
    vertex(p1x[i], p2y[i]);
    endShape(CLOSE);
 } 
   if (mousePressed && mouseButton == LEFT) {
        triangle(pX1, pY1, pX2,pY2,pX1,pY2);
     } 
}
  
void drawEllipse()
{ 
  float sizex;
  float sizey;
   for(int i=0;i<count;i++)
   {
    ellipseMode(CORNER);
    sizex=p2x[i]-p1x[i];
    sizey=p2y[i]-p1y[i];
    ellipse(p1x[i],p1y[i],sizex,sizey);
   } 
   sizex = pX2 - pX1;
   sizey = pY2 - pY1;
  if (mousePressed && mouseButton == LEFT) {
    ellipseMode(CORNER);
    ellipse(pX1, pY1, sizex,sizey);
  } 
}
 
void drawStar()
{
   
  float yA,yB,yC,xA,xB,xC,xD,xE,xF;
  //  println("start");
  for (int i=0; i<count; i++) { 
  beginShape();
  yA=p1y[i]+((p2y[i]-p1y[i])/4);
  yB=p1y[i]+(3*(p2y[i]-p1y[i])/4);
  yC=p1y[i]+((p2y[i]-p1y[i])/2);
  xA=p1x[i] +((p2x[i]-p1x[i])/2);
  xB=(p2x[i]-p1x[i])/4;
  xC=p2x[i]-xB; 
  xD=p1x[i]+xB;
  xE=p2x[i]-((p2x[i]-xC)/2);
  xF=p1x[i]+((xD-p1x[i])/2);
  vertex(xA,p1y[i]);//1
  vertex(xC,yA);//2
  vertex(p2x[i],yA);//3
  vertex(xE,yC);//4
  vertex(p2x[i],yB);//5
  vertex(xC,yB);//6
  vertex(xA,p2y[i]);//7
  vertex(xD,yB);//8
  vertex(p1x[i],yB);//9
  vertex(xF,yC);//10
  vertex(p1x[i],yA);//11
  vertex(xD,yA);//12
  endShape(CLOSE);
  }
 if (mousePressed && mouseButton == LEFT) {
      beginShape();
      yA=pY1+((pY2-pY1)/4);
      yB=pY1+(3*(pY2-pY1)/4);
      yC=pY1+((pY2-pY1)/2);
      xA=pX1 +((pX2-pX1)/2);
      xB=(pX2-pX1)/4;
      xC=pX2-xB; 
      xD=pX1+xB;
      xE=pX2-((pX2-xC)/2);
      xF=pX1+((xD-pX1)/2);
      vertex(xA,pY1);//1
      vertex(xC,yA);//2
      vertex(pX2,yA);//3
      vertex(xE,yC);//4
      vertex(pX2,yB);//5
      vertex(xC,yB);//6
      vertex(xA,pY2);//7
      vertex(xD,yB);//8
      vertex(pX1,yB);//9
      vertex(xF,yC);//10
      vertex(pX1,yA);//11
      vertex(xD,yA);//12
      endShape(CLOSE);
  } 
}

void drawPolygon()
{
    for (int i=0; i<count; i++) { 
      beginShape();
      line(p1x[i],p1y[i],p2x[i],p2y[i]);
      endShape();    
    }
    if (mousePressed && mouseButton == LEFT && startReference !=1000) {
        line(pX1, pY1, pX2,pY2);
    } 
    
}

void mousePressed() {
  if( drawShape == POLYGON && count>0 && startReference !=1000)
  {
    p1x= append(p1x,p2x[count-1]);
    p1y= append(p1y,p2y[count-1]);
    pX1 = pX2;
    pY1 = pY2;
  }
  else
  {
    p1x= append(p1x, mouseX);
    p1y= append(p1y, mouseY);
    pX1 = mouseX;
    pY1 = mouseY;
    mouseDragged(); // Reset vars
    startReference = mouseX; 
  } 
     //println("MPressed");
}
 
void mouseReleased() {
  if (drawShape == POLYGON && count>0 && p2x[count-1]== startReference)
  {
    startReference = 1000;
  }
  {
    p2x= append(p2x, mouseX);
    p2y= append(p2y, mouseY);
    pX2 = mouseX;
    pY2 = mouseY;
    count++;
  }
//println("MReleased");
}
 
void mouseDragged() {
  
  pX2 = mouseX;
  pY2 = mouseY;
  dragging = true;
 //println("MDrag");
}

void drawShapes()
{
  shapesMode = true;
   switch(drawShape){
    case LINE:drawLine();break;
    case RECTANGLE: drawRectangle(); break;
    case TRIANGLE: drawTriangle(); break;
    case ELLIPSES: drawEllipse(); break;
    case STARS: drawStar(); break;
    case POLYGON: drawPolygon();break;
    case ERASE:;break;
    }
}
