package com.harsha.app.servlet.checkpoint;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.harsha.app.bean.UserViewBean;
import com.harsha.app.database.DBHandler;
import com.harsha.app.database.DBManager;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int userId=Integer.parseInt(request.getParameter("userId"));
		String oldPassword=request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		DBManager dbManager=new DBManager();
		HttpSession session=request.getSession();
		int flag=DBHandler.changePassword(userId, oldPassword, newPassword, dbManager);
		if(flag == 0)
		{
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			session.setAttribute("userDetail", flag);
			request.setAttribute("user", flag);
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("changepassword.jsp");
			session.setAttribute("userDetail", flag);
			request.setAttribute("user", flag);
			rd.forward(request, response);
		}
		
	}

}
