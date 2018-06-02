import java.awt.Font;
import java.awt.FontFormatException;
import java.io.File;

PFont arvo;
PFont ubuntu;
Font arvoF;
Font ubuntuF;

void loadFonts() {
    try {
        arvoF = Font.createFont(Font.TRUETYPE_FONT, new File("arvo/Arvo-Regular.ttf"));
        ubuntuF = Font.createFont(Font.TRUETYPE_FONT, new File("ubuntu/Ubuntu-R.ttf"));
    }
    catch(IOException e){
    }catch(FontFormatException e) {
    }
    arvo = createFont("arvo/Arvo-Regular.ttf", 72);
    ubuntu = createFont("ubuntu/Ubuntu-R.ttf", 72);
}
