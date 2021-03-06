package com.harsha.app.servlet.block;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.harsha.app.bean.BlockBean;
import com.harsha.app.bean.UserViewBean;
import com.harsha.app.database.DBHandler;
import com.harsha.app.database.DBManager;

/**
 * Servlet implementation class UpdateBlock
 */
@WebServlet("/UpdateBlock")
public class UpdateBlock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBlock() {
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
		int blockId = Integer.parseInt(request.getParameter("blockId"));
		String blockName = request.getParameter("blockName");
		String blockCode = request.getParameter("blockCode");
		int districtId = Integer.parseInt(request.getParameter("districtId"));
		DBManager dbManager=new DBManager();
		HttpSession session=request.getSession(false);
		UserViewBean user = (UserViewBean) session.getAttribute("userDetail");
		int flag =DBHandler.updateBlock(blockId, blockCode, blockName, districtId, dbManager);
		if(flag == 0)
		{
			RequestDispatcher rd=request.getRequestDispatcher("adminBlock1.jsp?blockId="+blockId);
			//session.setAttribute("userDetail", flag);
			request.setAttribute("msg", "Updation Successful");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("adminBlock1.jsp?blockId="+blockId);
			//session.setAttribute("userDetail", flag);
			request.setAttribute("msg", "Updation Unsuccessful");
			rd.forward(request, response);
		}
		
	}

}
