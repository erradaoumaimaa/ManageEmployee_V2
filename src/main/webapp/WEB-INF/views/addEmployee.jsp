<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webressources/masters/styles/styleform.css?v=1.0" />
</head>
<body>
<div class="form-container">
<h2>Add Employee</h2>
<form action="${pageContext.request.contextPath}/employees?action=add" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required />
    <br />
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required />
    <br />
    
    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone" required />
    <br />
    
    <label for="department">Department:</label>
    <input type="text" id="department" name="department" required />
    <br />
    
    <label for="position">Position:</label>
    <input type="text" id="position" name="position" required />
    <br />
    
    <button type="submit">Add</button>
    <a href="${pageContext.request.contextPath}/employees?action=list">Cancel</a>
</form>
</div>

</body>
</html>
