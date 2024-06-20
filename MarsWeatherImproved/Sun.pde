// forum.processing.org/two/discussion/8119/
// dividing-a-circle-into-rings-of-equal-area-howto

class Sun{

    int time;
    color timeColor;
    float diameter = 79;  // Initial diameter of the circle
    float strokeWidth = 5;  // Initial stroke weight
    float growthRate = 20;  

    Sun(int time){
        this.time = time;
    }
    
    public void createSun(PGraphics background) {
        background.noStroke();
        timeColor = timeToColor(time);
        background.fill(timeColor);
        background.circle(width/2, height/2, diameter);
        for(int i = 5; i > 0; i--){
            background.stroke(timeColor);
            background.noFill();
            diameter += growthRate;
            background.strokeWeight(strokeWidth);
            background.ellipse(width/2, height/2, diameter, diameter);
            strokeWidth = i/2; 
        }
    }

    private color timeToColor(int time){
        float mappedTime = map(time, 1, 24, 1, 7);
        switch((int) mappedTime) {
    case 1:
        return color(197, 102, 71);  // Sunset-5 
    case 2:
        return color(183, 85, 59);  // Sunset-4
    case 3:
        return color(169, 69, 48);  // Sunset-3
    case 4:
      return color(154, 52, 37);  // Sunset-2
    case 5:
      return color(140, 36, 26);  // Sunset-1
    case 6:
      return color(126, 19, 14);  // Sunset
    default:
       return color(210, 118, 62);   // Default = Sunrise
    }
        
    }
}