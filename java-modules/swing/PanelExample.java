
import java.awt.event.*;
import java.awt.*;
import java.util.*;

public class PanelExample extends Panel implements ActionListener
{
    Button coffee;
    Label message;

    public PanelExample()
    {
        setBackground(Color.green);
        setForeground(Color.red);

        coffee = new Button("Coffee");
        message =  new Label("My dog has ticks");
        add( coffee );
        add( message );

        coffee.addActionListener(this);
    }

    public void actionPerformed(ActionEvent e)
    {
        message.setText("Yum! " + new Date());
    }

    public void paint(Graphics g)
    {
        super.paint(g);
        g.drawString("My dog has fleas",50,20);
    }

    public static void main(String[] args)
    {
        Panel p = new PanelExample();
        Frame f = new Frame();
        f.add(p);
        f.setSize(350,200);
        f.setVisible(true);
    }
}
