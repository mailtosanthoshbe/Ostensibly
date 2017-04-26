package com.ostensibly.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ostensibly.data.Constants;
import com.ostensibly.data.User;
import com.ostensibly.data.Util;
import com.ostensibly.db.Database;

/**
 * Servlet implementation class UserDetails
 */
@WebServlet("/UserDetails")
public class UserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("UserDetails:: doGET");

		String user_type = request.getParameter("user_type");
		if (!Util.isEmpty(user_type)) {
			String type = "";
			String page = "/";
			String sql = "SELECT * FROM accounts WHERE user_type = " + type;
			if (user_type.equalsIgnoreCase(Constants.STAFF)) {
				type = Util.getNonEmptyValue("" + Constants.USERTYPE.STAFF);
				page += "staff_details.jsp";
				sql = "SELECT * FROM accounts WHERE user_type = " + type;
			} else if (user_type.equalsIgnoreCase(Constants.STUDENT)) {
				type = Util.getNonEmptyValue("" + Constants.USERTYPE.STUDENT);
				page += "student_details.jsp";
				sql = "SELECT * FROM accounts WHERE user_type = " + type;
			} else if(user_type.equalsIgnoreCase("common")){
				sql = "SELECT * FROM accounts WHERE id = " + request.getParameter("uid");
				request.setAttribute("status_code", 200);
				page += request.getParameter("redirect");
			}

			Database db = (Database) getServletContext().getAttribute("db");

			// get user type list
			//String sql = "SELECT * FROM accounts WHERE user_type = " + type;
			try {
				Statement pstmt = db.getConnection().createStatement();
				ResultSet rs = pstmt.executeQuery(sql);

				ArrayList<User> list = new ArrayList<>();
				while (rs.next()) {
					// create user object
					User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
							rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
							rs.getString(10));
					list.add(user);
				}
				request.setAttribute("list", list);
				request.getRequestDispatcher(page).forward(request, response);
			} catch (SQLException e1) {
				System.out.println("LoginServlet::doPost: SQLException: " + e1);
			}

		}

	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

		String url = request.getParameter("url");
		
		System.out.println("UserDetails:: doPost: url = "+ url);
	}

}
