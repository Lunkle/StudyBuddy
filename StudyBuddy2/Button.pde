import java.lang.Runnable;

Button selectedButton;

class Button extends Component {
    String text = "";
    PImage icon;
    Runnable onClick;

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
    
    void setOnClick(Runnable stuff){
        onClick = stuff;
    }
    
    void onSelect(){
        selectedButton = this;
    }
    
    void onRelease(){
        onClick.run();
    }

    void display() {
        translate(currentPosition.x + size.x/2, currentPosition.y + size.y/2);
        textAlign(CENTER);
        text(text, 0, 0);
        if (icon != null) {
            println("hi");
            translate(-icon.width/2, -icon.height/2);
            image(icon, 0, 0);
        }
    }
}
