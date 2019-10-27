<%-- 
    Document   : info-writer
    Created on : Oct 25, 2019, 10:17:36 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="writer" class="com.mark.bean.PagingWriters" />
<jsp:setProperty name="writer" property="*" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../newHeader.jsp" />
        <div class="container-fluid bg-light-blue" style="height: 50px">          
        </div>
        <div class="container d-flex col-lg-6 bg-light p-0">
            <jsp:include page="info-submenu.jsp" />
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <div class="d-flex">
                    <h4>Writers Information</h4>
                    <button class="btn btn-success ml-auto">Add</button>
                </div>
                <table class="table table-dark">
                    <tr><th>ID</th><th>Writer Name</th><th>Birth Date</th><th>Address</th></tr>
                    <c:forEach var="w" items="${writer.writers}" >
                        <tr><td>${w.ID}</td><td>${w.name}</td><td>${w.birthDate}</td><td>${w.address}</td></tr>
                    </c:forEach>
                </table>
                <c:if test="${param.page > 2}">
                    <a href="info-writer.jsp?page=${param.page-1}" class="page-num"> Previous</a>
                </c:if>
                <c:forEach var="i" begin="${param.page <= 1 || empty param.page ? 1:param.page-1}" end="${(param.page+1) < writer.pages ? (param.page+1):writer.pages}" step="1" >
                    <c:url value="info-writer.jsp" var="next" >
                        <c:param name="page" value="${i}" />
                    </c:url>
                    <a href="${next}" class="page-num"> ${i}</a>
                </c:forEach>
                <c:if test="${param.page+1 < writer.pages}">
                    <a href="info-writer.jsp?page=${param.page+1}" class="page-num"> Next</a>
                </c:if>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </body>
</html>
