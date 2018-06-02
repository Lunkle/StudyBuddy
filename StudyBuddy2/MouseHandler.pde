float timePressed = 0;
void mousePressed() {
    for (int i = 0; i < mainComponents.length; i++) {
        select(mainComponents[i]);
    }
    timePressed = millis();
}

void select(Component component) {
    if (component.selected(mouseX, mouseY)) {
        component.onSelect();
    }
    for (int i = 0; i < component.subComponents.length; i++) {
        select(component.subComponents[i]);
    }
}

void mouseMoveHandler() {
    float time = millis();
    if (millis() - timePressed > 500 || !(pmouseX == mouseX && pmouseY == mouseY)) {
        selectedTile = null;
        selectedButton = null;
    }
    if (selectedPanel != null) {
        selectedPanel.onDrag();
    }
}

void mouseReleased() {
    if (selectedPanel!=null) {
        selectedPanel.onRelease();
    }
    if (selectedTile!=null) {
        selectedTile.onRelease();
    }
    if (selectedButton!=null) {
        selectedButton.onRelease();
    }
}
