<%
session.setAttribute("currentSessionUser", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>