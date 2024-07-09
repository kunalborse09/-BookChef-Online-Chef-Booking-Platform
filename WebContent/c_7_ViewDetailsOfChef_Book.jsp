<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.r3sys.db.dbConnection"%>
<%@ page import="com.r3sys.db.GetSetValue"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view chef city wise</title>
<style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            margin-top: 30px;
            color: #333;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        a.button {
            display: inline-block;
            padding: 8px 12px;
            margin: 5px;
            text-align: center;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
        }

        a.button.disapprove {
            background-color: #FF5733;
        }

        center {
            margin-top: 20px;
        }
    </style>
</head>
<body>
	
	<center>
	
	<%   
		Connection con = dbConnection.connect();
		String city = request.getParameter("city");
		String speciality = request.getParameter("speciality");
		try
		{
		PreparedStatement pstmt = con.prepareStatement("select * from chef where status = ? and speciality=? and city = ?");
		pstmt.setString(1,"Approved");
		pstmt.setString(2,speciality);
		pstmt.setString(3,city);
		ResultSet rs = pstmt.executeQuery();
	%>
	
	<table border="1">
	
	<tr>
		<th>ID</th>
		<th>chef_name</th>
		<th>speciality</th>
		<th>openTime</th>
		<th>closeTime</th>
		<th>address</th>
		<th>area</th>
		<th>city</th>
		<th>pincode</th>
		<th>contact</th>
		<th>email</th>
		<th>password</th>
		<th>status</th>
		<th>Book Chef</th>
		
	</tr>
	
	<% while(rs.next()) { %>
	<tr>
		<td> <%= rs.getInt(1) %></td>
		<td> <%= rs.getString(2) %></td>
		<td> <%= rs.getString(3) %></td>
		<td> <%= rs.getString(4) %></td>
		<td> <%= rs.getString(5) %></td>
		<td> <%= rs.getString(6) %></td>
		<td> <%= rs.getString(7) %></td>
		<td> <%= rs.getString(8) %></td>
		<td> <%= rs.getString(9) %></td>
		<td> <%= rs.getString(10) %></td>
		<td> <%= rs.getString(11) %></td>
		<td> <%= rs.getString(12) %></td>
		<td> <%= rs.getString(13) %></td>
		<td><a href="c_8_BookChef.html?cid=<%=rs.getInt(1)%><%GetSetValue.setCid(rs.getInt(1));%>">Book</a></td>
		
	</tr>
	<% }
	}
	catch(Exception e)
	{
	e.printStackTrace();
	}%>
	
	
</body>
</html>