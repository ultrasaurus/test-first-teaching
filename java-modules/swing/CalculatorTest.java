import javax.swing.*;
import java.awt.*;

/*
Use the following code to get your panel to display inside a new window:

public static void main(String[] args)
        {
                JPanel p = new CalculatorPanel();
                JFrame f = new JFrame();
                f.getContentPane().add(p);
                f.setSize(350,200);
                f.setVisible(true);
        }
*/

public class CalculatorTest extends Test
{
    public void testIsJPanel()
    {
        CalculatorPanel c = new CalculatorPanel();
        assertTrue(c instanceof JPanel);
    }

    public void testTextWidgets()
    {
        CalculatorPanel c = new CalculatorPanel();
        JTextField xField = c.getXTextField();
        assertNotNull(xField);
        JTextField yField = c.getYTextField();
        assertNotNull(yField);
        JLabel answerField = c.getAnswerField();
        assertNotNull(answerField);
    }

    public void testButtonWidget()
    {
        CalculatorPanel c = new CalculatorPanel();
        JButton addButton = c.getAddButton();
        assertEquals("Add", addButton.getText());
    }

    public void testAdd()
    {
        CalculatorPanel c = new CalculatorPanel();
        c.getXTextField().setText("5");
        c.getYTextField().setText("15");
        c.getAddButton().doClick();
        assertEquals("20", c.getAnswerField().getText());

        c.getXTextField().setText("56");
        c.getYTextField().setText("99");
        c.getAddButton().doClick();
        assertEquals("155", c.getAnswerField().getText());
    }

    public void testError()
    {
        CalculatorPanel c = new CalculatorPanel();
        c.getXTextField().setText("foo");
        c.getYTextField().setText("15");
        c.getAddButton().doClick();
        assertEquals("error", c.getAnswerField().getText());
    }

    public void testLayout()
    {
        CalculatorPanel c = new CalculatorPanel();
        LayoutManager layout = c.getLayout();
        assertEquals(FlowLayout.class, layout.getClass());
    }

}
