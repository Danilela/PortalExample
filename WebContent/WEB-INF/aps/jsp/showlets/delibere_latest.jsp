<%@ taglib prefix="jacms" uri="/WEB-INF/plugins/jacms/aps/tld/jacms-aps-core.tld" %>
<%@ taglib prefix="wp" uri="aps-core.tld" %>
<%@ taglib prefix="c" uri="c.tld" %>
<%
/*  
        Author: William Ghelfi <w.ghelfi@agiletec.it> - 2005/05/23
        Author: Eugenio Santoboni <e.santoboni@agiletec.it>
        
        Eroga in automatico gli ultimi 2 contenuti di tipo "DLB" (Delibera), ordinati 
        per "data" decrescente.
*/                  
%>
<wp:headInfo type="CSS" info="showlets/delibere_latest.css" />

<div class="delibere_latest">
<h2 class="title"><wp:i18n key="LATEST_DELIBERE" /></h2>

<jacms:contentList listName="contentList" contentType="DLB" >
	<jacms:contentListFilter key="Data" attributeFilter="true" order="DESC" />
</jacms:contentList>

<ul>
<c:if test="${contentList != null}">
	<c:forEach var="contentId" items="${contentList}" begin="0" end="2">
		<li><jacms:content contentId="${contentId}" modelId="31" /></li>
	</c:forEach>
</c:if>        
</ul>
</div>