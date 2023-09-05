package servlet;
import java.sql.*;
import java.util.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/LoginPageServlet")
public class LoginPageServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String username = request.getParameter("username");
		String password = request.getParameter("Password");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/minesql","root", 
	 				"Maltare123@");
			PreparedStatement pr = con.prepareStatement("SELECT * FROM propertyrentalsystem.login_table where User_Name = ? and Password =?");
			pr.setString(1, username);
			pr.setString(2, password);
			
			  ResultSet rs = pr.executeQuery();
		         if(rs.isBeforeFirst())
		         {
		         	rs.next();
		        // 	System.out.print(rs.getString(1)+" "+rs.getString(2));
		         //	o.println("<h2>Finally Login Successfull  :) </h2>");
		         RequestDispatcher r = request.getRequestDispatcher("HomePage.html");
		       
		         HttpSession session=request.getSession();  
		         String id = session.getId();
		         session.setAttribute("ID",id);  
		         r.forward(request, response);
		         }
		         else
		         {
		         	System.out.print("\n Not founded");
		            RequestDispatcher r = request.getRequestDispatcher("Register.html");
		         }
		         con.close();
		         
		   
		}
		
	   catch(ClassNotFoundException | SQLException e)
	   {
	 	  System.out.print(e);
	   }
	   catch(NullPointerException exe)
	   {
	 	  System.out.print(exe);
	   }
	}

}
