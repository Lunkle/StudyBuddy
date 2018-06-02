import java.time.*; //<>//
import java.time.temporal.ChronoUnit;
import g4p_controls.*;

final float PADDING = 5;
LocalDate today;

void setup() {
    size(800, 600);
    init();
}

void init() {
    getUsername();
    strokeWeight(2);
    today = LocalDate.now();
    loadFonts();
    loadEvents();
    initPanels();
    initHomeScreen();
    createGUI();
}

void draw() {
    mouseMoveHandler();
    drawGradient(c2, c5);
    updateComponents();
    displayComponents();
}
