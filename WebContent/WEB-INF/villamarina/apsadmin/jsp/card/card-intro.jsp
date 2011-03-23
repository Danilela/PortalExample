<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="aps-core.tld" prefix="wp" %>
<%@ taglib uri="apsadmin-core.tld" prefix="wpsa" %>
<%@ taglib uri="apsadmin-form.tld" prefix="wpsf" %>
<s:set var="targetNS" value="%{'/do/Card'}" />
<h1><s:text name="title.cardManagement" /><jsp:include page="/WEB-INF/apsadmin/jsp/common/inc/operations-context-general.jsp" /></h1>

<div id="main">
	<div class="intro CARD">
		<s:property value="%{getText('card.intro.html')}" escape="false"  />
	</div>
</div>