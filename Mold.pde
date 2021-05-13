class Mold {

  ArrayList<MoldParticle> particles;
  color moldColor;
  //color gradient[];

  Mold(int numOfParticles, color c) { // int trailSize
    moldColor = c;
    particles = new ArrayList<MoldParticle>();
    for (int i = 0; i < numOfParticles; i++) {
      particles.add(new MoldParticle(new PVector(random(0, width), random(0, height))));//, trailSize);
    }

    //gradient = new color[trailSize];
    //for (int i = 0; i < gradient.length; i++) {
    //  gradient[i] = color(red(c), green(c), blue(c), ceil(255/gradient.length*i));
    //}
  }

  void step() {
    for (int i = 0; i < particles.size(); i++) { 
      particles.get(i).step();
    }
  }
  void display() {
    for (int i = 0; i < particles.size(); i++) {
      //for(int j = 0; j < gradient.length ; j++){
      //  particles[i].displayTrail(j, 5, gradient[j]);
      //}
      particles.get(i).displayHead(3, moldColor);
    }
  }
  void avoidEdges() {
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).avoidEdges();
    }
  }

  void goTowardsPoint(PVector point, int cutOff, int l, int m) {
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).goTowardsPoint(point, cutOff, l, m);
    }
  }
  void cohere(int cutOff, int l, float m) {
    //for (int i = 1; i < particles.size(); i++)
    //  particles.get(i).goTowardsPoint(particles.get(i-1).location, cutOff,l,m);
    for (int i = 0; i < particles.size(); i++)
      for (int j = 0; i < particles.size(); i++) {
        if (i == j)
          break;
        particles.get(i).goTowardsPoint(particles.get(j).location, cutOff, l, m);
      }
  }
  void avoidPoint(PVector point, int cutOff, int l, float m) {
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).avoidPoint(point, cutOff, l, m);
    }
  }

  void addParticles(int n) {
    for (int i = 0; i< n; i++)
      particles.add(new MoldParticle(new PVector(random(0, width), random(0, height))));
  }
  void removeParticles(int n) {
    for (int i = 0; i< n; i++)
      particles.remove(particles.size()-1);
  }
  //void drawVectors() {
  //  for (int i = 0; i < particles.length; i++)
  //    particles[i].drawVectors();
  //}
}
