Font arvo;
Font ubuntu;

void loadFonts() {
    try {
        arvo = Font.createFont(Font.TRUETYPE_FONT, new File("arvo/Arvo-Regular.ttf"));
        ubuntu = Font.createFont(Font.TRUETYPE_FONT, new File("ubuntu/Ubuntu-R.ttf"));
    }
    catch(Exception e) {
    }
}
