<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="maxPages" required="true" type="java.lang.Integer" %>
<%@ attribute name="entries" required="true" type="org.springframework.data.domain.Page" %>

<div>
    <c:if test="${entries.hasPrevious()}">
        <a href="/phones?page=${entries.previousOrFirstPageable()}"><<</a>
    </c:if>

    <c:choose>
        <c:when test="${entries.totalPages <= maxPages}">
            <c:set var="begin" value="0"/>
            <c:set var="end" value="${entries.totalPages - 1}"/>
        </c:when>
        <c:when test="${entries.totalPages <= entries.number + maxPages / 2}">
            <c:set var="begin" value="${entries.totalPages - maxPages}"/>
            <c:set var="end" value="${entries.totalPages - 1}"/>
        </c:when>
        <c:when test="${entries.number - maxPages / 2 <= 0}">
            <c:set var="begin" value="0"/>
            <c:set var="end" value="${maxPages - 1}"/>
        </c:when>
        <c:otherwise>
            <c:set var="begin" value="${entries.number - maxPages / 2 + maxPages % 2}"/>
            <c:set var="end" value="${entries.number + maxPages / 2 + maxPages % 2 - 1}"/>
        </c:otherwise>
    </c:choose>
    <c:forEach begin="${begin}"
               end="${end}" step="1" var="pageNumber">
        <a style="font-weight:${entries.number eq pageNumber ? 'bold' : ''}" href="/phones?page=${pageNumber}">${pageNumber + 1}</a>
    </c:forEach>

    <c:if test="${entries.hasNext()}">
        <a href="/phones?page=${entries.nextOrLastPageable()}">>></a>
    </c:if>
</div>