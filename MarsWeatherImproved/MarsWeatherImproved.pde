/*
Autor: Trummer Julia, Trummer Melina, 
*/

PGraphics planetOrbitLayer;
PGraphics background;

Sun sun;
TimeLine timeLine;
Textinformation textInfo;
color baseColor = color(253, 266, 182);
color highlightColor = color(253, 266, 182);

Orbit[] orbits;
float[] orbitalSpeeds = {0.33, 0.73, 1, 0.808, 0.439, 0.325, 0.228, 0.182};
float[] planetSizes = {0.383, 0.949, 1, 0.532, 11.21, 9.45, 4.01, 3.88};
int[] orbitRadii = {300, 400, 500, 660, 820, 980, 1140, 1300};
int[] orbitHeights = {100, 125, 150, 175, 200, 225, 250, 275};
color[] orbitColors = {baseColor, baseColor, baseColor, color(182, 108, 73), baseColor, baseColor, baseColor, baseColor};

color startColor = color(15, 17, 15);
color endColor = color(81, 66, 58);
int numSteps = 18;
float stepHeight;
int iteration = 0;
int circleRadius = 10;
int solCounter = 0;

void setup() {
    fullScreen();
    stepHeight = height / float(numSteps);
    
    noStroke();
    frameRate(30);
    fill(102);
    ellipseMode(CENTER);
    
    planetOrbitLayer = createGraphics(width, height);
    background = createGraphics(width, height);
    timeLine = new TimeLine();
    sun = new Sun(10);
    textInfo = new Textinformation();
    
    background.beginDraw();
    generateBackground();
    timeLine.createTimeLine(background);
    textInfo.createTextLeftCorner(background);
    textInfo.createTextRightCorner(background);
    
    orbits = new Orbit[orbitalSpeeds.length];
    for (int i = 0; i < orbits.length; i++) {
        orbits[i] = new Orbit(orbitRadii[i], orbitHeights[i], orbitalSpeeds[i], orbitColors[i]);
        orbits[i].createOrbit(background);
    }
    sun.createSun(background);
    background.endDraw();
    image(background, 0, 0);
}

void draw() {
    image(background, 0, 0);
    drawPlanets();
    updateIteration();
    updateSolCounter();
    textInfo.createTextLeftBottomCorner(solCounter);
}

void drawPlanets() {
    circle(75 + iteration / 10, height - 100, 10);
    fill(253, 266, 182);
    noStroke();
    if(iteration < 1600) {
        for (int i = 0; i < orbits.length; i++) {
            fill(253, 266, 182);
            PVector coord = orbits[i].getCoordinates(iteration);
            float size = circleRadius * planetSizes[i] * (i < 4 ? 2 : 0.5);
            if (i == 3) {
              fill(182, 108, 73);
            }
            circle(coord.x, coord.y, size);
        }
        iteration++;
      } else {
              iteration = 0;
      }
}

void updateIteration() {
  if(iteration >= 1600) {
          iteration = 0;
  } else {
          iteration++;
  }
}

void updateSolCounter() {
  if(iteration % 16 == 0) {
      solCounter = iteration / 16;
  }
}

void generateBackground() {
    for (int i = 0; i < numSteps; i++) {
        float t = map(i, 0, numSteps - 1, 0, 1);
        color stepColor = lerpColor(startColor, endColor, t);
        background.fill(stepColor);
        background.noStroke();
        background.rect(0, i * stepHeight, width, stepHeight);
    }
}
