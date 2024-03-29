<%@ taglib prefix="wp" uri="aps-core.tld" %>
<%@ taglib prefix="vmr" uri="/WEB-INF/villamarina/aps/tld/villamarina-core.tld" %>
<%@ taglib prefix="c" uri="c.tld" %>
<%@ taglib uri="fmt.tld" prefix="fmt" %>

<!-- TAG CARICATORE -->
<vmr:cards listName="cardList" />


<wp:headInfo type="CSS" info="showlets/card_list.css" />
<!-- INIZIO BLOCCO FORM DI RICERCA -->
<div class="card_list">
<form id="searchForm" method="get" action="<wp:url />">
	<fieldset><legend for="holder" class="text"><wp:i18n key="SEARCH_CARDS" /></legend>
	<div class="formPair">
	<label for="holder" class="text"><wp:i18n key="CARD_HOLDER" /></label>
		<input type="text" id="holder" name="holder" value="<c:out value="${holder}" />" />
		<input type="submit" class="button" value="<wp:i18n key="SEARCH" />" />	
	</div>
	</fieldset>
</form>  
</div>
<!-- FINE BLOCCO FORM DI RICERCA -->

<c:if test="${cardList != null}">
	
	<!-- TAG PAGINATORE -->
	<wp:pager listName="cardList" objectName="groupCard" pagerIdFromFrame="true" max="10" advanced="true" offset="5" >
	<c:set var="group" value="${groupCard}" scope="request" />
	
	<p class="centerText">
		<wp:i18n key="CARDS_NUMBER" /> : <c:out value="${groupCard.size}" /> - <wp:i18n key="LABEL_PAGE" />: [<c:out value="${groupCard.currItem}" />/<c:out value="${groupCard.maxItem}" />]
	</p>
	
	<!-- INIZIO BLOCCO EROGATORE -->
	<table class="generic" border="1" summary="<wp:i18n key="CARDS_LIST_SUMMARY" />">
	<tr>
		<th><wp:i18n key="CARD_HOLDER" /></th>
		<th><wp:i18n key="CARD_DESCRIPTION" /></th>
		<th><wp:i18n key="CARD_CREATION_DATE" /></th>
	</tr>
	<c:forEach var="card" items="${cardList}" begin="${groupCard.begin}" end="${groupCard.end}">
		<tr>
			<td><c:out value="${card.holder}" /></td>
			<td><c:out value="${card.descr}" /></td>
			<td><fmt:formatDate pattern="dd/MM/yyyy" value="${card.date}" /></td>
		</tr>
	</c:forEach>
	</table>
	<!-- FINE BLOCCO EROGATORE -->
	
	<c:import url="/WEB-INF/aps/jsp/showlets/inc/pagerBlock.jsp" />
	
	</wp:pager>
	
</c:if>