package com.ostensibly.data;

public final class Constants {

	public static final String STUDENT = "STUDENT";
	public static final String STAFF = "STAFF";
	public static final String ADMIN = "ADMIN";

	public interface USERTYPE {
		public final int ADMIN = 0;
		public final int STUDENT = ADMIN + 1;
		public final int STAFF = STUDENT + 1;
	}

	public interface COURSE_ENROLLMENT {
		public final String NOT_ENROLLED = "0";
		public final String ENROLLED = "1";
		public final String PAYMENT_PENDING = "2";
		public final String ALLOTED = "3";
		public final String FINISH = "4";
	}
}
