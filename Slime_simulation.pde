ArrayList <Mold> mold;
ArrayList <PerlinWalker> attractionPoints;
void setup() {
  size(1280, 720);
  //Color is now RGB
  mold = new ArrayList<Mold>();
  attractionPoints = new ArrayList <PerlinWalker>();
  mold.add(new Mold(0, 1000, color(255, 255, 0)));
  mold.add(new Mold(1, 1000, color(255, 0, 255)));
   mold.add(new Mold(2, 1000, color(0, 255, 255)));
  for (int i = 0; i < 8; i++) {
    attractionPoints.add(new PerlinWalker(new PVector(random(width/4, width- width/4), random(height/4, height- height/4))));
  }

  frameRate(60);
  background(0);
}

void draw() {
  background(0);


  for (int i = 0; i < mold.size(); i++) {
    mold.get(i).step();
    mold.get(i).cohere();
    for (int j = 0; j < attractionPoints.size(); j++) {
      attractionPoints.get(j).step();
      attractionPoints.get(j).avoidEdges();
      for (int n = 0; n < attractionPoints.size(); n++) {
        attractionPoints.get(j).avoidPoint(attractionPoints.get(n).location, 20);
      }
    }
    for (int j = 0; j < attractionPoints.size()/2; j++) {
      mold.get(0).goTowardsPoint(attractionPoints.get(j+4).location, width/2);
      mold.get(1).goTowardsPoint(attractionPoints.get(j+4).location, width/2);
    }

    for (int j = 0; j < mold.size(); j++) {
      if (mold.get(i).species != mold.get(j).species)
        for (int n = 0; n < mold.get(i).particles.length; n++) {
          mold.get(i).avoidPoint(mold.get(j).particles[n].location, 100);
        }
    }

    mold.get(i).avoidEdges();
    mold.get(i).display();
  }
  stroke(255, 0, 0);
  strokeWeight(10);
  for (int i = 0; i < 8; i++) {
    point(attractionPoints.get(i).location.x, attractionPoints.get(i).location.y);
  }
}
