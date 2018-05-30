package index.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import common.db.model.Users;

import index.model.*;

public class UsersController extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		
		this.doPost(request,response);
	
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String postType=request.getParameter("postType");
		
		if (postType.equals("register")) {
			try {
				this.register(Users.instantce()
						.setUserName(request.getParameter("user_name"))
						.setUserPassword(request.getParameter("user_password"))
						.setUserPhone(request.getParameter("user_phone"))
						.setUserEmail(request.getParameter("user_email"))
						
					);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	protected void register (Users users) throws SQLException {
		UsersModel.instance().register(users);
	}
}

