<%@page import="java.util.*" %>

<%session.invalidate();
System.out.println("logged out!");
response.sendRedirect("login.jsp");
%>
