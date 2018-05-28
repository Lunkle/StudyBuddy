Panel[] panels = {};

Panel canvasPanel;
Panel weekPanel;

Panel selectedPanel;

class Panel extends Component {
    Element[] subElements = {};
    boolean visible = true;
    boolean draggable = false;
    color colour;

    float velocity = 0;

    Panel(float xPos, float yPos, float pWidth, float pHeight) {
        super(xPos, yPos, pWidth, pHeight);
        panels = (Panel[]) append(panels, this);
        colour = c3;
    }

    void setColour(color colour) {
        this.colour = colour;
    }

    void addElement(Element element) {
        element.parentPanel = this;
        subElements = (Element[]) append(subElements, element);
    }

    void display() {
        position.x += velocity;
        velocity *= 0.8;
        if (visible) {
            pushMatrix();
            translate(position.x, position.y);
            stroke(c4);
            fill(colour);
            rect(0, 0, size.x, size.y);
            popMatrix();
        }
    }

    void onSelect() {
        selectedPanel = this;
    }

    void onDrag() {
        if (draggable) {
            velocity = mouseX - pmouseX;
        }
    }

    void onRelease() {
        selectedPanel = null;
    }
}

void initPanels() {
    canvasPanel = new Panel(0, 0, width, height);
    canvasPanel.setColour(color(0, 0, 0, 1));
    weekPanel = new Panel(0, height/4, PADDING + 7 * (WEEK_TILE_WIDTH + PADDING), WEEK_TILE_HEIGHT + 2 * PADDING);
    weekPanel.draggable = true;
}
