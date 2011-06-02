<%@ taglib prefix="wp" uri="aps-core.tld" %>
<%@ taglib prefix="c" uri="c.tld" %>

<c:if test="${null != userFilterOptionsVar && !empty userFilterOptionsVar}">

<c:set var="hasUserFilterError" value="${false}" />
<c:forEach var="userFilterOptionVar" items="${userFilterOptionsVar}">
<c:if test="${null != userFilterOptionVar.formFieldErrors && !empty userFilterOptionVar.formFieldErrors}"><c:set var="hasUserFilterError" value="${true}" /></c:if>
</c:forEach>

<c:if test="${hasUserFilterError}">
	<h3><wp:i18n key="ERRORS" /></h3>
	<ul>
		<c:forEach var="userFilterOptionVar" items="${userFilterOptionsVar}">
			<c:if test="${null != userFilterOptionVar.formFieldErrors}">
			<c:forEach var="formFieldError" items="${userFilterOptionVar.formFieldErrors}">
			<li>
			<wp:i18n key="jacms_LIST_VIEWER_FIELD" />&#32;<em class="bolded"><c:out value="${formFieldError.value.attributeName}" /></em><c:if test="${formFieldError.value.rangeFieldType != null}">:&#32;<em class="bolded"><wp:i18n key="${formFieldError.value.rangeFieldType}" /></em></c:if>&#32;<wp:i18n key="${formFieldError.value.errorKey}" />
			</li>
			</c:forEach>
			</c:if>
		</c:forEach>
	</ul>
</c:if>
<c:set var="hasUserFilterError" value="${false}" />

<h3><wp:i18n key="SEARCH_FOR" />:</h3>
<%-- search form with user filters --%>
<form action="<wp:url />" method="post">
	<c:forEach var="userFilterOptionVar" items="${userFilterOptionsVar}">
		<c:set var="userFilterOptionVar" value="${userFilterOptionVar}" scope="request" />
		<c:choose>
			<c:when test="${!userFilterOptionVar.attributeFilter && (userFilterOptionVar.key == 'fulltext' || userFilterOptionVar.key == 'category')}">
				<div class="search_box"><c:import url="/WEB-INF/plugins/jacms/aps/jsp/showlets/inc/userFilter-module-${userFilterOptionVar.key}.jsp" /></div>
			</c:when>
			<c:when test="${userFilterOptionVar.attributeFilter}">
				<c:choose>
					<c:when test="${userFilterOptionVar.attribute.type == 'Monotext' || userFilterOptionVar.attribute.type == 'Text' || userFilterOptionVar.attribute.type == 'Longtext' || userFilterOptionVar.attribute.type == 'Hypertext'}">
						<div class="search_box"><c:import url="/WEB-INF/plugins/jacms/aps/jsp/showlets/inc/userFilter-module-entity-Text.jsp" /></div>
					</c:when>
					<c:when test="${userFilterOptionVar.attribute.type == 'Enumerator' }">
						<div class="search_box"><c:import url="/WEB-INF/plugins/jacms/aps/jsp/showlets/inc/userFilter-module-entity-Enumerator.jsp" /></div>
					</c:when>
					<c:when test="${userFilterOptionVar.attribute.type == 'Number'}">
						<div class="search_box"><c:import url="/WEB-INF/plugins/jacms/aps/jsp/showlets/inc/userFilter-module-entity-Number.jsp" /></div>
					</c:when>
					<c:when test="${userFilterOptionVar.attribute.type == 'Date'}">
						<div class="search_box"><c:import url="/WEB-INF/plugins/jacms/aps/jsp/showlets/inc/userFilter-module-entity-Date.jsp" /></div>
					</c:when>
					<c:when test="${userFilterOptionVar.attribute.type == 'Boolean' }">
						<div class="search_box"><c:import url="/WEB-INF/plugins/jacms/aps/jsp/showlets/inc/userFilter-module-entity-Boolean.jsp" /></div>
					</c:when>
					<c:when test="${userFilterOptionVar.attribute.type == 'CheckBox'}">
						<div class="search_box"><c:import url="/WEB-INF/plugins/jacms/aps/jsp/showlets/inc/userFilter-module-entity-CheckBox.jsp" /></div>
					</c:when>
					<c:when test="${userFilterOptionVar.attribute.type == 'ThreeState'}">
						<div class="search_box"><c:import url="/WEB-INF/plugins/jacms/aps/jsp/showlets/inc/userFilter-module-entity-ThreeState.jsp" /></div>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
	</c:forEach>
	<div class="search_box">
	<p>
		<input type="submit" value="<wp:i18n key="SEARCH" />" class="button" />
	</p>
	</div>
</form>
</c:if>