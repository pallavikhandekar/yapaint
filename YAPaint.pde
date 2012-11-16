final static int LINE = 1;
final static int RECTANGLE=2;
int drawShape=RECTANGLE;

//Rectangle Drawing
float [] p1x = new float[0]; // hold the mouse pressed marks
float [] p1y = new float[0];
float [] p2x = new float[0]; // hold the mouse pressed marks
float [] p2y = new float[0];

int count=0;

int pX1,pX2;
int pY1,pY2;
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
    case LINE:line(pmouseX,pmouseY,mouseX,mouseY);break;
    case RECTANGLE: background(50);drawRectangle(); break;
    }
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
  
 
    
   
 
 
void mousePressed() {
p1x= append(p1x, mouseX);
p1y= append(p1y, mouseY);
  pX1 = mouseX;
  pY1 = mouseY;
  mouseDragged(); // Reset vars
   
}
 
void mouseReleased() {
p2x= append(p2x, mouseX);
p2y= append(p2y, mouseY);
  pX2 = mouseX;
  pY2 = mouseY;
count++;
}
 
void mouseDragged() {
  pX2 = mouseX;
  pY2 = mouseY;
}

