color c1 = color(250, 88, 43);
color c2 = color(250, 241, 145);
color c3 = color(194, 234, 155);
color c4 = color(127, 193, 145);
color c5 = color(23, 169, 146);

void drawGradient(color colour1, color colour2){
    for (float i = 0; i < height; i++) {
        stroke(lerpColor(colour1, colour2, i/height));
        line(0, i, width, i);
    }
}
