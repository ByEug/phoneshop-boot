<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/common" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>
<%@ taglib prefix="user" tagdir="/WEB-INF/tags/user" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<common:page pageTitle="Admin panel" showMenu="false">
    <div class="row mb-3">
        <common:back/>
    </div>
    <div class="row justify-content-center">
        <h2><spring:message code="admin.list.page.header"/></h2>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col"><spring:message code="admin.list.page.id"/></th>
            <th scope="col"><spring:message code="admin.list.page.username"/></th>
            <th scope="col"><spring:message code="admin.list.page.location"/></th>
            <th scope="col"><spring:message code="admin.list.page.date"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users.content}">
            <user:tile user="${user}"/>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${users ne null and users.content.size() != 0}">
        <util:pagination maxPages="${plpMaxPages}" entries="${users}"/>
    </c:if>
</common:page>
