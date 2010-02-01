
import java.util.*;

public class Counter
{
    public int countLetters(char ch, String s)
    {
        int count = 0;
        char[] chars = s.toLowerCase().toCharArray();
        for (int i = 0; i < chars.length; i++)
        {
            char aChar = chars[i];
            if (aChar == ch)
            {
                ++count;
            }
        }
        return count;
    }

    public int countLetters(String s)
    {
        int count = 0;
        char[] chars = s.toCharArray();
        for (int i = 0; i < chars.length; i++)
        {
            char ch = chars[i];
            if (Character.isLetter(ch))
            {
                count++;
            }
        }
        return count;
    }

    public int countWords(String s)
    {
        StringTokenizer tok = new StringTokenizer(s);
        return tok.countTokens();
    }

    public int countPhrases(String s)
    {
        StringTokenizer tok = new StringTokenizer(s, ",;.!-?");
        return tok.countTokens();
//        int c = 0;
//        while (tok.hasMoreTokens())
//        {
//            String phrase = tok.nextToken();
//            System.out.println(phrase);
//            c++;
//        }
//        return c;

    }

    public Map histogram(String s)
    {
        Map map = new HashMap();

        for (char ch='a'; ch<='z'; ++ch) {
            map.put(""+ch, new Integer(0));
        }

        char[] chars = s.toLowerCase().toCharArray();
        for (int i = 0; i < chars.length; i++)
        {
            char ch = chars[i];
            Integer count = (Integer) map.get(""+ch);
            if (count != null) {
                map.put(""+ch, new Integer(count.intValue() + 1));
            }
        }
        return map;
    }

}
