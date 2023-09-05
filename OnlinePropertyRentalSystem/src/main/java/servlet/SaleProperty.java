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

import com.mysql.cj.Session;



 @WebServlet("/SaleProperty")
public class SaleProperty extends HttpServlet {
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
        HttpSession session=request.getSession(false);  
        if(session!=null)
        {
    		String name = request.getParameter("name");
     		int contact = Integer.parseInt(request.getParameter("contactno"));
     		int cost = Integer.parseInt(request.getParameter("cost"));
     		String area = request.getParameter("area");
     		String size =  request.getParameter("size");
     		String location = request.getParameter("location");
     		
     		try
     		{
     			Class.forName("com.mysql.cj.jdbc.Driver");
     		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/minesql","root", 
    	 				"Maltare123@");
     		    
     		    PreparedStatement st = con.prepareStatement("insert into propertyrentalsystem.sale_property"+
     		      	 "(Location,Area,Owner_name,Flat_type,Cost,Contact_no) values(?,?,?,?,?,?)");
     		    
     		    st.setString(1, location);
     		    st.setString(2, area);
     		    st.setString(3, name);
     		    st.setString(4, size);
     		    st.setInt(5, cost);
     		    st.setInt(6, contact);
     		    
     			int count = st.executeUpdate();
     		 	
     	 		if(count > 0)
     	 		{
     	 			System.out.println(" inserted");
     	 			
     	 		}
     	 		else
     	 			System.out.println("  insertion "
     	 					+ "failed");
     	 		
     	 		//7) close the database Connection.
     	 		
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
        else
        {
        	RequestDispatcher rs = request.getRequestDispatcher("LoginPage.html");
        	
        	rs.forward(request, response);
        }
 
	}

 
}
