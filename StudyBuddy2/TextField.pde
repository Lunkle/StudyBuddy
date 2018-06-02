import javax.swing.JTextField;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

class TextField extends Component implements ActionListener {
    JTextField textField;

    void init(){
        textField = new JTextField(int(size.y));
    }

    TextField(float xPos, float yPos, float tWidth, float tHeight) {
        super(xPos, yPos, tWidth, tHeight);
    }

    TextField(float xPos, float yPos, float tWidth, float tHeight, Component parentComponent) {
        super(xPos, yPos, tWidth, tHeight, parentComponent);
    }

    public void actionPerformed(ActionEvent evt) {
        String text = textField.getText();
        println(text);
        textField.selectAll();
    }
}
