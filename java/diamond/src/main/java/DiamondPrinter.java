import java.util.ArrayList;
import java.util.List;

class DiamondPrinter {

    List<String> printToList(char ch) {
        int margin = 0;
        int padding = Math.max(0, (ch - 'A') * 2 - 1);
        var bottom = new ArrayList<String>();

        StringBuilder sb;
        while (ch >= 'A') {
            sb = new StringBuilder();
            sb.append(" ".repeat(margin / 2));
            sb.append(ch);
            sb.append(" ".repeat(padding));
            if (ch != 'A') {
                sb.append(ch);
            }
            sb.append(" ".repeat(margin / 2));
            bottom.add(sb.toString());

            margin += 2;
            padding = Math.max(0, padding - 2);
            ch--;
        }
        var top = new ArrayList<String>();
        int last = bottom.size() - 1;
        for (int i = last; i > 0; --i) {
            top.add(bottom.get(i));
        }
        top.addAll(bottom);

        return top;
    }
}
