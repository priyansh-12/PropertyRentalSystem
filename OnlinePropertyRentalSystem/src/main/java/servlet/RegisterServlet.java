package servlet;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
	 		String u_name = request.getParameter("username");
	 		String password = request.getParameter("password");
	 		try
	 		{
	 			Class.forName("com.mysql.cj.jdbc.Driver");
	 			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/minesql","root", 
		 				"Maltare123@");
	 			PreparedStatement pr = con.prepareStatement("insert into propertyrentalsystem.login_table"
	 					+ "(User_Name,Password) values(?,?)" );
	 			pr.setString(1, u_name);
	 			pr.setString(2, password);
	 			int count = pr.executeUpdate();
	 		 	
	 	 		if(count > 0)
	 	 			System.out.println("product inserted");
	 	 		else
	 	 			System.out.println("product insertion "
	 	 					+ "failed");
	 	 		
	 	 		//7) close the database Connection.
	 	 		
	 	 		con.close();
	 	    	 
		         RequestDispatcher r = request.getRequestDispatcher("Login_page.html");
		         r.forward(request, response);
	 	 		
	 		}
	 	
	 		catch(ClassNotFoundException |  SQLException e)
	 		{
	 			e.printStackTrace();
	 		}
	 		catch(NullPointerException exe)
	 		{
	 			exe.printStackTrace();
	 		}
	 	
	 	}

	 

}
