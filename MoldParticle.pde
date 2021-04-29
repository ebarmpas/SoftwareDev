class MoldParticle extends PerlinWalker {

  PVector trail[];
  color gradient[];
  color headColor;
  int ind;
  int maxLength;


  color lineColor;

  MoldParticle(PVector loc, int maxL, color foreground) {
    super(loc);
    maxLength = maxL;
    colorMode(HSB);
    headColor = foreground;
    float hue = hue(foreground);
    float saturation = saturation(foreground);
    float brightness = brightness(foreground);

    ind = 0;

    lineColor = foreground;
  
    trail = new PVector[maxLength];
    gradient = new color[maxLength];
    for (int i = 0; i < maxLength; i++) {
      trail[i] = loc;
      gradient[i] = color(hue, saturation, brightness/(maxLength)*i);
    }

  }
  void calculateTrail() {
    trail[ind] = new PVector(location.x, location.y);
    ind = (ind+1) % maxLength;
  }
  void display() {
    stroke(headColor);
    strokeWeight(3);
    point(location.x, location.y);
    for (int i = 0; i < maxLength; i++) {
      stroke(gradient[i]);
      point(trail[(i+ind)%maxLength].x, trail[(i+ind)%maxLength].y);
    }
  }
  /*void drawVectors() {
   colorMode(RGB);
   stroke(color(0, 255, 0));
   line(location.x, location.y, 
   location.x+acceleration.x, location.y+acceleration.y);
   stroke(0);
   strokeWeight(1);
   colorMode(HSB);
   }*/



  /*void bounceOnEdges() {
   if (location.x <= 0) {
   location.x = 2;
   velocity.x *= -10;
   }
   if (location.x >= width) {
   location.x = width - 2;
   velocity.x *=-10;
   }
   if (location.y <= 0){
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
   }*/
}
