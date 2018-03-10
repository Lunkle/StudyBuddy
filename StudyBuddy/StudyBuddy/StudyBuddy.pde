


void setup() {
    fullScreen();
    noStroke();
    fill(0);
}

void draw() {
    background(250, 241, 145);
    textAlign(CENTER);
    textSize(50);
    text("StudyBuddy", width/2, height/2);
}

void mousePressed(){
    if (mouseX < width/2) {
        rect(0, 0, width/2, height); // Left
    } else {
        rect(width/2, 0, width/2, height); // Right
    }
}