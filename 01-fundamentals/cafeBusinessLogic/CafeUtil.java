import java.util.ArrayList;

public class CafeUtil {

    public int getStreakGoal() {
        int result = 0;
        for (int i = 1; i <= 10; i++) {
            result += i;
        }
        return result;
    }

    public double getOrderTotal(double[] itemPrices) {
        double sum = 0;
        for (Double value : itemPrices) {
            sum += value;
        }
        return sum;
    }

    public void displayMenu(ArrayList<String> menuItems) {
        for (int i = 0; i < menuItems.size(); i++) {
            String item = menuItems.get(i);
            System.out.println(i + " " + item);
        }
    }

    public void addCustomer(ArrayList<String> customers) {
        System.out.println("Please enter your name:");
        String userName = System.console().readLine();
        System.out.println("Hello, " + userName + "!");
        int size = customers.size();
        String lineMessage = "There are " + size + " people in front of you.";
        System.out.println(lineMessage);
        customers.add(userName);
    }
}