<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="apsadmin-core.tld" prefix="wpsa" %>
<%@ taglib prefix="wp" uri="aps-core.tld" %>
<wp:ifauthorized permission="superuser">
	<li><a href="<s:url action="intro" namespace="/do/Card" />" tabindex="<wpsa:counter />">CARD</a></li>
</wp:ifauthorized>