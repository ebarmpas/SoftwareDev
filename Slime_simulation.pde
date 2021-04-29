Mold mold1, mold2;

void setup() {
  size(1280, 720);
  colorMode(HSB);

  mold1 = new Mold(1, 800, 5, color(140, 150, 255));
  mold2 = new Mold(1, 800, 5, color(50, 150, 255));
  frameRate(30);
  background(0);
}

void draw() {
  background(0);
  mold1.step();
  mold1.avoidEdges();
  for(int i = 0; i < 4; i++)
  mold1.goTowardsPoint(new PVector(width-width/(i+1), height/2));
  mold1.display();

  mold2.step();
  mold2.avoidEdges();
   for(int i = 0; i < 4; i++)
  mold2.goTowardsPoint(new PVector(width/2, height-height/(i+1)));
  mold2.display();
}
