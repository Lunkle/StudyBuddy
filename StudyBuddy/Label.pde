class Label extends UIComponent{
    String text;
    int size;
    color colour;
    int textPositioning = CENTER;
    float lifeTime = 0;
    float lifeTimeMax = -1;
    boolean timer = false;
    
    Label(String text, int textSize, float xValue, float yValue, color textColour){
        this.text = text;
        position = new PVector(xValue, yValue);
        size = textSize;
        colour = textColour;
    }
    
    void setPositioning(int position){
        textPositioning = position;
    }
    
    void setTimer(int time){
        
    }
    
    void displayComponent(){
        textAlign(textPositioning);
        textFont(arvo, size);
        fill(colour);
        text(text, position.x, position.y);
        lifeTime++;
        if(timer){
            if(lifeTime > lifeTimeMax){
                
            }
        }
    }
    
    
}
