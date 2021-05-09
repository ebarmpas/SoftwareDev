class SlimeControlPanel {
  PVector start;

  int buttonSizeX = 85;
  int buttonSizeY = 35;

  int labelSize = 19;

  int paddingSize = 8;

  Button decreaseSize5;
  Button increaseSize5;

  Button decreaseSize50;
  Button increaseSize50;

  Button decreaseSize250;
  Button increaseSize250;

  Button decreaseCoherencyM_0_1;
  Button increaseCoherencyM_0_1;

  Button decreaseCoherencyM1;
  Button increaseCoherencyM1;

  Button decreaseCoherencyL1;
  Button increaseCoherencyL1;

  Button decreaseCoherencyL10;
  Button increaseCoherencyL10;

  Button decreaseCoherencyL50;
  Button increaseCoherencyL50;

  Button decreaseXenophobiaM_0_1;
  Button increaseXenophobiaM_0_1;

  Button decreaseXenophobiaM1;
  Button increaseXenophobiaM1;

  Button decreaseXenophobiaL_0_1;
  Button increaseXenophobiaL_0_1;

  Button decreaseXenophobiaL1;
  Button increaseXenophobiaL1;
  
  
  color slimeColor;
  SlimeControlPanel(PVector s, color c) {
    start = new PVector(s.x, s.y);
    slimeColor = c;
    int row = 0;

    decreaseSize5 = new Button(new PVector(s.x, s.y + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY + labelSize), 'q', "-5(q)", color(0), c, color(255));
    increaseSize5 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY + labelSize), 'w', "+5(w)", color(0), c, color(255));
    row++;
    decreaseSize50 = new Button(new PVector(s.x, s.y + buttonSizeY + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'q', "-50(a)", color(0), c, color(255));
    increaseSize50 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY + labelSize), new PVector(s.x + buttonSizeX *2 + paddingSize, s.y + buttonSizeY*(row+1) + labelSize), 'w', "+50(s)", color(0), c, color(255));
    row++;
    decreaseSize250 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY*(row+1) + labelSize), 'z', "-250(z)", color(0), c, color(255));
    increaseSize250 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY*2 + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY*(row+1) + labelSize), 'x', "+250(x)", color(0), c, color(255));
    row++;
    row++;
    decreaseCoherencyM_0_1 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'e', "-0.1(e)", color(0), c, color(255));
    increaseCoherencyM_0_1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY*4 + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY*(row+1) + labelSize), 'r', "+0.1(r)", color(0), c, color(255));
    row++;
    decreaseCoherencyM1 = new Button(new PVector(s.x, s.y + buttonSizeY* row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'd', "-1(d)", color(0), c, color(255));
    increaseCoherencyM1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'f', "+1(f)", color(0), c, color(255));
    row++;
    row++;
    decreaseCoherencyL1 = new Button(new PVector(s.x, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 't', "-1(t)", color(0), c, color(255));
    increaseCoherencyL1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'y', "+1(y)", color(0), c, color(255));
    row++;
    decreaseCoherencyL10 = new Button(new PVector(s.x, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * 9 + labelSize), 'g', "-10(g)", color(0), c, color(255));
    increaseCoherencyL10 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'h', "+10(h)", color(0), c, color(255));
    row++;
    decreaseCoherencyL50 = new Button(new PVector(s.x, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'b', "-10(b)", color(0), c, color(255));
    increaseCoherencyL50 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'n', "+10(n)", color(0), c, color(255));
    row++;
    row++;
    decreaseXenophobiaM_0_1 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'u', "-0.1(u)", color(0), c, color(255));
    increaseXenophobiaM_0_1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'i', "+0.1(i)", color(0), c, color(255));
    row++;
    decreaseXenophobiaM1 = new Button(new PVector(s.x, s.y + buttonSizeY* row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'j', "-1(j)", color(0), c, color(255));
    increaseXenophobiaM1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'k', "+1(k)", color(0), c, color(255));
    row++;
    row++;
    decreaseXenophobiaL_0_1 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'o', "-0.1(o)", color(0), c, color(255));
    increaseXenophobiaL_0_1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'p', "+0.1(p)", color(0), c, color(255));
    row++;
    decreaseXenophobiaL1 = new Button(new PVector(s.x, s.y + buttonSizeY* row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'l', "-1(l)", color(0), c, color(255));
    increaseXenophobiaL1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), ';', "+1(;)", color(0), c, color(255));
    
  }
  void display(int slimeSize, float slimeCoherencyM, int slimeCoherencyL, int slimeXenophobiaM, int slimeXenophobiaL) {

    fill(slimeColor);
    textSize(labelSize);
    text("Size : " + slimeSize, start.x + buttonSizeX + (paddingSize/2), start.y);
    text("Coherency M : " + slimeCoherencyM, start.x + buttonSizeX + (paddingSize/2), start.y + buttonSizeY*4);
    text("Coherency L : " + slimeCoherencyL, start.x + buttonSizeX + (paddingSize/2), start.y + buttonSizeY*7);
    text("Xenophobia M : " + slimeXenophobiaM, start.x + buttonSizeX + (paddingSize/2), start.y + buttonSizeY*11);
    text("Xenophobia L : " + slimeXenophobiaL, start.x + buttonSizeX + (paddingSize/2), start.y + buttonSizeY*14);

    decreaseSize5.display();
    increaseSize5.display();

    decreaseSize50.display();
    increaseSize50.display();

    decreaseSize250.display();
    increaseSize250.display();

    decreaseCoherencyM_0_1.display();
    increaseCoherencyM_0_1.display();

    decreaseCoherencyM1.display();
    increaseCoherencyM1.display();

    decreaseCoherencyL1.display();
    increaseCoherencyL1.display();

    decreaseCoherencyL10.display();
    increaseCoherencyL10.display();

    decreaseCoherencyL50.display();
    increaseCoherencyL50.display();

    decreaseXenophobiaM_0_1.display();
    increaseXenophobiaM_0_1.display();

    decreaseXenophobiaM1.display();
    increaseXenophobiaM1.display();
    
    decreaseXenophobiaL_0_1.display();
    increaseXenophobiaL_0_1.display();

    decreaseXenophobiaL1.display();
    increaseXenophobiaL1.display();
  }
}
