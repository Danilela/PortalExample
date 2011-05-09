<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="c" uri="c.tld" %>
<%--

<c:set var="xmlURL">/resources/static/xml/config.xml</c:set>

<c:import url="${xmlURL}" var="myConfigXML" />
<x:parse doc="${myConfigXML}" varDom="myConfig"  />
###
<x:out select="$myConfigXML/widget" />
####

 --%>
 
<h3>Books Info:</h3>
<c:import var="configInfo" url="https://github.com/entando/sharando/raw/master/contenttypes/CNG/config.xml"/>

<x:parse xml="${configInfo}" varDom="dom"/>

###
	poba1	<x:out select="$dom//*[name()='description'][2]" /> <br />
	poba2	<x:out select="$dom//*[name()='widget']/@version" /> <br />
	poba3	<x:out select="$dom//*[name()='sha:resource'][3]/@path" /> <br />	
###