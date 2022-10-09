<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="pageNumber" required="false" type="java.lang.Integer" %>
<%@ attribute name="sortField" required="false" type="java.lang.String" %>

<c:url value="${pageContext.request.pathInfo}">
    <c:forEach items="${param}" var="entry">
        <c:if test="${entry.key ne 'page' and entry.key ne 'sort'}">
            <c:param name="${entry.key}" value="${entry.value}" />
        </c:if>
    </c:forEach>
    <c:choose>
        <c:when test="${not empty pageNumber}">
            <c:param name="page" value="${pageNumber}" />
        </c:when>
        <c:when test="${not empty param.page}">
            <c:param name="page" value="${param.page}" />
        </c:when>
    </c:choose>
    <c:choose>
        <c:when test="${not empty sortField}">
            <c:param name="sort" value="${sortField}" />
        </c:when>
        <c:when test="${not empty param.sort}">
            <c:param name="sort" value="${param.sort}" />
        </c:when>
    </c:choose>
</c:url>
