
void mousePressed() {
    for (int i = 0; i < panels.length; i++) {
        if (mouseX > panels[i].position.x && mouseX < panels[i].position.x + panels[i].size.x && mouseY > panels[i].position.y && mouseY < panels[i].position.y + panels[i].size.y) {
            selectedPanel = panels[i];
        }
    }
}

void mouseMoveHandler() {
    if (selectedPanel != null) {
        selectedPanel.velocity = mouseX - pmouseX;
    }
}

void mouseReleased() {
    selectedPanel = null;
}
