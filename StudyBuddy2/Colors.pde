color c1 = color(250, 88, 43); //Orange
color c2 = color(250, 241, 145); //Yellow
color c3 = color(194, 234, 155); //Yellow-Blue
color c4 = color(127, 193, 145); //Blue
color c5 = color(23, 169, 146); //Deep Blue

void drawGradient(color colour1, color colour2){
    for (float i = 0; i < height; i+=2) {
        noStroke();
        fill(lerpColor(colour1, colour2, i/height));
        rect(0, i, width, 2);
    }
}
