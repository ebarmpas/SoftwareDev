class Button {
  PVector corner1, corner3;
  char assignedKey;
  String label;
  color fillColor;
  color outlineColor;
  color textColor;
  int textSize;
  int delay = 0;
  int maxDelay = 8;
  Button(PVector c1, PVector c3, char k, String l, color fc, color oc, color tc) {
    corner1 = new PVector(c1.x, c1.y);
    corner3 = new PVector(c3.x, c3.y);
    fillColor = fc;
    outlineColor = oc;
    textColor = tc;
    assignedKey = k;
    label = l;
    textSize = corner3.y  - corner1.y  >  corner3.x - corner1.x  ? int((corner3.x - corner1.x)/2.5) : int((corner3.y  - corner1.y)/2);
  }

  boolean isPressed() {
    if (keyPressed && key == assignedKey && delay >= maxDelay) {
      delay = 0;
      return true;
    }
    delay++;
    return false;
  }

  void display() {
    stroke(outlineColor);
    fill(fillColor);
    rectMode(CORNERS);
    rect(corner1.x, corner1.y, corner3.x, corner3.y);
    fill(textColor);
    textSize(textSize);
    textAlign(CENTER, CENTER);
    text(label, (corner1.x + corner3.x)/2, + (corner1.y + corner3.y)/2);
  }
}
