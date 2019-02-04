<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
<c:forEach var="p" items="${list}" varStatus="i">
{ "num" : "${p.num}", "title" : "${p.title}", "seller" : "${p.seller}", 
  "category" : "${p.category}", "quantity" : "${p.quantity}", 
  "content" : "${p.content}", "price" : "${price}", "img1" : "${p.img1}",
  "img2" : "${p.img2}", "img3" : "${p.img3}", "img4" : "${p.img4}",}
<c:if test="${!i.last}">,</c:if>
</c:forEach>
]