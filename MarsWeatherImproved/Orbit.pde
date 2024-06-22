/*
Autors: Trummer Julia, Trummer Melina, Alina Schweighofer, Maria Laimer
Title: Mars Weather Visualisation Part 1
Date: 22 June 2024
VO: Generative Design 2 
*/ 

class Orbit {
    float angle = 0;
    float speed = 0.01;
    float ellipseWidth, ellipseHeight;
    color orbitColor;
    ArrayList<PVector> coordinates;

    Orbit(float orbitWidth, float orbitHeight, float orbitalSpeed, color orbitColor) {
        this.ellipseWidth = orbitWidth;
        this.ellipseHeight = orbitHeight;
        this.speed = orbitalSpeed / 1000;
        this.orbitColor = orbitColor;
        this.coordinates = new ArrayList<PVector>();
        calcPointsOnOrbit();
    }

    Orbit(float orbitWidth, float orbitHeight, float orbitalSpeed) {
        this(orbitWidth, orbitHeight, orbitalSpeed, color(253, 266, 182));
    }

    public void createOrbit(PGraphics planetOrbitLayer) {
        planetOrbitLayer.strokeWeight(1);
        planetOrbitLayer.stroke(orbitColor);
        planetOrbitLayer.noFill();
        planetOrbitLayer.ellipse(width / 2, height / 2 + 42, ellipseWidth, ellipseHeight);
    }

    private void calcPointsOnOrbit() {
        for (int i = 0; i < 1600; i++) {
            float x = width / 2 + ellipseWidth / 2 * cos(angle);
            float y = height / 2 + ellipseHeight / 2 * sin(angle);
            coordinates.add(new PVector(x, y + 42));
            angle += speed;
        }
    }

    public PVector getCoordinates(int i) {
        return this.coordinates.get(i % coordinates.size());
    }
}
