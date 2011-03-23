<%@ taglib prefix="wp" uri="aps-core.tld" %>
<%@ taglib prefix="c" uri="c.tld" %>
<%
/*
	Date: 2005/07/12  
	Author: William Ghelfi <w.ghelfi@agiletec.it> 
	Author: Eugenio Santoboni <e.santoboni@agiletec.it>
	
	Crea la barra di navigazione "a briciole di pane"
*/  		
%>
<wp:currentPage param="code" var="currentViewCode" />

<p><wp:i18n key="YOU_ARE_HERE" />:
	<c:set var="first" value="true" />
	<wp:nav spec="current.path" var="currentTarget">
		<c:set var="currentCode"><c:out value="${currentTarget.code}" /></c:set>
		<c:if test="${first != 'true'}"> &raquo; </c:if>
		<c:choose>
			<c:when test="${!currentTarget.voidPage}">
				<c:choose>
					<c:when test="${currentCode == currentViewCode}">
						<c:out value="${currentTarget.title}" />
					</c:when>
					<c:otherwise>
						<a href="<c:out value="${currentTarget.url}" />"><c:out value="${currentTarget.title}" /></a>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise><c:out value="${currentTarget.title}" /></c:otherwise>
		</c:choose>
		<c:set var="first" value="false" />
	</wp:nav>
</p>

