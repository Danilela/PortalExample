<%@ taglib prefix="wp" uri="aps-core.tld" %>
<%@ taglib prefix="c" uri="c.tld" %>
<wp:headInfo type="CSS" info="showlets/language_choose.css" />
<div class="language_choose">
<wp:info key="langs" var="langs" />
<wp:info key="currentLang" var="currentLang" />
<ul><c:forEach var="lang" items="${langs}">
	<c:choose>
		<c:when test="${currentLang == lang.code}"><li><c:out value="${lang.code}" /></li></c:when>
		<c:otherwise><li><a href="<wp:url lang="${lang.code}" paramRepeat="true" />" title="<c:out value="${lang.descr}" />"><c:out value="${lang.code}" /></a></li></c:otherwise>
	</c:choose>
</c:forEach></ul>
</div>