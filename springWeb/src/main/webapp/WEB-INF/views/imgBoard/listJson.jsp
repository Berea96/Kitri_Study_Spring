<%@ page pageEncoding="UTF-8" contentType="text/plain; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
[
<c:forEach var="a" items="${list}" varStatus="i">
{ "num" : "${a.num}", "title" : "${a.title}", "writer" : "${a.writer}",
  "content" : "${a.content}", "img_path" : "${a.img_path}", 
  "w_date" : ${a.w_date} }
<c:if test="${!i.last}">,</c:if>
</c:forEach>
]