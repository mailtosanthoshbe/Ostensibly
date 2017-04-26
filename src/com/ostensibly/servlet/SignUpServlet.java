package com.ostensibly.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ostensibly.data.Constants;
import com.ostensibly.data.Util;
import com.ostensibly.db.Database;

public class SignUpServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user_type = request.getParameter("Usertype");
		int type = -1;
		switch (user_type) {
		case Constants.ADMIN:
			type = 0;
			break;
		case Constants.STUDENT:
			type = 1;
			break;
		case Constants.STAFF:
			type = 2;
			break;
		default:
			break;
		}

		Database db = (Database) getServletContext().getAttribute("db");

		// 1. check account already exists
		String email = getNonEmptyValue(request.getParameter("email"));;
		String modal = request.getParameter("modal");

		String sql = "SELECT COUNT(*) FROM accounts WHERE email = "+email;
		try {
			Statement pstmt = db.getConnection().createStatement();
			ResultSet rs  = pstmt.executeQuery(sql);
			int cnt = rs.getInt(1);
			if (cnt > 0) {
				request.setAttribute("errorMessage", "Account already registered.");
				request.setAttribute("status_code", 401);
				request.setAttribute("modal", modal);

				// get back to order.jsp page using forward
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}
		} catch (SQLException e1) {
			System.out.println("SignUpServlet::doPost: SQLException: "+e1);
		}

		String name = getNonEmptyValue(request.getParameter("name"));
		String password = getNonEmptyValue(request.getParameter("password"));
		String cpassword = getNonEmptyValue(request.getParameter("cpassword"));
		String qualification = getNonEmptyValue(request.getParameter("qualification"));
		String experience = getNonEmptyValue(request.getParameter("experience"));
		String course = getNonEmptyValue(request.getParameter("course"));
		String gender = getNonEmptyValue(request.getParameter("gender"));
		String number = getNonEmptyValue(request.getParameter("number"));

		// 2. check for valid password match
		if (!password.equals(cpassword)) {
			request.setAttribute("errorMessage", "Password mismatch.");
			request.setAttribute("status_code", 401);
			request.setAttribute("modal", modal);

			// get back to order.jsp page using forward
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}

		// register to db
		Statement statement;
		try {
			statement = db.getConnection().createStatement();
			statement.setQueryTimeout(30); // set timeout to 30 sec.
			String item = name + ", " + email + ", " + password + ", " + qualification + ", " + experience + ", "
					+ course + ", " + gender + ", " + number + ", " + type;
			String insertStmt = "insert into accounts values(null, " + item + ")";
			statement.executeUpdate(insertStmt);
			// out.print("Successfully inserted");

			// Set some error message as a request attribute.
			if (true) {
				request.setAttribute("message", "Account created successfully. Kindly login.");
				request.setAttribute("status_code", 200);
				request.setAttribute("modal", modal);
			}

			// get back to order.jsp page using forward
			request.getRequestDispatcher("/index.jsp").forward(request, response);

		} catch (SQLException e) {
			// out.print("SQLException: " + e);
		}

		/*
		 * out.print("Welcome " + " ," + name + " ," + email + " ," + password +
		 * " ," + qualification + " ," + gender + " ," + user_type + " ," +
		 * number);
		 */

		// out.close();
	}

	private String getNonEmptyValue(String value) {
		if (Util.isEmpty(value)) {
			return null;
		} else {
			return "'" + value + "'";
		}
	}

}
