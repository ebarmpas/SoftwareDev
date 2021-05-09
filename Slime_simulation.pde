ArrayList <Mold> moldList; //<>//

ArrayList <SlimeControlPanel> scp;
ArrayList<Integer> maxSize;
ArrayList<Integer> currentSize;
ArrayList<Integer> growthRate;
ArrayList<Float> coherencyM;
ArrayList<Integer> coherencyL;
ArrayList<Float> xenophobiaM;
ArrayList<Integer> xenophobiaL;
ArrayList <Integer> moldColor;

boolean isPaused;

Button previous, next, pause;
Button add, remove;

int activeSpecies;

color []colorPalette = {color(255, 255, 0), color(255, 0, 255), color(0, 255, 255), color(255, 127, 0), color(255, 0, 127), color(0, 255, 127)};
boolean []isAvaibleColor;

PVector middle;

final int framerate = 60;
void setup() {
  //P2D supposedly uses OpenGL to render but performance seems the same.
  size(1600, 900, P2D);
  //I doubt these are doing anything but at this point we are desperate for better performance.
  noSmooth();
  hint(DISABLE_OPENGL_ERRORS);
  hint(DISABLE_TEXTURE_MIPMAPS);

  moldList = new ArrayList<Mold>();
  scp = new ArrayList<SlimeControlPanel>();
  maxSize = new ArrayList<Integer>();
  currentSize = new ArrayList<Integer>();
  growthRate = new ArrayList<Integer>();
  coherencyM = new ArrayList<Float>();
  coherencyL = new ArrayList<Integer>();
  xenophobiaM = new ArrayList<Float>();
  xenophobiaL = new ArrayList<Integer>();
  moldColor = new ArrayList<Integer>();
  middle = new PVector (width/2, height/2);
  isAvaibleColor = new boolean[colorPalette.length];
  for (int i = 0; i < isAvaibleColor.length; i++)
    isAvaibleColor[i] = true; 

  previous = new Button(new PVector(25, 30), new PVector(25+90, 30+35), '[', "<-([)", color(0), color(255), color(255));
  next = new Button(new PVector(25+90+12, 30), new PVector(25+90*2+12, 30+35), ']', "(])->", color(0), color(255), color(255));

  pause = new Button(new PVector(width-25-120, height-25-35), new PVector(width-25, height-25), ' ', "Pause (space)", color(0), color(255), color(255));

  add = new Button(new PVector(25, height-25-35), new PVector(25+90, height-25), char(10), "add(enter)", color(0), color(255), color(255));
  remove =  new Button(new PVector(25+90+12, height-25-35), new PVector(25+90*2+12, height- 25), char(127), "delete(del)", color(0), color(255), color(255));
  activeSpecies = 0;
  isPaused = true;

  addSlime();
  frameRate(framerate);
}

void draw() {

  background(0);
  for (int i = 0; i < moldList.size(); i++) {
    if (!isPaused) {


      if (maxSize.get(i) >= currentSize.get(i)) {
        if ( maxSize.get(i)-currentSize.get(i) > growthRate.get(i))
          moldList.get(i).addParticles(growthRate.get(i));
        else
          moldList.get(i).addParticles(maxSize.get(i)-currentSize.get(i));

        currentSize.set(i, moldList.get(i).particles.size());
      }

      if (maxSize.get(i) <= currentSize.get(i)) {
        if ( currentSize.get(i) - maxSize.get(i) > growthRate.get(i))
          moldList.get(i).removeParticles(growthRate.get(i));
        else
          moldList.get(i).removeParticles(currentSize.get(i)-maxSize.get(i));

        currentSize.set(i, moldList.get(i).particles.size());
      }
      moldList.get(i).step();
      moldList.get(i).cohere(width, coherencyL.get(i), coherencyM.get(i));

      for (int j = 0; j < moldList.size(); j++) 
        if (i!=j)

          for (int n = 0; n < moldList.get(j).particles.size(); n++) 
            if (!moldList.get(j).particles.get(n).isOutOfBounds())
              moldList.get(i).avoidPoint(moldList.get(j).particles.get(n).location, 100, 100, 1);

      //moldList.get(i).goTowardsPoint(middle, width, 100, 20000); 
      //moldList.get(i).goTowardsPoint(new PVector(width-width/2, height-height/2), width, 100, 20000); 
      //moldList.get(i).goTowardsPoint(new PVector(width/2, height/2), width, 100, 20000); 

      moldList.get(i).avoidEdges();
    }
    moldList.get(i).display();
  }
  if (previous.isPressed()) {
    if (activeSpecies == 0)
      activeSpecies = moldList.size()-1;
    else
      activeSpecies--;
  }
  if (next.isPressed()) {
    if (activeSpecies == moldList.size()-1)
      activeSpecies = 0;
    else
      activeSpecies++;
  }
  if (pause.isPressed()) {
    if (isPaused)
      isPaused = false;
    else 
      isPaused = true;
  }
  if (add.isPressed()) {
    if (moldList.size()<colorPalette.length) 
      addSlime();
  }
  if (remove.isPressed()) {
    if (moldList.size()>1)
      removeSlime(activeSpecies);
  }

  if (scp.get(activeSpecies).decreaseSize5.isPressed() && maxSize.get(activeSpecies) > 5)
    maxSize.set(activeSpecies, maxSize.get(activeSpecies)-5);
  if (scp.get(activeSpecies).increaseSize5.isPressed())
    maxSize.set(activeSpecies, maxSize.get(activeSpecies)+5);

  if (scp.get(activeSpecies).decreaseSize50.isPressed() && maxSize.get(activeSpecies) > 50)
    maxSize.set(activeSpecies, maxSize.get(activeSpecies)-50);
  if (scp.get(activeSpecies).increaseSize50.isPressed())
    maxSize.set(activeSpecies, maxSize.get(activeSpecies)+50);

  if (scp.get(activeSpecies).decreaseSize250.isPressed() && maxSize.get(activeSpecies) > 250)
    maxSize.set(activeSpecies, maxSize.get(activeSpecies)-250);
  if (scp.get(activeSpecies).increaseSize250.isPressed())
    maxSize.set(activeSpecies, maxSize.get(activeSpecies)+250);


  if (scp.get(activeSpecies).decreaseRate1.isPressed() && growthRate.get(activeSpecies) - 1 >= 0)
    growthRate.set(activeSpecies, growthRate.get(activeSpecies)-1);
  if (scp.get(activeSpecies).increaseRate1.isPressed())
    growthRate.set(activeSpecies, growthRate.get(activeSpecies)+1);

  if (scp.get(activeSpecies).decreaseRate10.isPressed() && growthRate.get(activeSpecies) - 10 >= 0)
    growthRate.set(activeSpecies, growthRate.get(activeSpecies)-10);
  if (scp.get(activeSpecies).increaseRate10.isPressed())
    growthRate.set(activeSpecies, growthRate.get(activeSpecies)+10);

  if (scp.get(activeSpecies).decreaseCoherencyM_0_1.isPressed() && coherencyM.get(activeSpecies) >= 0.1)
    coherencyM.set(activeSpecies, coherencyM.get(activeSpecies)-0.1);
  if (scp.get(activeSpecies).increaseCoherencyM_0_1.isPressed())
    coherencyM.set(activeSpecies, coherencyM.get(activeSpecies)+0.1);

  if (scp.get(activeSpecies).decreaseCoherencyM1.isPressed() && coherencyM.get(activeSpecies) >= 1)
    coherencyM.set(activeSpecies, coherencyM.get(activeSpecies)-1);
  if (scp.get(activeSpecies).increaseCoherencyM1.isPressed())
    coherencyM.set(activeSpecies, coherencyM.get(activeSpecies)+1);

  if (scp.get(activeSpecies).decreaseCoherencyL1.isPressed() && coherencyL.get(activeSpecies) >= 1)
    coherencyL.set(activeSpecies, coherencyL.get(activeSpecies)-1);
  if (scp.get(activeSpecies).increaseCoherencyL1.isPressed())
    coherencyL.set(activeSpecies, coherencyL.get(activeSpecies)+1);

  if (scp.get(activeSpecies).decreaseCoherencyL10.isPressed() && coherencyL.get(activeSpecies) >= 10)
    coherencyL.set(activeSpecies, coherencyL.get(activeSpecies)-10);
  if (scp.get(activeSpecies).increaseCoherencyL10.isPressed())
    coherencyL.set(activeSpecies, coherencyL.get(activeSpecies)+10);

  if (scp.get(activeSpecies).decreaseCoherencyL50.isPressed() && coherencyL.get(activeSpecies) >= 50)
    coherencyL.set(activeSpecies, coherencyL.get(activeSpecies)-50);
  if (scp.get(activeSpecies).increaseCoherencyL50.isPressed())
    coherencyL.set(activeSpecies, coherencyL.get(activeSpecies)+50);


  if (scp.get(activeSpecies).decreaseXenophobiaM_0_1.isPressed() && xenophobiaM.get(activeSpecies) >= 0.1)
    xenophobiaM.set(activeSpecies, xenophobiaM.get(activeSpecies)- 0.1);
  if (scp.get(activeSpecies).increaseXenophobiaM_0_1.isPressed())
    xenophobiaM.set(activeSpecies, xenophobiaM.get(activeSpecies) + 0.1);

  if (scp.get(activeSpecies).decreaseXenophobiaM1.isPressed() && xenophobiaM.get(activeSpecies) >= 1)
    xenophobiaM.set(activeSpecies, xenophobiaM.get(activeSpecies)- 1);
  if (scp.get(activeSpecies).increaseXenophobiaM1.isPressed())
    xenophobiaM.set(activeSpecies, xenophobiaM.get(activeSpecies) + 1);

  if (scp.get(activeSpecies).decreaseXenophobiaL1.isPressed() && xenophobiaL.get(activeSpecies) >= 1)
    xenophobiaL.set(activeSpecies, xenophobiaL.get(activeSpecies)- 1);
  if (scp.get(activeSpecies).increaseXenophobiaL1.isPressed())
    xenophobiaL.set(activeSpecies, xenophobiaL.get(activeSpecies) + 1);

  if (scp.get(activeSpecies).decreaseXenophobiaL10.isPressed() && xenophobiaL.get(activeSpecies) >= 10)
    xenophobiaL.set(activeSpecies, xenophobiaL.get(activeSpecies)- 10);
  if (scp.get(activeSpecies).increaseXenophobiaL10.isPressed())
    xenophobiaL.set(activeSpecies, xenophobiaL.get(activeSpecies) + 10);

  if (scp.get(activeSpecies).decreaseXenophobiaL50.isPressed() && xenophobiaL.get(activeSpecies) >= 50)
    xenophobiaL.set(activeSpecies, xenophobiaL.get(activeSpecies)- 50);
  if (scp.get(activeSpecies).increaseXenophobiaL10.isPressed())
    xenophobiaL.set(activeSpecies, xenophobiaL.get(activeSpecies) + 50);

  scp.get(activeSpecies).display(currentSize.get(activeSpecies), maxSize.get(activeSpecies), growthRate.get(activeSpecies), coherencyM.get(activeSpecies), coherencyL.get(activeSpecies), xenophobiaM.get(activeSpecies), xenophobiaL.get(activeSpecies));
  previous.display();
  next.display();
  pause.display();
  add.display();
  remove.display();
}

void addSlime() {
  int colorIndex = nextAvaibleColor();
  scp.add(new SlimeControlPanel(new PVector(25, 75), colorPalette[colorIndex]));

  maxSize.add(250);
  currentSize.add(200);
  growthRate.add(1);
  coherencyM.add(1.0);
  coherencyL.add(100);
  xenophobiaM.add(1.0);
  xenophobiaL.add(100);

  moldColor.add(colorIndex);
  isAvaibleColor[colorIndex] = false;

  moldList.add(new Mold(currentSize.get(moldList.size()), colorPalette[colorIndex]));
  activeSpecies = moldList.size()-1;
}
int nextAvaibleColor() {
  for (int i = 0; i < colorPalette.length; i++)
    if (isAvaibleColor[i] == true)
      return i;

  return -1;
}
void removeSlime(int index) {

  scp.remove(index);

  maxSize.remove(index);
  currentSize.remove(index);
  growthRate.remove(index);
  coherencyM.remove(index);
  coherencyL.remove(index);
  xenophobiaM.remove(index);
  xenophobiaL.remove(index);
  isAvaibleColor[moldColor.get(index)] = true;
  moldColor.remove(index);

  moldList.remove(index);
  activeSpecies=0;
}
