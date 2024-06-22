/*
Autors: Trummer Julia, Trummer Melina, Alina Schweighofer, Maria Laimer
Title: Mars Weather Visualisation Part 1
Date: 22 June 2024
VO: Generative Design 2 
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
int iteration = 0;
int circleRadius = 10;
int solCounter = 0;
float stepHeight;

//This Code was improved by ChatGPT -> For original code please contact: julia.trummer@edu.fh-joanneum.at
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
    createPlanets();
    updateIteration();
    updateSolCounter();
    textInfo.createTextLeftBottomCorner(solCounter);
}

//Creates planets as circles in our solarsystem
void createPlanets() {
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

//Only goes through 1/4 of the Orbit, used just for example reasons
//TODO: Improve that planets orbit the whole ellipse
void updateIteration() {
  if(iteration >= 1600) {
          iteration = 0;
  } else {
          iteration++;
  }
}

//Left bottom Text: SOL counter gets upated in relation to the iteration.
void updateSolCounter() {
  if(iteration % 16 == 0) {
      solCounter = iteration / 16;
  }
}

//Idea from: https://processing.org/reference/lerpColor_.html
void generateBackground() {
    for (int i = 0; i < numSteps; i++) {
        float t = map(i, 0, numSteps - 1, 0, 1);
        color stepColor = lerpColor(startColor, endColor, t);
        background.fill(stepColor);
        background.noStroke();
        background.rect(0, i * stepHeight, width, stepHeight);
    }
}
