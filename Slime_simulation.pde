ArrayList <Mold> moldList;
ArrayList <PerlinWalker> attractionPoints;
ArrayList <SlimeControlPanel> scp;
boolean isPaused;
Button previous, next, pause;
int slimeN;
void setup() {
  //P2D supposedly uses OpenGL to render but I don't see an improvement in performance.
  size(1280, 720, P2D);
  //I doubt this are doing anything but at this point I am desperate for better performance.
  noSmooth();
  hint(DISABLE_OPENGL_ERRORS);
  hint(DISABLE_TEXTURE_MIPMAPS);
  //Color is now RGB
  scp = new ArrayList<SlimeControlPanel>();
  scp.add(new SlimeControlPanel(new PVector(25, 75), color(255, 255, 0)));
  scp.add(new SlimeControlPanel(new PVector(25, 75), color(255, 0, 255)));
  scp.add(new SlimeControlPanel(new PVector(25, 75), color(0, 255, 255)));
  previous = new Button(new PVector(25, 30), new PVector(110, 65), ',', "<-(,)", color(0), color(255), color(255));
  next = new Button(new PVector(118, 30), new PVector(203, 65), '.', "(.)->", color(0), color(255), color(255));
  pause = new Button(new PVector(25, 19*35), new PVector(203, 20*35), ' ', "Pause (space)", color(0), color(255), color(255));
  slimeN = 0;
  isPaused = false;
  moldList = new ArrayList<Mold>();

  attractionPoints = new ArrayList<PerlinWalker>();

  moldList.add(new Mold(0, 1000, color(255, 255, 0)));// yellow
  moldList.add(new Mold(1, 1000, color(255, 0, 255)));// pink
  moldList.add(new Mold(2, 1000, color(0, 255, 255)));// cyan

  for (int i = 0; i < 10; i++) {
    attractionPoints.add(new PerlinWalker(new PVector(random(width/4, width- width/4), random(height/4, height- height/4))));
  }

  frameRate(60);
  background(0);
}

void draw() {
  background(0);

  for (int i = 0; i < moldList.size(); i++) {
    if (!isPaused) {
      moldList.get(i).step();
      moldList.get(i).cohere(width, 100, 1);
      for (int j = 0; j < attractionPoints.size(); j++) {
        attractionPoints.get(j).step();
        attractionPoints.get(j).avoidEdges();
        moldList.get(i).goTowardsPoint(attractionPoints.get(j).location, width, 100, 2);
        for (int n = 0; n < attractionPoints.size(); n++) {
          attractionPoints.get(j).avoidPoint(attractionPoints.get(n).location, 20, 50, 2);
        }
      }

      for (int j = 0; j < moldList.size(); j++) 
        if (moldList.get(i).species != moldList.get(j).species)

          for (int n = 0; n < moldList.get(j).particles.size(); n++) 
            if (!moldList.get(j).particles.get(n).isOutOfBounds())
              moldList.get(i).avoidPoint(moldList.get(j).particles.get(n).location, 100, 100, 1);


      moldList.get(i).avoidEdges();
    }
    moldList.get(i).display();



    //    stroke(255, 0, 0);
    //    strokeWeight(10);
    //    for (int j = 0; j < attractionPoints.size(); j++) {
    //      point(attractionPoints.get(j).location.x, attractionPoints.get(j).location.y);
    //    }
  }
  if (previous.isPressed()) {
    if (slimeN == 0)
      slimeN = moldList.size()-1;
    else
      slimeN--;
  }
  if (next.isPressed()) {
    if (slimeN == moldList.size()-1)
      slimeN = 0;
    else
      slimeN++;
  }
  if (pause.isPressed()) {
    if (isPaused)
      isPaused = false;
    else
      isPaused = true;
  }
  scp.get(slimeN).display(moldList.get(slimeN).particles.size(), 1, 100, 1, 100);
  previous.display();
  next.display();
  pause.display();
}
