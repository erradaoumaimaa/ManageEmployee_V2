<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/webressources/masters/styles/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    
    <title>Manage Employees</title>
</head>
<body>
<div class="container">
    <div class="tbl_content">
        <h2>Manage Employees</h2>
        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px; ; padding: 10px;">
		    <form action="${pageContext.request.contextPath}/employees" method="get" style="display: flex; gap: 10px;">
		        <input type="text" name="search" placeholder="Search by name or email" value="${param.search}">		        
		        <select style="background:#023047 ;color:#fff ;border-radius: 12px;padding: 10px 15px;" name="position">
		            <option value="">Select Position</option>
		            <option value="Manager" <c:if test="${param.position == 'Manager'}">selected</c:if>>Manager</option>
		            <option value="Developer" <c:if test="${param.position == 'Developer'}">selected</c:if>>Developer</option>
		            <option value="Designer" <c:if test="${param.position == 'Designer'}">selected</c:if>>Designer</option>
		        </select>
		
		        <select style="background:#023047;color:#fff ;border-radius: 12px;padding: 10px 15px;" name="department">
		            <option value="">Select Department</option>
		            <option value="HR" <c:if test="${param.department == 'HR'}">selected</c:if>>HR</option>
		            <option value="IT" <c:if test="${param.department == 'IT'}">selected</c:if>>IT</option>
		            <option value="Finance" <c:if test="${param.department == 'Finance'}">selected</c:if>>Finance</option>
		        </select>
		
		        <button style=" background:#023047;color:#fff;border-radius: 12px;padding: 10px 15px;"type="submit">Search</button>
		    </form>
		    
		    <a style="background:#008000; ; color:#fff;border-radius: 12px;" href="${pageContext.request.contextPath}/employees?action=create" class="btn_add">
		        <i class="fa fa-plus"></i> Add Employee
		    </a>
		</div>

        <table class="tbl">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Department</th>
                    <th>Position</th>
                    <th colspan="2">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${not empty employees}">
                    <c:forEach var="employee" items="${employees}">
                        <tr>
                            <td data-label="ID"><c:out value="${employee.id}" /></td>
                            <td data-label="Name"><c:out value="${employee.name}" /></td>
                            <td data-label="Email"><c:out value="${employee.email}" /></td>
                            <td data-label="Phone"><c:out value="${employee.phone}" /></td>
                            <td data-label="Department"><c:out value="${employee.department}" /></td>
                            <td data-label="Position"><c:out value="${employee.position}" /></td>
                            <td data-label="Edit">
							    <a href="${pageContext.request.contextPath}/employees?action=edit&id=${employee.id}" class="btn_edit">
							        <i class="fa fa-pencil"></i>
							    </a>
							    
							</td>
							                            
                            <td data-label="Delete">
                                <a href="<%=request.getContextPath() %>/employees?action=delete&id=${employee.id}" class="btn_trash" 
                                   onclick="return confirm('Are you sure you want to delete this employee?');">
                                    <i class="fa fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty employees}">
                    <tr>
                        <td colspan="8">No employees found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
