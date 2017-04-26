package com.ostensibly.data;

public class Util {

	public static boolean isEmpty(String s) {
		boolean result = true;
		if (s != null && s.length() > 0) {
			result = false;
		}
		return result;
	}

	public static String getNonEmptyValue(String value) {
		if (isEmpty(value)) {
			return null;
		} else {
			return "'" + value + "'";
		}
	}
}
