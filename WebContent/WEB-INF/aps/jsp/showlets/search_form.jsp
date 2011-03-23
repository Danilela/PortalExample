<%@ taglib prefix="wp" uri="aps-core.tld" %>
<%@ taglib prefix="c" uri="c.tld" %>
<wp:headInfo type="CSS" info="showlets/search_form.css" />
<div class="search_form">
<form action="<wp:url page="search_result" />" >
	<p>
		<label for="search"><wp:i18n key="SEARCH" /></label>: <input type="text" name="search" id="search" class="text" value="" /> <input type="submit" value="Ok" class="button" />
	</p>
</form>
</div>
