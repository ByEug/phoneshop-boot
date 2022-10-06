<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="sortedField" required="true" type="java.lang.String" %>
<%@ attribute name="currentSortedField" required="false" type="java.lang.String" %>
<c:set var="upperArrow" value="&#x25B2;"/>
<c:set var="downArrow" value="&#x25BC;"/>
<c:set var="ascending" value=",asc"/>
<c:set var="descending" value=",desc"/>
<a href="<util:paginationLink sortField="${sortedField}${ascending}"/>" class="<c:if test="${currentSortedField eq sortedField.concat(ascending)}">disabled</c:if>">
    <c:out value="${upperArrow}" escapeXml="false"/>
</a>
<a href="<util:paginationLink sortField="${sortedField}${descending}"/>" class="<c:if test="${currentSortedField eq sortedField.concat(descending)}">disabled</c:if>">
    <c:out value="${downArrow}" escapeXml="false"/>
</a>
