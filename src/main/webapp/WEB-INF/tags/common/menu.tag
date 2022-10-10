<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="row">
    <div class="col-4 offset-9">
        <sec:authorize access="isAuthenticated()">
            <form method=post action="<c:url value="/logout"/>">
                <span>
                    <spring:message code="menu.profile.greeting.label"/>
                    <b><sec:authentication property="name"/></b><spring:message code="menu.profile.user.label"/>
                </span>
                <input type="submit" class="btn btn-primary" value="<spring:message code="menu.logout.button.label"/>"/>
                <sec:csrfInput />
            </form>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
            <span>
                <spring:message code="menu.profile.greeting.label"/>
                <spring:message code="menu.profile.guest.label"/>
            </span>
            <a href="<c:url value="/login"/>">
                <button type="button" class="btn btn-primary"><spring:message code="menu.login.button.label"/></button>
            </a>
        </sec:authorize>
    </div>
    <sec:authorize access="hasRole('ADMIN')">
        <div class="col-4 offset-9">
            <a href="<c:url value="/admin"/>">
                <p><spring:message code="menu.admin.panel.link.label"/></p>
            </a>
        </div>
    </sec:authorize>
</div>