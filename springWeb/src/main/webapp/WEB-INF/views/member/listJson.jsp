<%@ page pageEncoding="UTF-8" contentType="text/plain; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
[
<c:forEach var="a" items="${list}" varStatus="i">
{ "id" : "${a.id}", "name" : "${a.name}" }
<c:if test="${!i.last}">,</c:if>
</c:forEach>
]