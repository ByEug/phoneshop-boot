<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/common" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<common:page pageTitle="Phone details" showMenu="true">
    <div class="row mb-3">
        <common:back/>
    </div>
    <div class="row justify-content-center">
        <h2>${phone.brand}&nbsp${phone.model}</h2>
    </div>
    <div class="pdp-content">
        <div>
            <img src="<c:url value="https://raw.githubusercontent.com/andrewosipenko/phoneshop-ext-images/master/${phone.image}"/>" width="350" height="350" alt="Phone image">
        </div>
        <div>
            <table>
                <tr>
                    <td class="property-name"><spring:message code="pdp.brand"/></td>
                    <td><c:out value="${phone.brand}"/></td>
                </tr>
                <tr>
                    <td class="property-name"><spring:message code="pdp.model"/></td>
                    <td><c:out value="${phone.model}"/></td>
                </tr>
                <tr>
                    <td class="property-name"><spring:message code="pdp.price"/></td>
                    <td><c:out value="${phone.price}"/>&nbsp<spring:message code="pdp.currency"/></td>
                </tr>
                <tr>
                    <td class="property-name"><spring:message code="pdp.description"/></td>
                    <td><c:out value="${phone.description}"/></td>
                </tr>
            </table>
        </div>
    </div>
</common:page>
