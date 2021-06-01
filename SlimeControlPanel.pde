class SlimeControlPanel {
  PVector start;
  int buttonSizeX = 90;
  int buttonSizeY = 35;

  int labelSize =21;

  int paddingSize = 12;

  color slimeColor;
  Button decreaseSize5;
  Button increaseSize5;

  Button decreaseSize50;
  Button increaseSize50;

  Button decreaseSize250;
  Button increaseSize250;

  Button decreaseRate1;
  Button increaseRate1;

  Button decreaseRate10;
  Button increaseRate10;

  //  Button decreaseRate250;
  //  Button increaseRate250;

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

  Button decreaseXenophobiaL1;
  Button increaseXenophobiaL1;

  Button decreaseXenophobiaL10;
  Button increaseXenophobiaL10;

  Button decreaseXenophobiaL50;
  Button increaseXenophobiaL50;

  SlimeControlPanel(PVector s, color c) {
    start = new PVector(s.x, s.y);
    slimeColor = c;
    int row = 0;

    decreaseSize5 = new Button(new PVector(s.x, s.y + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY + labelSize), 'q', "-5(q)", color(0), c, color(255));
    increaseSize5 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY + labelSize), 'w', "+5(w)", color(0), c, color(255));
    row++;
    decreaseSize50 = new Button(new PVector(s.x, s.y + buttonSizeY + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'a', "-50(a)", color(0), c, color(255));
    increaseSize50 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY + labelSize), new PVector(s.x + buttonSizeX *2 + paddingSize, s.y + buttonSizeY*(row+1) + labelSize), 's', "+50(s)", color(0), c, color(255));
    row++;
    decreaseSize250 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY*(row+1) + labelSize), 'z', "-250(z)", color(0), c, color(255));
    increaseSize250 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY*2 + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY*(row+1) + labelSize), 'x', "+250(x)", color(0), c, color(255));
    row++;
    row++;

    decreaseRate1 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'e', "-1(e)", color(0), c, color(255));
    increaseRate1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'r', "+1(r)", color(0), c, color(255));
    row++;
    decreaseRate10 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'd', "-10(d)", color(0), c, color(255));
    increaseRate10 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'f', "+10(f)", color(0), c, color(255));
    //row++;
    //decreaseRate250 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'c', "-250(c)", color(0), c, color(255));
    //increaseRate250 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'v', "+250(v)", color(0), c, color(255));
    row++;
    row++;
    decreaseCoherencyM_0_1 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 't', "-0.1(t)", color(0), c, color(255));
    increaseCoherencyM_0_1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'y', "+0.1(y)", color(0), c, color(255));
    row++;
    decreaseCoherencyM1 = new Button(new PVector(s.x, s.y + buttonSizeY* row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'g', "-1(g)", color(0), c, color(255));
    increaseCoherencyM1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'h', "+1(h)", color(0), c, color(255));
    row++;
    row++;

    decreaseCoherencyL1 = new Button(new PVector(s.x, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'u', "-1(u)", color(0), c, color(255));
    increaseCoherencyL1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'i', "+1(i)", color(0), c, color(255));
    row++;
    decreaseCoherencyL10 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'j', "-10(j)", color(0), c, color(255));
    increaseCoherencyL10 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'k', "+10(k)", color(0), c, color(255));
    row++;
    decreaseCoherencyL50 = new Button(new PVector(s.x, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'm', "-50(m)", color(0), c, color(255));
    increaseCoherencyL50 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), ',', "+50(,)", color(0), c, color(255));
    row++;
    row++;

    decreaseXenophobiaM_0_1 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'o', "-0.1(o)", color(0), c, color(255));
    increaseXenophobiaM_0_1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), 'p', "+0.1(p)", color(0), c, color(255));
    row++;
    decreaseXenophobiaM1 = new Button(new PVector(s.x, s.y + buttonSizeY* row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), 'l', "-1(l)", color(0), c, color(255));
    increaseXenophobiaM1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), ';', "+1(;)", color(0), c, color(255));
    row++;
    row++;

    decreaseXenophobiaL1 = new Button(new PVector(s.x, s.y + buttonSizeY*row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), '1', "-1(1)", color(0), c, color(255));
    increaseXenophobiaL1 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), '2', "+1(2)", color(0), c, color(255));
    row++;
    decreaseXenophobiaL10 = new Button(new PVector(s.x, s.y + buttonSizeY* row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), '3', "-10(3)", color(0), c, color(255));
    increaseXenophobiaL10 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), '4', "+10(4)", color(0), c, color(255));
    row++;
    decreaseXenophobiaL50 = new Button(new PVector(s.x, s.y + buttonSizeY* row + labelSize), new PVector(s.x + buttonSizeX, s.y + buttonSizeY * (row+1) + labelSize), '5', "-50(5)", color(0), c, color(255));
    increaseXenophobiaL50 = new Button(new PVector(s.x + buttonSizeX + paddingSize, s.y + buttonSizeY * row + labelSize), new PVector(s.x + buttonSizeX * 2 + paddingSize, s.y + buttonSizeY * (row+1) + labelSize), '6', "+50(6)", color(0), c, color(255));
  }
  void display(int currentSize, int maxSize, int growthRate, float slimeCoherencyM, int slimeCoherencyL, float slimeXenophobiaM, int slimeXenophobiaL) {
    fill(slimeColor);
    textSize(labelSize);

    text("Size : " + maxSize + " ( " + currentSize + " )", start.x + buttonSizeX + (paddingSize/2), start.y);
    text("Growth : " + growthRate + " ( " + String.format("%.2f", (100-((maxSize-currentSize)/float(maxSize)*100))) + "% )", start.x + buttonSizeX + (paddingSize/2), start.y + buttonSizeY*4); //FIX
    text("Coherency M : " + String.format("%.2f", slimeCoherencyM), start.x + buttonSizeX + (paddingSize/2), start.y + buttonSizeY*7);
    text("Coherency L : " + slimeCoherencyL, start.x + buttonSizeX + (paddingSize/2), start.y + buttonSizeY*10);
    text("Xenophobia M : " + String.format("%.2f", slimeXenophobiaM), start.x + buttonSizeX + (paddingSize/2), start.y + buttonSizeY*14);
    text("Xenophobia L : " + slimeXenophobiaL, start.x + buttonSizeX + (paddingSize/2), start.y + buttonSizeY*17);

    decreaseSize5.display();
    increaseSize5.display();

    decreaseSize50.display();
    increaseSize50.display();

    decreaseSize250.display();
    increaseSize250.display();

    decreaseRate1.display();
    increaseRate1.display();

    decreaseRate10.display();
    increaseRate10.display();

    //    decreaseRate250.display();
    //    increaseRate250.display();

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

    decreaseXenophobiaL1.display();
    increaseXenophobiaL1.display();

    decreaseXenophobiaL10.display();
    increaseXenophobiaL10.display();

    decreaseXenophobiaL50.display();
    increaseXenophobiaL50.display();
  }
}
