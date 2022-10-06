<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/common" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>
<%@ taglib prefix="phone" tagdir="/WEB-INF/tags/phone" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<common:page pageTitle="Phone list" showMenu="true">
    <div class="row justify-content-center font-italic mb-3">
        Found <c:out value="${phones.totalElements}"/> results!
    </div>
    <form:form method="get" modelAttribute="plpSearchForm" action="/phones/search">
        <table>
            <tr>
                <td><form:label path="searchQuery"><spring:message code="plp.searchQuery.label"/></form:label></td>
                <td><form:input type="text" path="searchQuery" value=""/></td>
            </tr>
            <tr>
                <td><form:label path="priceFrom"><spring:message code="plp.priceFrom.label"/></form:label></td>
                <td><form:input type="number" path="priceFrom" value=""/></td>
            </tr>
            <tr>
                <td><form:label path="priceTo"><spring:message code="plp.priceTo.label"/></form:label></td>
                <td><form:input type="number" path="priceTo" value=""/></td>
            </tr>
            <tr>
                <td>
                    <form:button class="btn btn-primary"><spring:message code="plp.search.button"/></form:button>
                </td>
            </tr>
        </table>
    </form:form>
    <a href="/phones"><spring:message code="plp.reset.search.label"/></a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Image</th>
            <th scope="col">Brand <util:sorting sortedField="brand" currentSortedField="${param.sort}"/></th>
            <th scope="col">Model <util:sorting sortedField="model" currentSortedField="${param.sort}"/></th>
            <th scope="col">Price <util:sorting sortedField="price" currentSortedField="${param.sort}"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="phone" items="${phones.content}">
            <phone:tile phone="${phone}"/>
        </c:forEach>
        </tbody>
    </table>
    <util:pagination maxPages="${plpMaxPages}" entries="${phones}"/>
</common:page>
