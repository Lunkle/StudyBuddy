class Element extends Component{
    Panel parentPanel;
    boolean expanded = false;

    Element(float xPos, float yPos, float eWidth, float eHeight) {
        super(xPos, yPos, eWidth, eHeight);
    }

    boolean selected(float selectedX, float selectedY) {
        if(parentPanel != null){
            selectedX -= parentPanel.position.x;
            selectedY -= parentPanel.position.y;
        }
        return super.selected(selectedX, selectedY);
    }
    
    void display(){
        pushMatrix();
        translate(parentPanel.position.x, parentPanel.position.y);
        if(expanded){
            position = new PVector(PADDING - parentPanel.position.x, PADDING - parentPanel.position.y);
            size = new PVector(width - 2 * PADDING, height - 2 * PADDING);
        } else {
            position = originalPosition.copy();
            size = originalSize.copy();
        }
        super.display();
        popMatrix();
    }
}
