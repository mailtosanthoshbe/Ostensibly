package com.ostensibly.data;

public class User {

	private int mId;
	private String mName, mEmail, mPassword, mQualification, mExperience, mCourse, mGender, mMobile, mUserType;

	public User(){
		
	}
	public User(int id, String name, String email, String pwd, String qualification, String exp, String course,
			String gender, String mobile, String type) {

		mId = id;
		mName = name;
		mEmail = email;
		mPassword = pwd;
		mQualification = qualification;
		mExperience = exp;
		mCourse = course;
		mGender = gender;
		mMobile = mobile;
		mUserType = type;
	}

	public int getId() {
		return mId;
	}

	public String getName() {
		return mName;
	}

	public String getEmail() {
		return mEmail;
	}

	public String getPassword() {
		return mPassword;
	}

	public String getQualification() {
		return mQualification;
	}

	public String getExperience() {
		return mExperience;
	}

	public String getCourse() {
		return mCourse;
	}

	public String getGender() {
		return mGender;
	}

	public String getMobile() {
		return mMobile;
	}

	public String getUserType() {
		return mUserType;
	}
}
