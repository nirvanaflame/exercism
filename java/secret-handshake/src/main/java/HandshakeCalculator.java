import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class HandshakeCalculator {

    List<Signal> calculateHandshake(int number) {
        String bs = Integer.toBinaryString(number);
        int length = bs.length() - 1;

        List<Signal> signals = new ArrayList<>();
        for (int i = length, index = 0; i >= 0; i--, index++) {
            if (index == 5) break;
            if (index == 4) {
                if (bs.charAt(i) == '1') Collections.reverse(signals);
            } else if (bs.charAt(i) == '1') {
                signals.add(Signal.values()[index]);
            }
        }

        return signals;
    }
}
