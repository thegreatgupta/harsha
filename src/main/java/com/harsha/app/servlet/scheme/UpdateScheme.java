package com.harsha.app.servlet.scheme;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.harsha.app.bean.SchemeBean;
import com.harsha.app.database.DBHandler;
import com.harsha.app.database.DBManager;

/**
 * Servlet implementation class UpdateScheme
 */
@WebServlet("/UpdateScheme")
public class UpdateScheme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateScheme() {
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
		int schemeId = Integer.parseInt(request.getParameter("schemeId"));
		String schemeName = request.getParameter("schemeName");
		DBManager dbManager=new DBManager();
		HttpSession session=request.getSession();
		int flag =DBHandler.updateScheme(schemeId, schemeName, dbManager);
		if(flag>0)
		{
			RequestDispatcher rd= request.getRequestDispatcher("adminScheme1.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd= request.getRequestDispatcher("adminScheme1.jsp");
			request.setAttribute("schemeId",schemeId );
			rd.forward(request, response);
		}
	}

}
