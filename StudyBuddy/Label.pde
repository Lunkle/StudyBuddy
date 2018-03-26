class Label extends UIComponent{
    String text;
    int size;
    color colour;
    int textPositioning = CENTER;
    float lifeTime = 0;
    float lifeTimeMax = -1;
    protected boolean timer = false;
    
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
        timer = true;
        lifeTimeMax = time;
    }
    
    void displayComponent(){
        lifeTime += 1000/frameRate;
        if(timer){
            if(lifeTimeMax - lifeTime <= 1000){
                fill(colour, (lifeTimeMax - lifeTime)/(500.0/255.0));
                println(1 - (lifeTimeMax - lifeTime)/500);
            }
        }else{
            fill(colour);
        }
        textAlign(textPositioning);
        textFont(arvo, size);
        text(text, position.x, position.y);
        if(timer){
            if(lifeTime > lifeTimeMax){
                screen.removeComponent(number);
            }
        }
    }
    
    
}
