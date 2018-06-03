Component[] mainComponents = {};
Component[] components = {};

class Component {
    Component parentComponent;
    Component[] subComponents = {};
    boolean visible = true;
    PVector position;
    PVector size;
    PVector currentPosition;
    PVector currentSize;
    PVector originalPosition;
    PVector originalSize;
    int number;

    void initialize(float xPos, float yPos, float cWidth, float cHeight) {
        position = new PVector(xPos, yPos);
        size = new PVector(cWidth, cHeight);
        currentPosition = position.copy();
        currentSize = size.copy();
        originalPosition = position.copy();
        originalSize = size.copy();
        components = (Component[]) append(components, this);
    }

    Component(float xPos, float yPos, float cWidth, float cHeight) {
        initialize(xPos, yPos, cWidth, cHeight);
        number = mainComponents.length;
        mainComponents = (Component[]) append(mainComponents, this);
    }

    Component(float xPos, float yPos, float cWidth, float cHeight, Component parentComponent) {
        initialize(xPos, yPos, cWidth, cHeight);
        number = parentComponent.subComponents.length;
        parentComponent.subComponents = (Component[]) append(parentComponent.subComponents, this);
        this.parentComponent = parentComponent;
    }

    void addComponent(Component component) {
        component.number = subComponents.length;
        subComponents = (Component[]) append(subComponents, component);
        component.parentComponent = this;
        for (int i = mainComponents.length - 1; i > -1; i--) {
            if (mainComponents[i].equals(component)) {
                Component[] before = (Component[]) subset(mainComponents, 0, i);
                Component[] after = (Component[]) subset(mainComponents, i + 1);
                mainComponents = (Component[]) concat(before, after);
                break;
            }
        }
    }

    boolean selected(float selectedX, float selectedY) {
        Component pc = parentComponent;
        while (pc != null) {
            selectedX -= pc.position.x;
            selectedY -= pc.position.y;
            pc = pc.parentComponent;
        }
        if (selectedX > position.x && selectedX < position.x + size.x && selectedY > position.y && selectedY < position.y + size.y) {
            return true;
        }
        return false;
    }

    void update() {
        currentPosition.add(position.copy().sub(currentPosition).mult(0.1));
        currentSize.add(size.copy().sub(currentSize).mult(0.1));
    }

    void display() {
        pushMatrix();
        translate(currentPosition.x, currentPosition.y);
        rect(0, 0, currentSize.x, currentSize.y);
        for (int i = 0; i < subComponents.length; i++) {
            subComponents[i].update();
            subComponents[i].display();
        }
        popMatrix();
    }

    void onSelect() {
    }

    void onRelease() {
    }

    void switchToFirst(int index) {
        int tempNum = subComponents[index].number;
        subComponents[index].number = subComponents[subComponents.length - 1].number;
        subComponents[subComponents.length - 1].number = tempNum;
        Component temp = subComponents[index];
        subComponents[index] = subComponents[subComponents.length - 1];
        subComponents[subComponents.length - 1] = temp;
        if (parentComponent != null) {
            parentComponent.switchToFirst(number);
        }
    }
}

void updateComponents() {
    for (int i = 0; i < components.length; i++) {
        components[i].update();
    }
}

void displayComponents() {
    for (int i = 0; i < mainComponents.length; i++) {
        mainComponents[i].display();
    }
}
