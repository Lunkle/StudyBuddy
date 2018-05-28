float timePressed = 0;
void mousePressed() {
    for (int i = 0; i < components.length; i++) {
        if (components[i].selected(mouseX, mouseY)) {
            components[i].onSelect();
        }
    }
    timePressed = millis();
}

void mouseMoveHandler() {
    float time = millis();
    if (millis() - timePressed > 500 || !(pmouseX == mouseX && pmouseY == mouseY)) {
        selectedTile = null;
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
    //float timeBetween = millis() - timePressed;
}
