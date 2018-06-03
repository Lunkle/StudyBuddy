class Element extends Component {
    boolean expanded = false;

    Element(float xPos, float yPos, float eWidth, float eHeight) {
        super(xPos, yPos, eWidth, eHeight);
    }
    
    Element(float xPos, float yPos, float eWidth, float eHeight, Component parentComponent) {
        super(xPos, yPos, eWidth, eHeight, parentComponent);
    }

    boolean selected(float selectedX, float selectedY) {
        if (expanded) {
            if (selectedX > PADDING && selectedX < width - PADDING && selectedY > PADDING && selectedY < height - PADDING) {
                return true;
            }
        } else {
            return super.selected(selectedX, selectedY);
        }
        return false;
    }
    
    void update(){
        if (expanded) {
            position = new PVector(PADDING, PADDING);
            Component pc = parentComponent;
            while (pc != null){
                position.sub(pc.position);
                pc = pc.parentComponent;
            }
            size = new PVector(width - 2 * PADDING, height - 2 * PADDING);
        } else {
            position = originalPosition.copy();
            size = originalSize.copy();
        }
        super.update();
    }
}
