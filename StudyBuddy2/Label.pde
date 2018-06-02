class Label extends Element{
    String text;
    
    void init(String text){
        this.text = text;
    }
    
    Label(String text, float xPos, float yPos, float lWidth, float lHeight) {
        super(xPos, yPos, lWidth, lHeight);
        init(text);
    }
    
    Label(String text, float xPos, float yPos, float lWidth, float lHeight, Component parentComponent) {
        super(xPos, yPos, lWidth, lHeight, parentComponent);
        init(text);
    }
    
    void display(){
        stroke(c5);
        pushMatrix();
        fill(245);
        super.display();
        translate(currentPosition.x, currentPosition.y);
        fill(0);
        textAlign(CENTER);
        textFont(ubuntu, 14);
        text(text, currentSize.x/2, currentSize.y/2 + 6);
        popMatrix();
    }
}
