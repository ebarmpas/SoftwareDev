class MoldParticle extends PerlinWalker {
  //PLEASE DO NOT DELETE THE TRAIL CODE IT'S ALL I HAVE LEFT FROM THE GLORY DAYS - VAGGELIS.
  //PVector trail[];
  //int ind;

  MoldParticle(PVector loc, int ms) { //int maxL
    super(loc, ms);
    //ind = 0;
    //trail = new PVector[maxL];
    //for (int i = 0; i < maxL; i++)
    //  trail[i] = loc;
  }
  //void calculateTrail() {
  //  trail[ind] = new PVector(location.x, location.y);
  //  ind = (ind+1) % trail.length;
  //}

  //  void displayTrail(int index,int weight, color c) {
  //  strokeWeight(weight);
  //  stroke(c);
  //  point(trail[(ind+index)%trail.length].x, trail[(ind+index)%trail.length].y);
  //}
  //void drawVectors() {
  //  stroke(color(0, 255, 0));
  //  line(location.x, location.y, 
  //    location.x+acceleration.x, location.y+acceleration.y);
  //  stroke(0);
  //  strokeWeight(1);
  //}
    void avoidPoint(PVector point, int cutOff, int l, float m) {
    PVector f = PVector.sub(location, point);
    if (f.magSq() < cutOff*cutOff) {
      f.limit(l);
      f.mult(m);
      applyForce(f);
    }
  }
  void goTowardsPoint(PVector point, int cutOff, int l, float m) {
    PVector f = PVector.sub(point, location);
    if (f.magSq() < cutOff*cutOff) {
      f.limit(l);
      f.mult(m);
      applyForce(f);
    }
  }

  void displayHead(int weight, color c) {
    strokeWeight(weight);
    stroke(c);
    point(location.x, location.y);
  }
}
