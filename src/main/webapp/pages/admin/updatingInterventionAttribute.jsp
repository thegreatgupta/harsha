
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
<%@page import="com.harsha.app.bean.ProjectBean"%>
    <%
    
    String attributeName = request.getParameter("attributeName");
    int projectAttributeId = Integer.parseInt(request.getParameter("projectAttributeId"));
	int projectTypeId = Integer.parseInt(request.getParameter("projectTypeId"));
	int displaySequence= Integer.parseInt(request.getParameter("displaySequence"));
	int fixedValue =   Integer.parseInt(request.getParameter("fixedValue"));
	int status =   Integer.parseInt(request.getParameter("status"));
	DBManager dbManager=new DBManager();
	try {
	         response.setContentType("text/html");
	        int flag  = DBHandler.updateProjectAttribute( projectAttributeId,projectTypeId,attributeName,displaySequence,fixedValue,status, dbManager);
	        //RequestDispatcher rd;
			if(flag==1) {
				String result = "ok";
	        	response.getWriter().write(result);
	        	System.out.println(flag);
			
			}
			else {
				
				String result = "na";
	        	response.getWriter().write(result);
			 
			}
	   } 
		catch (Exception e) {
	        e.printStackTrace();
	   }
		
		
    %>