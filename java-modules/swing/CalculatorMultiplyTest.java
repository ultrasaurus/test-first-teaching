import javax.swing.*;
import java.awt.*;

public class CalculatorMultiplyTest extends Test
{
	public void testMultiply()
	{
		CalculatorPanel c = new CalculatorPanel();
		c.getXTextField().setText("5");
		c.getYTextField().setText("15");
		c.getMultiplyButton().doClick();
		assertEquals("75", c.getAnswerField().getText());

		c.getXTextField().setText("56");
		c.getYTextField().setText("99");
		c.getMultiplyButton().doClick();
		assertEquals("5544", c.getAnswerField().getText());
	}

	
}
