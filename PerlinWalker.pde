class PerlinWalker {
  PVector velocity;
  PVector acceleration;
  PVector location;

  int cutOffDivider = 8;
  int edgeRepulsion = 50;

  float x;
  float y;
  float tx, ty;
  PerlinWalker(PVector loc) {

    location = new PVector(loc.x, loc.y);
    acceleration = PVector.random2D();

    tx=0;
    ty=0;
    x=map(noise(tx), 0, 1, 0, width);
    y=map(noise(ty), 0, 1, 0, height);

    velocity = new PVector (x, y);
  }
  void step() {
    //println("aa");
    velocity.add(acceleration);
    tx+=1;
    ty+=1;
    x=map(noise(tx), 0, 1, 0, width);
    y=map(noise(ty), 0, 1, 0, height);
    velocity.add(x, y).mult(0.001);
    velocity.limit(4);    
    location.add(velocity);
  }
  void applyForce(PVector force) {
   
    acceleration.add(force);
  }

  void avoidPoint(PVector point, int cutOff) {
    PVector f = PVector.sub(location, point);
    if (f.magSq() < cutOff*cutOff){
      applyForce(PVector.sub(location, point));
      println("avoid");
    }
  }
  void goTowardsPoint(PVector point, int cutOff, int l) {
    PVector f = PVector.sub(point, location);
    if(f.magSq() < cutOff*cutOff){
      applyForce(f.limit(l));
    }
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
    if (location.x > width)
      location.x = width-1;
    else if (location.x <0)
      location.x = 1;

    //if (location.y > height)
    //  location.y = height-1;
    //else if (location.y <0)
    //  location.y = 1;
    applyForce(force);
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
