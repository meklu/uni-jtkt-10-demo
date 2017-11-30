import java.util.Scanner;

public class Good {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);

		int summa = 0;

		System.out.println("Syötä lukuja, tyhjä rivi lopettaa");
		for (;;) {
			System.out.print("Syötä kokonaisluku: ");
			String rivi = s.nextLine();
			if (rivi.isEmpty()) {
				break;
			}
			try {
				summa += Integer.parseInt(rivi);
			} catch (Exception e) {
				System.out.println("Tarkista syöte!");
				continue;
			}
		}

		System.out.println("Lukujen summa: " + summa);
	}
}
