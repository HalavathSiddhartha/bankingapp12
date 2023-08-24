package utils;

import java.security.SecureRandom;

public class PasswordGenerator {
	public static void main(String[] args) {
		String password = generatePassword(10);
		System.out.println("Generated OTP: " + password);
	}

	public static String generatePassword(int length) {
		String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		SecureRandom random = new SecureRandom();
		StringBuilder passwordBuilder = new StringBuilder();

		for (int i = 0; i < length; i++) {
			int index = random.nextInt(characters.length());
			char randomChar = characters.charAt(index);
			passwordBuilder.append(randomChar);

		}
		return passwordBuilder.toString();
	}
}
