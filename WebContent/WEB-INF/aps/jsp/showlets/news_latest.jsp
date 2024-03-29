<%@ taglib prefix="jacms" uri="/WEB-INF/plugins/jacms/aps/tld/jacms-aps-core.tld" %>
<%@ taglib prefix="wp" uri="aps-core.tld" %>
<%@ taglib prefix="c" uri="c.tld" %>
<%
/*  
        Author: William Ghelfi <w.ghelfi@agiletec.it> - 2005/05/23
        Author: Eugenio Santoboni <e.santoboni@agiletec.it>
        
        Eroga in automatico gli ultimi 2 contenuti di tipo "NEW" (Notizia), ordinati 
        per "data" decrescente.
*/                  
%>

<wp:headInfo type="CSS" info="showlets/news_latest.css" />

<div class="news_latest">
<h2 class="title"><wp:i18n key="LATEST_NEW" /></h2>

<jacms:contentList listName="contentList" contentType="NEW" >
<jacms:contentListFilter key="Data" attributeFilter="true" order="DESC" />
</jacms:contentList>

<ul>
<c:if test="${contentList != null}">
        <c:forEach var="content" items="${contentList}" begin="0" end="3">
                <li><jacms:content contentId="${content}" modelId="21" /></li>
        </c:forEach>
</c:if>        
</ul>
<h3 class="archivio"><a href="<wp:url page="notizie" />" title="<wp:i18n key="VAI_PAGINA"/>:<wp:i18n key="NEWS_ARCHIVE"/>"><wp:i18n key="NEWS_ARCHIVE"/></a></h3>
</div>