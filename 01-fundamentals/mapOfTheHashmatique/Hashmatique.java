import java.util.HashMap;
import java.util.Set;


public class Hashmatique{

    public static void main(String[] args){
        HashMap<String, String> tracklist = new HashMap<String, String>();

        tracklist.put("Bad Code Blues", "Well my code keeps throwin' out errors. No matter what I seem to do. At least point I've tried everything, oh yes I've got the Bad Code Blues");
        tracklist.put("Java Hava Nagila", "Oh Java Java, so verbose Java, you just love to use many words oh yeaaaaa");
        tracklist.put("Slither like a Python", "Now everybody get down! Yeah get down, get down and Slither! (Like a python, hssss hssssss)");
        tracklist.put("React-in to the Vibe", "React, React, React, act act-in to that vibe. Take that express train, get off at node station, and React ohhh yeaaaa");

        System.out.println(tracklist.get("Bad Code Blues"));

        Set<String> keys = tracklist.keySet();
        for(String key: keys) {
            String message = String.format("Track: %s\nLyrics: %s", key, tracklist.get(key));
            System.out.println(message);
            // System.out.println(key);
            // System.out.println(tracklist.get(key));

        }
    }
}