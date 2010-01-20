public class IntroTest extends Test
{
    public void testHello()
    {
        Intro x = new Intro();
        assertEquals("Hello", x.getHello());
    }

    public void testGoodbye()
    {
        Intro x = new Intro();
        assertEquals("Goodbye", x.getGoodbye());
    }

}

