<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ attribute name="maxPages" required="true" type="java.lang.Integer" %>
<%@ attribute name="entries" required="true" type="org.springframework.data.domain.Page" %>

<div class="row justify-content-center">
    <a class="page-link"
       style="<c:if test="${entries.hasPrevious() ne true}">pointer-events: none;cursor: default;color: gray</c:if>"
       href="<util:link pageNumber="${entries.number - 1}"/>">
        <spring:message code="pagination.previous.page"/>
    </a>

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
        <a class="page-link" style="font-weight:${entries.number eq pageNumber ? 'bold' : ''}" href="<util:link pageNumber="${pageNumber}"/>">${pageNumber + 1}</a>
    </c:forEach>

    <a class="page-link"
       style="<c:if test="${entries.hasNext() ne true}">pointer-events: none;cursor: default;color: gray</c:if>"
       href="<util:link pageNumber="${entries.number + 1}"/>">
        <spring:message code="pagination.next.page"/>
    </a>
</div>
