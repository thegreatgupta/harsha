
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import=" javax.servlet.RequestDispatcher"%>
<%@page import ="javax.servlet.ServletException"%>
<%@page import ="javax.servlet.http.HttpServlet"%>
<%@page import ="javax.servlet.http.HttpServletRequest"%>
<%@page import ="javax.servlet.http.HttpServletResponse"%>
<%@page import ="javax.servlet.http.HttpSession"%>
<%@page import ="com.harsha.app.bean.StateBean"%>
<%@page import=" com.harsha.app.database.DBHandler"%>
<%@page import=" com.harsha.app.database.DBManager"%>
<%@page import="com.harsha.app.bean.EducationBean"%>
    <%
  	
   	String occupationName = request.getParameter("occupationName");
	int occupationCode = Integer.parseInt(request.getParameter("occupationCode"));
	int occupationId = Integer.parseInt(request.getParameter("occupationId"));
	DBManager dbManager=new DBManager();
	try {
	       	response.setContentType("text/html");
	       //	System.out.println("hello");
	        int flag  = DBHandler.updateOccupation(occupationId,occupationCode,occupationName,  dbManager);
	        RequestDispatcher rd;
			if(flag==1) {
				
				String result = "ok";
	        	response.getWriter().write(result);
	        	System.out.println(flag);
			
			}
			else {
				
				String result = "na";
	        	response.getWriter().write(result);
	        	System.out.println(flag);
			
			}
	   } 
		catch (Exception e) {
	        e.printStackTrace();
	   }
		
		
    %>