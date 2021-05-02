class MoldParticle extends PerlinWalker {

  PVector trail[];
  int ind;

  MoldParticle(PVector loc, int maxL) {
    super(loc);
    ind = 0;
    trail = new PVector[maxL];
  for(int i = 0; i < maxL; i++)
    trail[i] = loc;

  }
  void calculateTrail() {
    trail[ind] = new PVector(location.x, location.y);
    ind = (ind+1) % trail.length;
  }
  void displayHead(int weight, color c) {
    strokeWeight(weight);
    stroke(c);
    point(location.x, location.y);
  }
  
    void displayTrail(int index,int weight, color c) {
    strokeWeight(weight);
    stroke(c);
    point(trail[(ind+index)%trail.length].x, trail[(ind+index)%trail.length].y);
  }
  void drawVectors() {
    colorMode(RGB);
    stroke(color(0, 255, 0));
    line(location.x, location.y, 
      location.x+acceleration.x, location.y+acceleration.y);
    stroke(0);
    strokeWeight(1);
    colorMode(HSB);
  }
}
