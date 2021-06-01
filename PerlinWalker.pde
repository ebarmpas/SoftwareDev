class PerlinWalker {
  PVector acceleration;
  PVector velocity;
  PVector location;

  int cutOffDivider = 8;
  int edgeRepulsion = 100;
  int maxSpeed;
  float x;
  float y;
  float tx, ty;
  PerlinWalker(PVector loc, int ms) {

    location = new PVector(loc.x, loc.y);
    acceleration = PVector.random2D();

    maxSpeed = ms;

    tx=0;
    ty=0;
    x=map(noise(tx), 0, 1, 0, width);
    y=map(noise(ty), 0, 1, 0, height);

    velocity = new PVector (x, y);
    velocity = new PVector ();
  }
  void step() {
    acceleration.limit(2500);
    velocity.add(acceleration);
    tx+=0.2;
    ty+=0.2;
    x=map(noise(tx), 0, 1, 0, width);
    y=map(noise(ty), 0, 1, 0, height);
    velocity.add(x, y);
    velocity.limit(maxSpeed);
    location.add(velocity);
  }
  void applyForce(PVector force) {

    acceleration.add(force);
  }


  void avoidEdges() {
    PVector force = new PVector();
    if (location.x > width - (width/cutOffDivider)) {
      force.x = -1 * map(location.x, width - (width/cutOffDivider), width, 1, edgeRepulsion);
    } else if (location.x < width/cutOffDivider) {
      force.x = map(location.x, 0, width/cutOffDivider, 1, edgeRepulsion);
    }
    if (location.y > height - (height/cutOffDivider)) {
      force.y = -1 * map(location.y, height - (height/cutOffDivider), height, 1, edgeRepulsion);
    } else if (location.y < height/cutOffDivider) {
      force.y = map(location.y, 0, (height/cutOffDivider), 1, edgeRepulsion);
    }
    applyForce(force);
  }
  boolean isOutOfBounds() {
    if (location.x >= width - width/cutOffDivider || location.x <= width/cutOffDivider || location.y >= height - height / cutOffDivider|| location.y <= height / cutOffDivider)
      return true;

    return false;
  }

  void bounceOnEdges() {
    if (location.x <= 0) 
      velocity.x *= -1;
    else if (location.x >= width) 
      velocity.x *=-1;
  
    if (location.y <= 0) 
      velocity.y *= -1;
    else if (location.y >= height) 
      velocity.y *=-1;
    
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
