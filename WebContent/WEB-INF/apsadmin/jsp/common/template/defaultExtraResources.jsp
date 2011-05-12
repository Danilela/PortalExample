<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wp" uri="aps-core.tld" %>
<%@ taglib uri="apsadmin-core.tld" prefix="wpsa" %>

<script type="text/javascript" src="<wp:resourceURL />administration/common/js/mootools-core-1.3-full-compat-yc.js"></script>
<script type="text/javascript" src="<wp:resourceURL />administration/common/js/mootools-more-1.3-full-compat-yc.js"></script>

<script type="text/javascript" src="<wp:resourceURL />administration/common/js/moo-japs/moo-jAPS-0.2.js"></script>

<script type="text/javascript">
<!--//--><![CDATA[//><!--
//menu
window.addEvent('domready', function(){
	var myAccordion = new Fx.Accordion($$('.accordion_toggler-menu'), $$('.accordion_element-menu'), {
		display: -1,
	<s:if test="#myClient == 'advanced'">		
		fixedHeight: 108,
	</s:if>	
		duration: 50,
	    alwaysHide: true
	});

<s:if test="#myClient == 'normal'">	
	var myAnchor_img = new Element('img', {
	    'src': '<wp:resourceURL/>administration/common/img/icons/header-usermenu-handler.png',
	    'class': 'myClass',
	    'style': 'vertical-align: middle',
	    'alt': '<s:text name="label.open" /> '
	});

	var myAnchor = new Element('a', {
	    'href': '#',
	    'class': 'noborder',
	    'title': '<s:text name="label.open" /> '	    
	});	

	$$('.accordion_toggler-menu').each(function(cToggler) {
		cToggler.appendText(' ');
		var poba_img = myAnchor_img.clone();
		var poba = myAnchor.clone();
		poba_img.injectBottom(poba);
		poba.injectBottom(cToggler);
	});
</s:if>	
});

//accordion
<s:if test="#myClient == 'normal'">	
window.addEvent('load', function(){
	var myAccordion = new Fx.Accordion($$('.accordion_toggler'), $$('.accordion_element'), {
	<s:if test="null != actionCode || null != #request.treeNodeActionMarkerCode">
		display: 0,
	</s:if>
	<s:else>
		display: -1,
	</s:else>
		duration: 50,
	    alwaysHide: true
	});

	var myAnchor_img = new Element('img', {
	    'src': '<wp:resourceURL/>administration/common/img/icons/header-usermenu-handler.png',
	    'class': 'myClass',
	    'style': 'vertical-align: middle',
	    'alt': '<s:text name="label.open" /> '
	});

	var myAnchor = new Element('a', {
	    'href': '#',
	    'class': 'noborder',
	    'title': '<s:text name="label.open" /> '	    
	});	

	$$('.accordion_toggler').each(function(cToggler) {
		cToggler.appendText(' ');
		var poba_img = myAnchor_img.clone();
		var poba = myAnchor.clone();
		poba_img.injectBottom(poba);
		poba.injectBottom(cToggler);
	});
});
</s:if>
<s:if test="#myClient == 'advanced'">
window.addEvent('domready', function(){

	var myAnchor = new Element('a', {
	    'href': '#',
	    'class': 'noborder toggle-closed',
	    'title': "<s:text name="label.open" /> ",
	    'html': '&#160;' 
	});

	$$('.accordion_toggler').each(function(cToggler) {
		cToggler.appendText(' ');
		var poba = myAnchor.clone();
		poba.addEvent("click",function(ev){ev.preventDefault();}); //prevent from un-wanted page scroll
		poba.injectBottom(cToggler);
	});

	var myAccordion = new Fx.Accordion($$('.accordion_toggler'), $$('.accordion_element'), {
	<s:if test="null != actionCode || null != #request.treeNodeActionMarkerCode">
		display: 0,
	</s:if>
	<s:else>
		display: -1,
	</s:else>
		duration: 50,
	    alwaysHide: true,
	    onActive: function(toggler, e){
    		this.addClass('toggle-open');
    		this.removeClass('toggle-closed');
		}.bind(myAnchor),
	    onBackground: function(toggler, e){
			this.removeClass('toggle-open');
			this.addClass('toggle-closed');
		}.bind(myAnchor)
	});

});

//sidebar
window.addEvent("domready",function(){
	new SlideCrab("menubar_content","menubar_anchor",{
			fxStartValues: {"opacity": 0, "width" : 260, "overflow": "hidden" }
		}); 
});

<%-- fonts //start--%>
window.addEvent("domready",function(){
	WebFontConfig = {
		custom: {
			families: ["Droid Sans", "Droid Sans Mono"],
			urls: [
				"<wp:resourceURL />administration/mint/css/font-droid-sans.css",
				"<wp:resourceURL />administration/mint/css/font-droid-sans-mono.css",
				]
		}
	};

	(function() {
		document.getElementsByTagName("html")[0].className += " wf-loading";
		var wf = document.createElement('script');
		wf.src = '<wp:resourceURL />administration/mint/js/webfont.js';
		wf.type = 'text/javascript';
		wf.async = 'true';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(wf, s);
		})();
});				
<%-- fonts //end --%>

</s:if>

window.addEvent('domready', function(){

	var menoo  = new Wood({
		menuToggler: "subMenuToggler",
		type: "menu",
		enableHistory: false,
		cookieName: '<wp:info key="systemParam" paramName="applicationBaseURL" />'
	});

});

window.addEvent('domready', function(){
	$$('.js_noscreen').each(function(delendum) {
		delendum.removeClass("js_noscreen");
		delendum.addClass("noscreen");
	});
});

//--><!]]></script>