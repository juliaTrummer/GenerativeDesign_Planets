/*
Autors: Trummer Julia, Trummer Melina, Alina Schweighofer, Maria Laimer
Title: Mars Weather Visualisation Part 1
Date: 22 June 2024
VO: Generative Design 2 
*/ 

class TimeLine{
    
    int totalSections = 8;
    float sectionWidth;
    PFont font = createFont("NotoSansMono.ttf", 40);
    
    String[] sectionLabels = { "0 sol", "100 sol", "200 sol", "300 sol", "400 sol", "500 sol", "600 sol", "687 sol" };
    
    TimeLine() {
        sectionWidth = (width - 100) / totalSections;
        stroke(0);
        strokeWeight(2);
        textFont(font, 32);
    }
    
    public void createTimeLine(PGraphics background) {
        
        sectionWidth = (width * 0.9) / totalSections;
        
        float timelineY = height - 100;
        float startX = width * 0.05;
        float endX = width * 0.95;
        
        background.fill(182, 108, 73);
        background.stroke(182, 108, 73);
        background.line(startX, timelineY, endX, timelineY);
        background.textSize(24);
        
        for (int i = 0; i < totalSections; i++) {
            float x = startX + i * sectionWidth; 
            background.line(x, timelineY - 20, x, timelineY + 20); 
            background.textAlign(CENTER, TOP);
            background.text(sectionLabels[i], x, timelineY + 25);
        }
        
        background.line(endX, timelineY - 20, endX, timelineY + 20);
        background.text(sectionLabels[totalSections - 1], endX, timelineY + 25);
    }
}
