package com.eindia.securedDocumentsApp;

import java.util.Random;

public class Test {

	public int calc(String a[]) {
		int b = a.length;
		int count = 1;
		if (b == 1) {
			return count;
		}
		if (a[0] == a[1]) {
			count *= 1;
		} else {
			count *= 2;
		}

		for (int i = 1; i < a.length - 1; i++) {
			if (a[i] == a[i - 1] && a[i] == a[i + 1]) {
				count *= 1;
			} else if ((a[i - 1] == a[i + 1] && a[i] == a[i - 1])) {
				count *= 2;
			} else {
				count *= 3;
			}

		}

		if (a[b - 1] == a[b - 2]) {
			count *= 1;

		} else {
			count *= 2;
		}
		return count;

	}

	public static void main(String args[]) {/*
											 * String[] a = new String[4]; a[0] = "x"; a[1] = "y"; a[2] = "z"; a[3] =
											 * "y"; System.out.println(new Test().calc(a));
											 * 
											 */
		int random = (int)(Math.random() * 50000000 + 1);
		System.out.println("EIN" + random);

	}

}
