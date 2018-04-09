class Button extends UIComponent {
    int boxWidth;
    int boxHeight;
    color colour;

    String text = "";
    int textSize;
    color textColour;

    Button(String text, int textSize, color textColour, int middleX, int middleY, int boxWidth, int boxHeight, color colour) {
        super(middleX - boxWidth/2, middleY - boxHeight/2);
        this.text = text;
        this.textSize = textSize;
        this.textColour = textColour;
        this.boxWidth = boxWidth;
        this.boxHeight = boxHeight;
        this.colour = colour;
    }

    void displayComponent() {
        fill(colour);
        strokeWeight(2);
        rect(position.x, position.y, boxWidth, boxHeight, 10);
        fill(textColour);
        textFont(ubuntu, textSize);
        text(text, position.x + boxWidth/2, position.y + 6.5 * boxHeight/10);
    }
    
    void onClick(){
    }
}
