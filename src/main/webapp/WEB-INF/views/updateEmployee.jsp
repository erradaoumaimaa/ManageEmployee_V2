<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Employee</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webressources/masters/styles/styleform.css?v=1.0" />
</head>
<body>
<div class="form-container">
    <h2>Update Employee Information</h2>
    <c:if test="${not empty errorMessage}">
        <p>${errorMessage}</p>
    </c:if>
    <form action="${pageContext.request.contextPath}/employees?action=update&id=${employee.id}" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${employee.name}" required />
        <br />
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${employee.email}" required />
        <br />
        
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="${employee.phone}" required />
        <br />
        
        <label for="department">Department:</label>
        <input type="text" id="department" name="department" value="${employee.department}" required />
        <br />
        
        <label for="position">Position:</label>
        <input type="text" id="position" name="position" value="${employee.position}" required />
        <br />
        
        <button type="submit">Update</button>
        <a href="${pageContext.request.contextPath}/employees?action=list">Cancel</a>
    </form>
</div>
</body>
</html>
