/*
Autors: Trummer Julia, Trummer Melina, Alina Schweighofer, Maria Laimer
Title: Mars Weather Visualisation Part 1
Date: 22 June 2024
VO: Generative Design 2 
*/ 

class Textinformation {
    
    PGraphics background;
    
    String text = "Choose a Date";
    String text1 = "1 Year on Mars = 687 Days";
    PFont font = createFont("NotoSansMono.ttf", 40);
    
    Textinformation() {
        this.background = background;
    }
    
    public void createTextLeftCorner(PGraphics background) {
        background.fill(182, 108, 73); 
        background.textAlign(LEFT, TOP); 
        background.textSize(32); 
        background.text(text1, 75, 65); 
    }
    
    public void createTextRightCorner(PGraphics background) {
        background.noFill();
        background.textSize(32); 
        background.textAlign(CENTER, CENTER); 
        float textWidth = background.textWidth(text);
        float textHeight = background.textAscent() + background.textDescent();
        float padding = 20;
        float boxWidth = textWidth + padding * 2;
        float boxHeight = textHeight + padding;
        float paddingFromEdge = 100; 
        float boxX = width - boxWidth - paddingFromEdge; 
        float boxY = paddingFromEdge - 50; 
        float cornerRadius = 40;
        background.stroke(182, 108, 73);
        background.strokeWeight(2); 
        background.rect(boxX, boxY, boxWidth, boxHeight, cornerRadius);
        
        background.fill(182, 108, 73);
        background.text(text, boxX + boxWidth / 2, boxY + boxHeight / 2);
    }  
    
    public void createTextLeftBottomCorner(int counter) {
        
        textAlign(LEFT, BOTTOM);
        String text = "SOL" + counter;
        float xPos = 75;
        float yPos = height - 200;
        text(text, xPos, yPos);
    }
}