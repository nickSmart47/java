import java.util.ArrayList;
import java.util.Random;

public class TestPuzzles {
    
	public static void main(String[] args) {
		PuzzleJava generator = new PuzzleJava();
		ArrayList<Integer> randomRolls = generator.getTenRolls();
		System.out.println(randomRolls);
		
    	//..
		// Write your other test cases here.
		//..

        System.out.println("random letter:\n ----> " + generator.getRandomLetter());

        System.out.println("random password:\n ----> " + generator.generatePassword());

        System.out.println("random password set:\n ----> " + generator.getNewPasswordSet(3));
	}
}
