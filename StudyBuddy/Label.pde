class Label extends UIComponent{
    String text;
    int size;
    color colour;
    
    Label(String text, int textSize, int xValue, int yValue, color textColour){
        this.text = text;
        position = new PVector(xValue, yValue);
        size = textSize;
        colour = textColour;
    }
    
    void displayComponent(){
        textAlign(CENTER);
        textFont(arvo, size);
        fill(colour);
        text(text, position.x, position.y);
    }
    
    
}
