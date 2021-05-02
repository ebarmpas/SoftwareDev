Mold mold1;//, mold2;

void setup() {
  size(1280,720);
  //Color is now RGB
  mold1 = new Mold(1, 5000, 2, color(50, 255, 255));
  // mold2 = new Mold(1, 800, 5, color(50, 150, 255));
  frameRate(30);
  background(0);

}

void draw() {
  background(0);
  mold1.step();
  mold1.strand();
  mold1.avoidEdges();
  mold1.goTowardsPoint(new PVector(width-width/4, height-height/4), width/2);
  mold1.goTowardsPoint(new PVector(width/4, height-height/4), width/2);
  mold1.goTowardsPoint(new PVector(width-width/4, height/4), width/2);
  mold1.goTowardsPoint(new PVector(width/4, height/4), width/2);
  //mold1.drawVectors();
  mold1.display();

  //mold2.step();
  ////mold2.avoidEdges();
  //mold2.goTowardsPoint(new PVector(width/2, height/2));
  //mold2.display();
}
