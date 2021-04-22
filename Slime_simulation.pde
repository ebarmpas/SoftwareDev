Mold mold[];
color c[];
color background = color(0, 0, 0);
int numOfLines = 6;
int cutOffDivider = 7;
void setup() {
  size(800, 600);
  mold = new Mold[numOfLines];
  c = new color[numOfLines];
  c[0] = color( 255, 0, 0);
  c[1] = color( 0, 255, 0);
  c[2] = color( 0, 0, 255 );
  c[3] = color(255, 255, 0 );
  c[4] = color(0, 255, 255 );
  c[5] = color( 255, 0, 255);
  for (int i = 0; i < numOfLines; i++)
    mold[i] = new Mold((width/8)*(i+1), (height/8)*(i+1), i, c[i]);
  //rectMode(CORNERS);
  //color(255);
  //rect(width-width/cutOffDivider, height/cutOffDivider, width/cutOffDivider, height -height/cutOffDivider);
  frameRate(60);
  background(background);
}

void draw() {
  background(background);
  //noFill();
  //strokeWeight(2);
  //stroke(255);
  //rect(width-width/cutOffDivider, height/cutOffDivider, width/cutOffDivider, height -height/cutOffDivider);

  for (int i = 0; i < numOfLines; i++) {
    mold[i].step();
    mold[i].avoidEdges();  
    mold[i].display();
  }
}
