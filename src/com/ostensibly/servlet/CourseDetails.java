package com.ostensibly.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ostensibly.data.Constants;
import com.ostensibly.data.Util;
import com.ostensibly.db.Database;

/**
 * Servlet implementation class CourseDetails
 */
@WebServlet("/CourseDetails")
public class CourseDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Database db = (Database) getServletContext().getAttribute("db");
		String action = request.getParameter("action");
		switch (action) {
		case "enroll": {
			String cid = request.getParameter("cid");
			String uid = request.getParameter("uid");
			String status = Constants.COURSE_ENROLLMENT.ENROLLED;

			// check the item exist or not
			String sql = "SELECT * FROM enrollments WHERE " + Database.TBL_ENROLLMENT_CID + "=" + cid + " AND "
					+ Database.TBL_ENROLLMENT_UID + "=" + uid;
			try {
				Statement pstmt = db.getConnection().createStatement();
				pstmt.setQueryTimeout(30); // set timeout to 30 sec.
				ResultSet rs = pstmt.executeQuery(sql);
				rs.next();
				int cnt = rs.getRow();
				if (cnt > 0) {
					switch (rs.getString(5)) {
					case Constants.COURSE_ENROLLMENT.ENROLLED:
						request.setAttribute("errorMessage", "Course already enrolled but payment is pending.");
						break;
					case Constants.COURSE_ENROLLMENT.PAYMENT_PENDING:
						request.setAttribute("errorMessage", "Course allotted but payment is pending.");
						break;
					case Constants.COURSE_ENROLLMENT.ALLOTED:
						request.setAttribute("errorMessage", "Course enrolled is already alloted.");
						break;
					}
					request.setAttribute("cid", cid);
					request.setAttribute("status", rs.getString(5));
					// get back to order.jsp page using forward
					request.getRequestDispatcher("/course_details.jsp").forward(request, response);
				} else {
					String item = cid + ", " + uid + ", " + "null, " + status;
					String insertStmt = "insert into enrollments values(null, " + item + ")";
					int count = pstmt.executeUpdate(insertStmt);
					if (count > 0) {
						request.setAttribute("message", "Course Enrolled successfully.");
					}

					// get back to order.jsp page using forward
					request.getRequestDispatcher("/course_details.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				System.out.println("CourseDetails:: doPost: enroll:: SQLException: " + e);
			}
			break;
		}
		case "notpaid": {
			String allot_id = request.getParameter("allotid");
			String sid = request.getParameter("sid");

			try {
				if (sid.equals("0")) {
					request.setAttribute("errorMessage", "No staff available.");
				} else {
					Statement pstmt = db.getConnection().createStatement();

					String item = "staff_id = " + sid + ", status = " + Constants.COURSE_ENROLLMENT.PAYMENT_PENDING;
					String updateStmt = "update enrollments set " + item + " where _id = " + allot_id;
					int count = pstmt.executeUpdate(updateStmt);
					if (count > 0) {
						request.setAttribute("message", "Course Enrolled successfully.");
					}
				}
				// get back to order.jsp page using forward
				request.getRequestDispatcher("/course_request.jsp").forward(request, response);
			} catch (SQLException e) {
				System.out.println("CourseDetails:: doPost: enroll:: SQLException: " + e);
			}
			break;
		}
		case "alloted": {
			String allot_id = request.getParameter("allotid");
			String sid = request.getParameter("sid");

			try {

				Statement pstmt = db.getConnection().createStatement();

				String item = "status = " + Constants.COURSE_ENROLLMENT.ALLOTED;
				String updateStmt = "update enrollments set " + item + " where _id = " + allot_id;
				int count = pstmt.executeUpdate(updateStmt);
				if (count > 0) {
					request.setAttribute("message", "Course alloted successfully.");
				}

				// get back to order.jsp page using forward
				request.getRequestDispatcher("/course_allotment.jsp").forward(request, response);
			} catch (SQLException e) {
				System.out.println("CourseDetails:: doPost: enroll:: SQLException: " + e);
			}
			break;
		}
		default:
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Database db = (Database) getServletContext().getAttribute("db");
		String action = request.getParameter("action");
		switch (action) {
		case "add": {
			String customer_name = Util.getNonEmptyValue(request.getParameter("cname"));
			String duration_time = Util.getNonEmptyValue(request.getParameter("dtime"));
			String amount = Util.getNonEmptyValue(request.getParameter("amount"));
			String description = Util.getNonEmptyValue(request.getParameter("description"));

			Statement statement;
			try {
				statement = db.getConnection().createStatement();
				statement.setQueryTimeout(30); // set timeout to 30 sec.
				String item = customer_name + ", " + duration_time + ", " + amount + ", " + description;
				String insertStmt = "insert into courses values(null, " + item + ")";
				int count = statement.executeUpdate(insertStmt);
				if (count > 0) {
					request.setAttribute("message", "Course added successfully.");
				}

				// get back to order.jsp page using forward
				request.getRequestDispatcher("/add_course.jsp").forward(request, response);

			} catch (SQLException e) {
				// out.print("SQLException: " + e);
				System.out.println("CourseDetails:: doPost: add:: SQLException: " + e);
			}
			break;
		}
		default:
			break;
		}
	}
}
