<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ attribute name="user" required="true" type="com.expertsoft.phoneshop.persistence.model.PhoneShopUser" %>
<tr>
    <td>
        <span><c:out value="${user.id}"/></span>
    </td>
    <td><c:out value="${user.username}"/></td>
    <td><c:out value="${user.location}"/></td>
    <td>
        <c:choose>
            <c:when test="${user.dateRegistered ne null}">
                <c:out value="${user.dateRegistered}"/>
            </c:when>
            <c:otherwise>
                <spring:message code="admin.list.page.date.default"/>
            </c:otherwise>
        </c:choose>
    </td>
</tr>