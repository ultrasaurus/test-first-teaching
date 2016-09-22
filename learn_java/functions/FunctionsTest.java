import junit.framework.TestCase;

public class FunctionsTest extends TestCase
{
    public void testHello()
    {
        assertEquals("hello", Functions.hello());
    }

    public void testAdd()
    {
        assertEquals(4, Functions.add(2, 2));
        assertEquals(4, Functions.add(1, 3));
        assertEquals(44, Functions.add(20, 24));
    }

    public void testFtoC()
    {
        assertEquals(0, Functions.ftoc(32));
        assertEquals(100, Functions.ftoc(212));
        assertEquals(50, (int)Functions.ftoc(123));
        assertEquals(37, (int)Functions.ftoc(99));
    }

    public void testMakeArray()
    {
        String[] array = Functions.makeArray("my", "dog", "spot");
        assertEquals("my", array[0]);
        assertEquals("dog", array[1]);
        assertEquals("spot", array[2]);
    }

    public void testAddArray()
    {
        int[] numbers = new int[]{1, 2, 3, 4};
        assertEquals(10, Functions.add(numbers));
    }
}
