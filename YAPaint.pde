final static int LINE = 1;
final static int RECTANGLE=2;
final static int TRIANGLE=3;
final static int ELLIPSES=4;
final static int STARS=5;
final static int POLYGON=6;

int drawShape=POLYGON;

float [] p1x = new float[0]; // hold the mouse pressed marks
float [] p1y = new float[0];
float [] p2x = new float[0]; // hold the mouse pressed marks
float [] p2y = new float[0];

int count=0;
int countPolygon=0;
int pX1,pX2;
int pY1,pY2;
float startReference=0;//start reference for polygon

void setup()
{
  size(700,400);
  smooth();
  stroke(255);
  background(50);

}

void draw()
{
  noFill();
   
   if(mousePressed)
   {
    switch(drawShape){
    case LINE:background(50);drawLine();break;
    case RECTANGLE: background(50);drawRectangle(); break;
    case TRIANGLE: background(50);drawTriangle(); break;
    case ELLIPSES: background(50);drawEllipse(); break;
    case STARS: background(50);drawStar(); break;
    case POLYGON: background(50);drawPolygon();break;
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
  float sizex = pX2 - pX1;
  float sizey = pY2 - pY1;
  
   for(int i=0;i<count;i++)
   {
    ellipse(p1x[i],p1y[i],p2x[i],p2y[i]);
   } 
  if (mousePressed && mouseButton == LEFT) {
    ellipseMode(CORNER);
    ellipse(pX1, pY1, sizex,sizey);
  } 
}
 
void drawStar()
{
   
  float yA,yB,yC,xA,xB,xC,xD,xE,xF;
    println("start");
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
 // println("MDrag");
}

