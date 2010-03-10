
import java.util.Comparator;
import java.util.Collections;
import java.util.ArrayList;

public class PackageTest extends Test
{
    public static void testEnglish()
    {
        foo.en.Comment c1 = new foo.en.Comment();
        assertEquals("Good morning", c1.getComment());
    }

    public static void testGerman()
    {
        foo.de.Comment c2 = new foo.de.Comment();
        assertEquals("Guten morgen", c2.getComment());
    }
}
































