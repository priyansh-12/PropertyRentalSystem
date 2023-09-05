<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import = "java.util.*" %>
 <%@ page errorPage="errorpage.jsp" %>  
<%  try{ 	Class.forName("com.mysql.cj.jdbc.Driver"); %>
<%! int f=0; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Rent Page</title>
<link rel="stylesheet" type="text/css" href="CSS/RentProperty.css">
</head>
<body class="body">

 
    <header class="header">
        <div class="menu">
                <div class="div1">
                    <h1 class="menu-head">Property.com</h1>
                </div>  
                <div class="div2">
                    <ul class="menu-ul">
                        <li class="menu-li"><a class="menu-A" id="home"  href="#HOME">Home</a></li>
                        <li class="menu-li"><a class="menu-A" id="about" href="#about ">About us </a></li>
                    <li class="menu-li"><a class="menu-A" id="gallery" href="Login_page.html">Login</a></li>
                        <li class="menu-li"><a class="menu-A" id="sale" href="SaleProperty.html">Sale</a></li>
                        <li class="menu-li"><a class="menu-A" id="contact" href="#contact ">Contact</a></li>
                    </ul>
                </div>
            </div>    
      </header>


      <section class="main">
          <div class="image">
            <img src="5.jpg" alt="Not Found" class="image-tag">
          </div>
         <div class="image-content">

         </div>      
      </section>


    <section class="search-bar">
     <div class="search-div">
        <form class="search-form" action="RentProperty.jsp"  >
            <select name="Location" id="location">
                <option value="Bhawer kua" selected >Bhawer kua</option>
                <option value="Rau">Rau</option>
                <option value="Silicon City">Silicon City</option>
                <option value="Vijay Nagar" >Vijay Nagar</option>
              </select>
              <select name="size" id="size">
                <option value="1BHK" selected >1-BHK</option>
                <option value="2BHK">2- BHK</option>
                <option value="Singleroom">Single Room</option>
              </select>
              <select type="number" name="range" id="range" >
                <option value="5000" selected >Below 5 k</option>
                <option value="10000">Below 10 K</option>
                
              </select>            
              <input type="submit" class="button-43" id="butt" value="SEARCH">
        </form>
     </div>
 </section>
 
<section class="table">
 	
    

 
<%

    PrintWriter pw = response.getWriter();
    String location =      request.getParameter("Location");
    String size     =    request.getParameter("size");
    int range    =         Integer.parseInt(request.getParameter("range"));
   
  
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/propertyrentalsystem","root", 
				"Maltare123@");
    	PreparedStatement st = con.prepareStatement("SELECT * FROM propertyrentalsystem.sale_property where Area = ? and Flat_type = ? and Cost < ?");
         st.setString(1, location);
         st.setString(2, size);
         st.setInt(3, range);
         ResultSet rs = st.executeQuery();		
 	
         if(rs.isBeforeFirst()) {  %>
          
 	<h1 class="tble-head" > Here is the list </h1>
    <h3 class="tble-head2">Now Click on button to contact </h3>	
 			<% while(rs.next()){ %> 
 	 
 		 <%f=1; %>
       <div class="table-div">
        <h2 class="area">Area : </h2><p class="data"  > <%=rs.getString(3)   %> </p>
        <h2 class="area">Owner Name : </h2><p class="data"> <%=rs.getString(4)  %> </p>
        <h2 class="area">Flat Type  : </h2><p class="data"> <%=rs.getString(5)  %> </p>
        <h2 class="area"> Cost : </h2><p class="data"> <%=rs.getInt(6)  %> </p>
         <h2 class="area"> Contact No. : </h2><p class="data"> <%=rs.getInt(7)  %> </p>
        <button class="button-7" id="buttt"><a class="a-tag" href="BookingPage.html">Click to contact</a></button> 
    </div>

    <% }%>
             
    <% }%>
    
  
          <%con.close(); %>
    
   <% }catch(ClassNotFoundException | SQLException e)
   {
 	  System.out.print(e);
   }
   catch(NullPointerException exe)
   {
 	  System.out.print(exe);
   }

   %>  
 	     
  </table>
   </div>
 </section>
 <% if(f!=1) {   %>
  <h1 class="tble-head" > Sorry No Property Available </h1> 
 
 <% System.out.println(f); %>
  
 <% }%>
 <%  f=0; %>
<section class="working">
    <div class="working-div">
        <h1 class="how-it-works">How it Works</h1>
        <h3 class="steps">Their are 3 Easy Steps</h3>
    </div>
    <div class="working-content">
        <div class="fill-detail">
            <img src="6.png" alt="Not Found" class="formfill">
            <h3 class="fill-det">1.Fill th Details</h3>
            <p class="fill-p">Fill Location , size , Range according to your need and tap on the Search button</p>
        </div>
        <div class="choose-detail">
            <img src="7.png" alt="Not Found" class="chooseimg">
            <h3 class="choose-det">2.Search It!</h3>
            <p class="choose-p">Now after searching , choose your property from given list to take rent   </p>
        </div>
        <div class="contact-detail">
            <img src="8.png" alt="Not Found" class="contactimg">
            <h3 class="contact-det">3.Contact The Owner</h3>
            <p class="contact-p">after selecting the property contact the Owner from By filling Form </p>
        </div>
    </div>
</section>

    <section class="footer">
 <div class="div-foot">
    
    <div class="aboutus">
        <h3 class="aboutus-h">About Work</h3>
        <p class="work">We Generally help people to get connected in cases of property where people can find perfect place to stay</p>
    </div>

    <div class="contact-det">
        <h3 class="contact-head">Contact Info</h3>
       
       <div class="address-div">
           <p class="address"> Behind Hanuman Mandir , Dhamnod Dhar</p>
       </div>

        <div class="email-div">
            <p class="email">maltarepriyansh56@gmail.com</p>  
        </div>
        
        <div class="number-div">
            <p class="number"> 7354190735 </p>
    </div>

        
       
    </div>

    <div class="navigation">
        <div class="navi">
            <h3 class="navi-h">Navigation</h3>
            <ul class="navi-ul">
                <li class="navi-li"><a class="navi-A" id="home"  href="#HOME">Home</a></li>
                <li class="navi-li"><a class="navi-A" id="about" href="about.html">About us </a></li>
                     <li class="menu-li"><a class="menu-A" id="gallery" href="Login_page.html">Login</a></li>
                <li class="navi-li"><a class="navi-A" id="sale" href="Sale.html">Sale</a></li>
                <li class="navi-li"><a class="navi-A" id="contact" href="contact.html">Contact</a></li>
            </ul>
        </div>
    </div>
    
 </div>
</section>
    
</body>
</html>