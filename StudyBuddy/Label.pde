class Label extends UIComponent {
    String text;
    int size;
    color colour;
    int textPositioning = CENTER;
    float lifeTime = 0;
    float lifeTimeMax = -1;
    protected boolean timer = false;

    public Label(String text, int textSize, float xPos, float yPos, color textColour) {
        super(xPos, yPos);
        this.text = text;
        size = textSize;
        colour = textColour;
    }

    void setPositioning(int position) {
        textPositioning = position;
    }

    void setTimer(int time) {
        timer = true;
        lifeTimeMax = time;
    }

    void displayComponent() {
        lifeTime += 1000/frameRate;
        if (timer) {
            if (lifeTimeMax - lifeTime <= 1000) {
                fill(colour, (lifeTimeMax - lifeTime)/(500.0/255.0));
                println(1 - (lifeTimeMax - lifeTime)/500);
            }
        } else {
            fill(colour);
        }
        textAlign(textPositioning);
        textFont(ubuntu, size);
        text(text, position.x, position.y);
        if (timer) {
            if (lifeTime > lifeTimeMax) {
                screen.removeComponent(number);
            }
        }
    }
}
