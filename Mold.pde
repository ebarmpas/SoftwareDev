class Mold {

  PVector velocity;
  PVector acceleration;
  PVector location;
  float x;
  float y;
  float tx, ty;

  int id;

  int cutOffDivider = 7;
  int edgeRepulsion = 150;
  PVector trail[];
  color[] gradient;
  int ind;
  int maxLength = 250;


  color lineColor;

  Mold(float xLoc, float yLoc, int it, color foreground) {
    id = it;

    colorMode(HSB);
    float hue = hue(foreground);
    float saturation = saturation(foreground);
    float brightness = brightness(foreground);

    ind = 0;

    lineColor = foreground;
    location = new PVector(xLoc, yLoc);

    trail = new PVector[maxLength];
    gradient = new color[maxLength];
    for (int i = 0; i < maxLength; i++) {
      trail[i] = new PVector(xLoc, yLoc);
      gradient[i] = color(hue, saturation, brightness/(maxLength)*i);
    }

    acceleration = PVector.random2D();

    tx=0;
    ty=0;
    x=map(noise(tx), 0, 1, 0, width);
    y=map(noise(ty), 0, 1, 0, height);

    velocity = new PVector (x, y);
  }

  void step() {
    velocity.add(acceleration);
    tx+=0.1;
    ty+=0.1;
    x=map(noise(tx), 0, 1, 0, width);
    y=map(noise(ty), 0, 1, 0, height);
    velocity.add(x, y);
    velocity.limit(6);    
    location.add(velocity);

    trail[ind] = new PVector(location.x, location.y);
    ind = (ind+1) % maxLength;
  }
  void display() {
    strokeWeight(8);
    point(location.x, location.y);
    for (int i = 0; i < maxLength; i++) {
      stroke(gradient[i]);
      point(trail[(i+ind)%maxLength].x, trail[(i+ind)%maxLength].y);
    }
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void avoidEdges() {
    float x = 0;
    float y = 0;
    if (location.x > width - (width/cutOffDivider)) {
      x = -1 * map(location.x, width - (width/cutOffDivider), width, 1, edgeRepulsion);
    } else if (location.x < width/cutOffDivider) {
      x = map(location.x, 0, width/cutOffDivider, 1, edgeRepulsion);
    }
    if (location.y > height - (height/cutOffDivider)) {
      y = -1 * map(location.y, height - (height/cutOffDivider), height, 1, edgeRepulsion);
    } else if (location.y < height/cutOffDivider) {
      y = map(location.y, 0, (height/cutOffDivider), 1, edgeRepulsion);
    }

    applyForce(new PVector(x, y));
  }

  void bounceOnEdges() {
    if (location.x <= 0) {
      location.x = 2;
      velocity.x *= -10;
    }
    if (location.x >= width) {
      location.x = width - 2;
      velocity.x *=-10;
    }
    if (location.y <= 0) {
      location.y = 2;
      velocity.y *= -10;
    }
    if (location.y >= height) {
      location.y = height - 2;
      velocity.y *=-10;
    }
  }

  void passEdges() {
    if (location.x < 0)
      location.x = width;
    if (location.x > width)
      location.x = 0;
    if (location.y < 0)
      location.y = height;
    if (location.y > height)
      location.y = 0;
  }

}
