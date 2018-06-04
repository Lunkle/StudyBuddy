import java.time.*; //<>//
import java.time.temporal.ChronoUnit;
import g4p_controls.*;

final float PADDING = 5;
LocalDate today;

void setup() {
    size(800, 603);
    init();
}

void init() {
    getUsername();
    getSessionID();
    strokeWeight(2);
    today = LocalDate.now();
    loadFonts();
    loadEvents();
    initPanels();
    initHomeScreen();
    createGUI();
    thread("getMessages");
}

void draw() {
    mouseMoveHandler();
    drawGradient(c2, c5);
    updateComponents();
    displayComponents();
}
