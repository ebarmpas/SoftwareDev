class Mold {

  int species;
  MoldParticle particles[];

  color moldColor;
  color gradient[];


  Mold(int s, int numOfParticles, int trailSize, color c) {
    species = s;
    moldColor = c;
    particles = new MoldParticle[numOfParticles];
    for (int i = 0; i < numOfParticles; i++) {
      particles[i] = new MoldParticle(new PVector(random(0, width), random(0, height)), trailSize);
    }

    gradient = new color[trailSize];
    for (int i = 0; i < gradient.length; i++) {
      gradient[i] = color(red(c), green(c), blue(c), ceil(255/gradient.length*i));
    }
  }

  void step() {
    for (int i = 0; i < particles.length; i++) { 
      particles[i].step();
      particles[i].calculateTrail();
    }
  }
  void display() {
    for (int i = 0; i < particles.length; i++){
      for(int j = 0; j < gradient.length ; j++){
        particles[i].displayTrail(j, 5, gradient[j]);
      }
      particles[i].displayHead(3, moldColor);
    }
    
  }
  void avoidEdges() {
    for (int i = 0; i < particles.length; i++) {
      particles[i].avoidEdges();
      particles[i].bounceOnEdges();
    }
  }

  void goTowardsPoint(PVector point, int cutOff) {
    for (int i = 0; i < particles.length; i++)
      particles[i].goTowardsPoint(point, cutOff, 9);
  }
  void strand() {
    for (int i = 0; i < particles.length; i++)
      for (int j = 0; i < particles.length; i++)
        particles[i].goTowardsPoint(particles[j].location, height > width ? height : width, 5);
  }


  void avoidPoint(PVector point, int cutOff) {
    for (int i = 0; i < particles.length; i++)
      particles[i].avoidPoint(point, cutOff);
  }

  void drawVectors() {
    for (int i = 0; i < particles.length; i++)
      particles[i].drawVectors();
  }
}
