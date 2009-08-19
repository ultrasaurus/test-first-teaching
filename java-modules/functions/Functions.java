
public class Functions {
    public static String hello() {
        return "hello";
    }

    public static int add(int x, int y) {
        return x+y;
    }

    public static double ftoc(double f) {
        return (f-32) * (5.0/9.0) ;
    }

    public static String[] makeArray(String s1, String s2, String s3) {
        return new String[] { s1, s2, s3 };
    }

    public static int add(int[] numbers) {
        int total = 0;
        for (int i=0; i<numbers.length; ++i) {
            total += numbers[i];
        }
        return total;
    }

}
