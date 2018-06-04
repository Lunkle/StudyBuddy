import java.lang.Runnable;

Button selectedButton;

class Button extends Component {
    String text = "";
    PImage icon;
    Runnable onClick;
    boolean border = true;
    boolean fill = true;

    Button(String text, float xPos, float yPos, float bWidth, float bHeight) {
        super(xPos, yPos, bWidth, bHeight);
        this.text = text;
    }

    Button(PImage icon, float xPos, float yPos, float bWidth, float bHeight) {
        super(xPos, yPos, bWidth, bHeight);
        this.icon = icon;
    }

    Button(String text, float xPos, float yPos, float bWidth, float bHeight, Component parentComponent) {
        super(xPos, yPos, bWidth, bHeight, parentComponent);
        this.text = text;
    }

    Button(PImage icon, float xPos, float yPos, float bWidth, float bHeight, Component parentComponent) {
        super(xPos, yPos, bWidth, bHeight, parentComponent);
        this.icon = icon;
    }

    void setOnClick(Runnable stuff) {
        onClick = stuff;
    }

    void onSelect() {
        selectedButton = this;
    }

    void onRelease() {
        onClick.run();
    }

    void display() {
        stroke(c5, border?255:0); //Might have to change to 1
        fill(c2, fill?255:0); //Might have to change to 1
        super.display();
        pushMatrix();
        translate(currentPosition.x + size.x/2, currentPosition.y + size.y/2);
        textAlign(CENTER);
        textSize(10);
        fill(0);
        text(text, 0, 0);
        if (icon != null) {
            translate(-icon.width/2, -icon.height/2);
            image(icon, 0, 0);
        }
        popMatrix();
    }
}
