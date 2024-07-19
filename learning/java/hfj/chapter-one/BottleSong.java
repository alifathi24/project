public class BottleSong {
  public static void main(String[] args) {
    int bottleNums = 10;
    String word = "bottles";

    while (bottleNums > 0) {
      if (bottleNums == 1) {
        word = "bottle"; // singular, as in ONE bottle
      }
      System.out.println(bottleNums + " green " + word + ", haging on the wall");
      System.out.println(bottleNums + " green " + word + " hanging on the wall");
      System.out.println("And if one green bottle should accidentaly fall,");
      bottleNums = bottleNums - 1;

      if (bottleNums > 0){
        System.out.println("There'll be " + bottleNums + " green " + word + ", hanging on the wall");
      } else {
        System.out.println("There'll be no green bottles, hanging on the wall");
      }
    }
  }
}
