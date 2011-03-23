<%@ taglib prefix="wp" uri="aps-core.tld" %>
<wp:contentNegotiation mimeType="application/xhtml+xml" charset="utf-8"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
 "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<wp:info key="currentLang" />">
<head>
	<title>
		Mobile @ jAPS Portal Example| <wp:currentPage param="title" />
	</title>

<link rel="stylesheet" type="text/css" href="<wp:cssURL />mobile/PortalExampleMobile.css" />
<link rel="stylesheet" type="text/css" href="<wp:cssURL />mobile/pagemodels/general.css" />

	<wp:outputHeadInfo type="CSS"> 
		<link rel="stylesheet" type="text/css" href="<wp:cssURL />mobile/<wp:printHeadInfo />" />
	</wp:outputHeadInfo> 

</head>
<body>

	<div id="header">
		<h1><wp:i18n key="MAIN_TITLE" /></h1>
	</div>
<div id="subheader">
	<div id="subheader1">
		<wp:show frame="0" />
	</div>
	<div id="subheader2">
		<wp:show frame="1" />
	</div>
</div>
	<div id="main">
		<wp:show frame="2" />
		<wp:show frame="3" />
		<wp:show frame="4" />
		<wp:show frame="5" />
		<wp:show frame="6" />
		<wp:show frame="7" />
	</div>
<jsp:include page="inc/footer.jsp" />
</body>
</html>
