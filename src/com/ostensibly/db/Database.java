package com.ostensibly.db;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Database {

	private Connection conn = null;
	public final static String TBL_ENROLLMENT_ID = "_id";
	public final static String TBL_ENROLLMENT_CID = "course_id";
	public final static String TBL_ENROLLMENT_UID = "student_id";
	public final static String TBL_ENROLLMENT_SID = "staff_id";
	public final static String TBL_ENROLLMENT_STATUS = "status";

	public Database(String url, String db, String user_name, String password) {
		try {
			Class.forName("org.sqlite.JDBC");

			// check for db exists if not create with admin details
			File file = new File(db);
			boolean bExists = file.exists();
			// create a connection to the database
			conn = DriverManager.getConnection(url + db);

			if (conn != null && !bExists) {
				System.out.println("Connection to SQLite has been established.");

				Statement statement = conn.createStatement();
				statement.setQueryTimeout(30); // set timeout to 30 sec.

				// create admin by default
				statement.executeUpdate("drop table if exists accounts");
				statement.executeUpdate(
						"create table accounts (id integer primary key autoincrement, name string, email string, "
								+ "password string, qualification string, experience string, course string, gender string, mobile string, user_type string)");
				statement.executeUpdate(
						"insert into accounts values(null, 'admin', 'admin@gmail.com', 'admin', 'B.E(E.C.E)', '5', 'JAVA, C', 'male', '0123456789', '0')");

				// 2. Course table
				statement.executeUpdate("drop table if exists courses");
				statement.executeUpdate(
						"create table courses (id integer primary key autoincrement, course_name string, duration string, "
								+ "amount string, description string)");

				// 2. Enrollments table
				statement.executeUpdate("drop table if exists enrollments");
				/*
				 * statement.executeUpdate("create table enrollments (" +
				 * TBL_ENROLLMENT_ID + " integer primary key autoincrement, " +
				 * TBL_ENROLLMENT_CID + " string, " + TBL_ENROLLMENT_UID +
				 * " string, " + "" + TBL_ENROLLMENT_STATUS + " string)");
				 */
				statement.executeUpdate("create table enrollments " + "(" + TBL_ENROLLMENT_ID
						+ " integer primary key autoincrement, " 
						+ TBL_ENROLLMENT_CID + " integer references courses(id), " 
						+ TBL_ENROLLMENT_UID + " integer references accounts(id), " 
						+ TBL_ENROLLMENT_SID + " integer references accounts(id), " 
						+ TBL_ENROLLMENT_STATUS + " integer)");
			}
			/*Statement stmt = conn.createStatement();
			stmt.executeUpdate("drop table if exists enrollments");
			stmt.executeUpdate("create table enrollments " + "(" + TBL_ENROLLMENT_ID
					+ " integer primary key autoincrement, " 
					+ TBL_ENROLLMENT_CID + " integer references courses(id), " 
					+ TBL_ENROLLMENT_UID + " integer references accounts(id), " 
					+ TBL_ENROLLMENT_SID + " integer references accounts(id), " 
					+ TBL_ENROLLMENT_STATUS + " integer)");*/
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}

	public Connection getConnection() {
		return this.conn;
	}

	public ResultSet runSql(String sql) throws SQLException {
		Statement sta = conn.createStatement();
		return sta.executeQuery(sql);
	}
}