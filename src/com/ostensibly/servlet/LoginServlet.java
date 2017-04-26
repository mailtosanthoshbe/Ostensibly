package com.ostensibly.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ostensibly.data.Constants;
import com.ostensibly.data.User;
import com.ostensibly.data.Util;
import com.ostensibly.db.Database;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Database db = (Database) getServletContext().getAttribute("db");

		// 1. check if email exists
		String modal = request.getParameter("modal");
		String email = getNonEmptyValue(request.getParameter("email"));
		String password = request.getParameter("password");
		String user_type = request.getParameter("Usertype");

		String sql = "SELECT * FROM accounts WHERE email = " + email;
		try {
			Statement pstmt = db.getConnection().createStatement();
			ResultSet rs = pstmt.executeQuery(sql);

			if (rs.next()) {
				String pwd = rs.getString(4);

				if (pwd.equals(password)) {
					// check for the proper user type
					String type = "";
					switch (rs.getString(10)) {
					case "0":
						type = Constants.ADMIN;
						break;
					case "1":
						type = Constants.STUDENT;
						break;
					case "2":
						type = Constants.STAFF;
						break;
					default:
						break;
					}

					if (type.equalsIgnoreCase(user_type)) {
						request.setAttribute("message", "Login Successful.");
						request.setAttribute("status_code", 200);
						request.setAttribute("modal", modal);

						//create user object and set the current session
						User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), pwd, rs.getString(5), rs.getString(6),
								rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10) );
						
						HttpSession session = request.getSession(true);       
						session.setAttribute("currentSessionUser", user);
						
						String profile = "/";
						switch (type) {
						case Constants.STAFF:
							profile += "staff_profile.jsp";
							break;
						case Constants.STUDENT:
							profile += "student_profile.jsp";
							break;
						case Constants.ADMIN:
							profile += "admin_profile.jsp";
							break;
						default:
							break;
						}
						response.sendRedirect(request.getContextPath() + profile);
					} else {
						request.setAttribute("errorMessage", "Incorrect Usertype.");
						request.setAttribute("status_code", 200);
						request.setAttribute("modal", modal);

						request.getRequestDispatcher("/index.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("errorMessage", "Incorrect password.");
					request.setAttribute("status_code", 200);
					request.setAttribute("modal", modal);
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
				// System.out.println("SignUpServlet::doPost: pwd: " + pwd +",
				// password: "+password);
				// request.getRequestDispatcher("/index.jsp").forward(request,
				// response);
			} else {
				request.setAttribute("errorMessage", "Account not found. Kindly register.");
				request.setAttribute("status_code", 200);
				request.setAttribute("modal", modal);

				// get back to order.jsp page using forward
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}
			/*
			 * request.setAttribute("errorMessage",
			 * "Account already registered.");
			 * request.setAttribute("status_code", 401);
			 * 
			 * 
			 * // get back to order.jsp page using forward
			 * request.getRequestDispatcher("/index.jsp").forward(request,
			 * response); return;
			 */
			// }
		} catch (SQLException e1) {
			System.out.println("LoginServlet::doPost: SQLException: " + e1);
		}
	}

	private String getNonEmptyValue(String value) {
		if (Util.isEmpty(value)) {
			return null;
		} else {
			return "'" + value + "'";
		}
	}

}
