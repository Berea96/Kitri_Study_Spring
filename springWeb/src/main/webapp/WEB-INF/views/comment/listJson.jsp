<%@ page pageEncoding="UTF-8" contentType="text/plain; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
[
<c:forEach var="a" items="${list}" varStatus="i">
{ "comment_num" : "${a.comment_num}", "article_num" : "${a.article_num}", 
"writer" : "${a.writer}", "content" : "${a.content}"}
<c:if test="${!i.last}">,</c:if>
</c:forEach>
]