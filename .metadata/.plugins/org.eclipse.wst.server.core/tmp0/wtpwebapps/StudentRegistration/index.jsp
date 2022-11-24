<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
if (request.getParameter("submit") != null) {
	String name = request.getParameter("name");
	String course = request.getParameter("course");
	String fee = request.getParameter("fee");
	
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/students", "root", "");
	pst = con.prepareStatement("Insert into records(name, course, fee) values (?,?,?)"); 
	pst.setString(1, name);
	pst.setString(2, course);
	pst.setString(3, fee);
	pst.executeUpdate();

%>
	<script>
		alert("Record Added.");
	</script>

<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</head>
<body>
	<h1>Student Registration System</h1>
	
	<div class="row">
		<div class="col-sm-4">
			<form action="#" method="POST">
			
				<div align="left">
					<label class="form-label">Student Name</label>
					<input type="text" class="form-control" placeholder="Student Name" name="name" id="name" required>
				</div>
				
				<div align="left">
					<label class="form-label">Course Name</label>
					<input type="text" class="form-control" placeholder="Course Name" name="course" id="course" required>
				</div>
				
				<div align="left">
					<label class="form-label">Fee</label>
					<input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" required>
				</div>
				<br>
				<div align="left">
					<input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
					<input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
					
				</div>
			</form>
		</div>
		
		<div class="col-sm-8">
			<div class="panel-body">
				<table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
					<thead>
						<tr>
							<th>Student Name</th>
							<th>Course<th>
							<th>Fee</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
						<%
							Connection con;
							PreparedStatement pst;
							ResultSet rs;
							
							Class.forName("com.mysql.jdbc.Driver");
							con = DriverManager.getConnection("jdbc:mysql://localhost/students", "root", "");
							
							String query = "select * from records";
							Statement st = con.createStatement();
							rs = st.executeQuery(query);
							
							while (rs.next()) {
								String id = rs.getString("id");
						%>
						<tr>
							<td> <%=rs.getString("name") %> </td>
							<td> <%=rs.getString("course") %> </td>
							<td> <%=rs.getString("fee") %> </td>
							<td>Edit</td>
							<td>Delete</td>
						</tr>
						
						<% } %>
						
				
				</table>
			</div>
		</div>
		
		
	</div>
</body>
</html>