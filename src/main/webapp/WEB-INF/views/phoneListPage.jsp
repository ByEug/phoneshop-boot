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

    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <form:form method="get" modelAttribute="plpSearchForm" action="/phones/search">
                        <div class="form-group row">
                            <form:label class="col-sm-3 col-form-label" path="searchQuery">
                                <spring:message code="plp.searchQuery.label"/>
                            </form:label>
                            <div class="col-sm-8">
                                <form:input class="form-control" type="text" path="searchQuery" value=""/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <form:label class="col-sm-3 col-form-label" path="priceFrom">
                                <spring:message code="plp.priceFrom.label"/>
                            </form:label>
                            <div class="col-sm-8">
                                <form:input class="form-control" type="number" path="priceFrom" value=""/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <form:label class="col-sm-3 col-form-label" path="priceTo">
                                <spring:message code="plp.priceTo.label"/>
                            </form:label>
                            <div class="col-sm-8">
                                <form:input class="form-control" type="number" path="priceTo" value=""/>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <form:button class="btn btn-primary">
                                <spring:message code="plp.search.button"/>
                            </form:button>
                        </div>
                        <div class="row justify-content-center">
                            <c:if test="${not empty searchError}">
                                <div>
                                    <span class="error-span"><spring:message code="${searchError}"/></span>
                                </div>
                            </c:if>
                        </div>
                        <div class="row justify-content-center">
                            <a href="/phones"><spring:message code="plp.reset.search.label"/></a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
    <br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">
                <spring:message code="plp.column.header.image"/>
            </th>
            <th scope="col">
                <spring:message code="plp.column.header.brand"/>
                <util:sorting sortedField="brand" currentSortedField="${param.sort}"/>
            </th>
            <th scope="col">
                <spring:message code="plp.column.header.model"/>
                <util:sorting sortedField="model" currentSortedField="${param.sort}"/>
            </th>
            <th scope="col">
                <spring:message code="plp.column.header.price"/>
                <util:sorting sortedField="price" currentSortedField="${param.sort}"/>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="phone" items="${phones.content}">
            <phone:tile phone="${phone}"/>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${phones ne null and phones.content.size() != 0}">
        <util:pagination maxPages="${plpMaxPages}" entries="${phones}"/>
    </c:if>
</common:page>
