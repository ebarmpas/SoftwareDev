class Mold {

  int species;
  MoldParticle particles[];
  color moldColor;
  //color gradient[];

  Mold(int s, int numOfParticles, color c) { // int trailSize
    species = s;
    moldColor = c;
    particles = new MoldParticle[numOfParticles];
    for (int i = 0; i < particles.length; i+=5) {
      particles[ i ] = new MoldParticle(new PVector(random(0, width), random(0, height)));//, trailSize);
      particles[i+1] = new MoldParticle(new PVector(random(0, width), random(0, height)));//, trailSize);
      particles[i+2] = new MoldParticle(new PVector(random(0, width), random(0, height)));//, trailSize);
      particles[i+3] = new MoldParticle(new PVector(random(0, width), random(0, height)));//, trailSize);
      particles[i+4] = new MoldParticle(new PVector(random(0, width), random(0, height)));//, trailSize);
    }

    //gradient = new color[trailSize];
    //for (int i = 0; i < gradient.length; i++) {
    //  gradient[i] = color(red(c), green(c), blue(c), ceil(255/gradient.length*i));
    //}
  }

  void step() {
    for (int i = 0; i < particles.length; i+=5) { 
      particles[i].step();
      //particles[i].calculateTrail();
      particles[i+1].step();
      //particles[i+1].calculateTrail();
      particles[i+2].step();
      //particles[i+2].calculateTrail();
      particles[i+3].step();
      //particles[i+3].calculateTrail();
      particles[i+4].step();
      //particles[i+4].calculateTrail();
    }
  }
  void display() {
    for (int i = 0; i < particles.length; i+=5) {
      //for(int j = 0; j < gradient.length ; j++){
      //  particles[i].displayTrail(j, 5, gradient[j]);
      //}
      particles[i].displayHead(3, moldColor);
      particles[i+1].displayHead(3, moldColor);
      particles[i+2].displayHead(3, moldColor);
      particles[i+3].displayHead(3, moldColor);
      particles[i+4].displayHead(3, moldColor);
    }
  }
  void avoidEdges() {
    for (int i = 0; i < particles.length; i+=5) {
      particles[i].avoidEdges();
      particles[i].bounceOnEdges();
      particles[i+1].avoidEdges();
      particles[i+1].bounceOnEdges();
      particles[i+2].avoidEdges();
      particles[i+2].bounceOnEdges();
      particles[i+3].avoidEdges();
      particles[i+3].bounceOnEdges();
      particles[i+4].avoidEdges();
      particles[i+4].bounceOnEdges();
    }
  }

  void goTowardsPoint(PVector point, int cutOff) {
    for (int i = 0; i < particles.length; i+=5) {
      particles[i].goTowardsPoint(point, cutOff, 9);
      particles[i+1].goTowardsPoint(point, cutOff, 9);
      particles[i+2].goTowardsPoint(point, cutOff, 9);
      particles[i+3].goTowardsPoint(point, cutOff, 9);
      particles[i+4].goTowardsPoint(point, cutOff, 9);
    }
  }
  void cohere() {
    for (int i = 0; i < particles.length; i++)
      for (int j = 0; i < particles.length; i+=5) {
        particles[i].goTowardsPoint(particles[j].location, height > width ? height : width, 5);
        particles[i].goTowardsPoint(particles[j+1].location, height > width ? height : width, 5);
        particles[i].goTowardsPoint(particles[j+2].location, height > width ? height : width, 5);
        particles[i].goTowardsPoint(particles[j+3].location, height > width ? height : width, 5);
        particles[i].goTowardsPoint(particles[j+4].location, height > width ? height : width, 5);
      }
  }
  void avoidPoint(PVector point, int cutOff) {
    for (int i = 0; i < particles.length; i+=5) {
      particles[i].avoidPoint(point, cutOff);
      particles[i+1].avoidPoint(point, cutOff);
      particles[i+2].avoidPoint(point, cutOff);
      particles[i+3].avoidPoint(point, cutOff);
      particles[i+4].avoidPoint(point, cutOff);
    }
  }

  //void drawVectors() {
  //  for (int i = 0; i < particles.length; i++)
  //    particles[i].drawVectors();
  //}
}
