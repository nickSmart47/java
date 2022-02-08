import java.util.Random;
import java.util.ArrayList;
import java.util.Arrays;

public class PuzzleJava {

    public ArrayList<Integer> getTenRolls() {
        Random randMachine = new Random();
        ArrayList<Integer> rollList = new ArrayList<Integer>();
        for (int i = 0; i < 10; i++) {
            rollList.add(randMachine.ints(1, 21).findFirst().getAsInt());
        }
        return rollList;
    }

    public String getRandomLetter() {
        ArrayList<String> alphabet = new ArrayList<>(Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"));
        Random randMachine = new Random();
        int randIdx = randMachine.ints(0, 25).findFirst().getAsInt();
        return alphabet.get(randIdx);
    }

    public String generatePassword() {
        ArrayList<String> alphabet = new ArrayList<>(Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"));
        Random randMachine = new Random();
        String password = "";
        for (int i = 0; i < 8; i++) {
            int randIdx = randMachine.ints(0, 25).findFirst().getAsInt();
            password = password.concat(alphabet.get(randIdx));
        }
        return password;
    }

    public ArrayList<String> getNewPasswordSet(int length) {
        ArrayList<String> result = new ArrayList<String>();
        ArrayList<String> alphabet = new ArrayList<>(Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"));
        Random randMachine = new Random();
        String password = "";

        for (int j = 0; j < length; j++) {

            for (int i = 0; i < 8; i++) {
                int randIdx = randMachine.ints(0, 25).findFirst().getAsInt();
                password = password.concat(alphabet.get(randIdx));
            }
            result.add(password);
            password = "";

        }

        return result;
    }
}