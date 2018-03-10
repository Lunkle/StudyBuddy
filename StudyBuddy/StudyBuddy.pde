


void setup() {
    fullScreen();
    noStroke();
    fill(0);
}

void draw(){
    background(250, 241, 145);
    textAlign(CENTER);
    textSize(50);
    fill(0);
    text("StudyBuddy", width/2, height/4);
    fill(0);
    rect(width/2 - 200, height/2 - 50, 400, 100);
    fill(255);
    rect(width/2-195, height/2-45,390, 90);
}

void mousePressed(){
    if (mouseX < width/2) {
        rect(0, 0, width/2, height); // Left
    } else {
        rect(width/2, 0, width/2, height); // Right
    }
}