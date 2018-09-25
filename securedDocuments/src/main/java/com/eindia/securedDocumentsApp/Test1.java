package com.eindia.securedDocumentsApp;

public class Test1 {

	public int calc(int n, int d) {
		int ans = 0;
		int counter = d;
		while (counter <= n) {

			if (counter % 10 == d) {
				ans++;
			}

			if (counter != 0 && counter / 10 == d) {
				ans++;
				counter++;
			} else if (counter / 10 == d - 1) {

				counter = counter + (10 - d);
			} else {

				counter = counter + 10;
			}

		}
		return ans;

	}

	public static void main(String args[]) {

		int n = 25;
		int d = 2;

		System.out.println(new Test1().calc(n, d));

	}

}
