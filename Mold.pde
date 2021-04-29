class Mold {

  int species;
  color moldColor;
  MoldParticle particles[];

  Mold(int s, int numOfParticles, int trailSize, color c) {
    species = s;
    moldColor = c;
    colorMode(HSB);
    particles = new MoldParticle[numOfParticles];
    for (int i = 0; i < numOfParticles; i++) {
      particles[i] = new MoldParticle(new PVector(random(0, width), random(0, height)), trailSize, moldColor);
    }
  }

  void step() {
    for (int i = 0; i < particles.length; i++){ 
      particles[i].step();
      particles[i].calculateTrail();
    }
  }
  void display() {
    for (int i = 0; i < particles.length; i++)
      particles[i].display();
  }
  void avoidEdges() {
    for (int i = 0; i < particles.length; i++)
      particles[i].avoidEdges();
  }

  void goTowardsPoint(PVector point) {
    for (int i = 0; i < particles.length; i++)
      particles[i].goTowardsPoint(point);
  }

  void avoidPoint(PVector point, int cutOff) {
    for (int i = 0; i < particles.length; i++)
      particles[i].avoidPoint(point, cutOff);
  }
}
