<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/webressources/masters/styles/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    <title>Résultats de Filtrage</title>
</head>
<body>
<div class="container">
    <h2>Résultats de Filtrage</h2>
    <table class="tbl">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Email</th>
                <th>Téléphone</th>
                <th>Poste</th>
                <th>Département</th>
                <th colspan="2">Action</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty employees}">
                <c:forEach var="employee" items="${employees}">
                    <tr>
                        <td data-label="ID"><c:out value="${employee.id}" /></td>
                        <td data-label="Nom"><c:out value="${employee.name}" /></td>
                        <td data-label="Email"><c:out value="${employee.email}" /></td>
                        <td data-label="Téléphone"><c:out value="${employee.phone}" /></td>
                        <td data-label="Poste"><c:out value="${employee.position}" /></td>
                        <td data-label="Département"><c:out value="${employee.department}" /></td>
                        <td data-label="Modifier">
                            <a href="${pageContext.request.contextPath}/employees?action=edit&id=${employee.id}" class="btn_edit">
                                <i class="fa fa-pencil"></i>
                            </a>
                        </td>
                        <td data-label="Supprimer">
                            <a href="${pageContext.request.contextPath}/employees?action=delete&id=${employee.id}" class="btn_trash" 
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet employé ?');">
                                <i class="fa fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty employees}">
                <tr>
                    <td colspan="8">Aucun employé trouvé.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/employees?action=list" class="btn_back">Retour à la liste</a>
</div>
</body>
</html>
