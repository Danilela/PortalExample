--
-- PostgreSQL database dump
--

-- Started on 2011-06-02 21:47:48 CEST

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 1823 (class 0 OID 1823033)
-- Dependencies: 1503
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO categories (catcode, parentcode, titles) VALUES ('home', 'home', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="it">Generale</property>
<property key="en">All</property>
</properties>

');
INSERT INTO categories (catcode, parentcode, titles) VALUES ('delibere', 'home', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Delibere</property>
<property key="it">Delibere</property>
</properties>

');
INSERT INTO categories (catcode, parentcode, titles) VALUES ('delibere_di_giunta', 'delibere', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Delibere di Giunta</property>
<property key="it">Delibere di Giunta</property>
</properties>

');
INSERT INTO categories (catcode, parentcode, titles) VALUES ('delibere_di_consiglio', 'delibere', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Delibere di Consiglio</property>
<property key="it">Delibere di Consiglio</property>
</properties>

');
INSERT INTO categories (catcode, parentcode, titles) VALUES ('scheda_download', 'home', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Scheda Download</property>
<property key="it">Scheda Download</property>
</properties>

');
INSERT INTO categories (catcode, parentcode, titles) VALUES ('moduli', 'scheda_download', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Modulistica</property>
<property key="it">Modulistica</property>
</properties>

');
INSERT INTO categories (catcode, parentcode, titles) VALUES ('autocertificazioni', 'scheda_download', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Autocertificazioni</property>
<property key="it">Autocertificazioni</property>
</properties>

');
INSERT INTO categories (catcode, parentcode, titles) VALUES ('anagrafe', 'moduli', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Anagrafe</property>
<property key="it">Anagrafe</property>
</properties>

');
INSERT INTO categories (catcode, parentcode, titles) VALUES ('tributi', 'moduli', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Tributi</property>
<property key="it">Tributi</property>
</properties>

');


--
-- TOC entry 1824 (class 0 OID 1823039)
-- Dependencies: 1504
-- Data for Name: contentmodels; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (2, 'NEW', 'Completo - default', '<h2>$content.Data.getFormattedDate("dd/MM/yyyy") &mdash; $content.Titolo.text</h2>

#if ( $content.CorpoTesto.text != "" )

$content.CorpoTesto.getTextBeforeImage(0)

#if ( $content.Immagine_1.imagePath("2") != "" )
<a href="$content.Immagine_1.imagePath("0")"><img src="$content.Immagine_1.imagePath("2")" alt="$content.Immagine_1.text" class="right" /></a>
#end 
$content.CorpoTesto.getTextAfterImage(0)
#end

#if ($content.Allegati && $content.Allegati.size() > 0)

<h3 class="clear">$i18n.getLabel(''ATTACHES'')</h3>
	<ul>
		#foreach ($attach in $content.Allegati)
		<li><a href="$attach.attachPath">$attach.text</a></li>
		#end	
	</ul>
#end

#if ($content.Riferimenti && $content.Riferimenti.size() > 0)

<h3 class="clear">$i18n.getLabel(''LINKS'')</h3>
	<ul>
		#foreach ($link in $content.Riferimenti)
		<li><a href="$link.destination">$link.text</a></li>
		#end	
	</ul>
#end', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (21, 'NEW', 'per Liste', '<h3><a href="$content.contentLink">$content.Data.getFormattedDate("dd/MM/yyyy") &mdash; $content.Titolo.text</a></h3>
#if ($content.Lancio.text != "")
<p>$content.Lancio.text</p>
#end', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (31, 'DLB', 'per Liste', '<h3><a href="$content.contentLink">$content.Numero.value &mdash; $content.Data.getFormattedDate("dd/MM/yyyy")</a></h3>
<p>$content.Oggetto.text</p>', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (51, 'SDL', 'per Liste', '<h3><a href="$content.contentLink">$content.Oggetto.text</a></h3>
$content.DescrizioneBreve.text', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (41, 'BND', 'per Liste', '<h3><a href="$content.contentLink">$content.Oggetto.text</a></h3>
<p>$content.DataInizio.getFormattedDate("dd/MM/yyyy") &mdash; $content.DataFine.getFormattedDate("dd/MM/yyyy")</p>', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (1, 'CNG', 'Completo - default', '<h2>$content.Titolo.text</h2>
#if ( $content.CorpoTesto.text != "" )
$content.CorpoTesto.getTextBeforeImage(0)
#if ( $content.Immagine_1.imagePath("2") != "" )
<a href="$content.Immagine_1.imagePath("0")"><img src="$content.Immagine_1.imagePath("2")" alt="$content.Immagine_1.text" class="right" /></a>
#end 
$content.CorpoTesto.getTextByRange(0,60)
#if ( $content.Immagine_2.imagePath("3") != "" )
<a href="$content.Immagine_2.imagePath("0")"><img src="$content.Immagine_2.imagePath("3")" alt="$content.Immagine_2.text" class="left" /></a>
#end
$content.CorpoTesto.getTextAfterImage(60)
#end
#if ($content.Allegati && $content.Allegati.size() > 0)
<h3 class="clear">$i18n.getLabel(''ATTACHES'')</h3>
	<ul>
		#foreach ($attach in $content.Allegati)
		<li><a href="$attach.attachPath">$attach.text</a></li>
		#end	
	</ul>
#end
#if ($content.Riferimenti && $content.Riferimenti.size() > 0)
<h3 class="clear">$i18n.getLabel(''LINKS'')</h3>
	<ul>
		#foreach ($link in $content.Riferimenti)
		<li><a href="$link.destination">$link.text</a></li>
		#end	
	</ul>
#end', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (11, 'CNG', 'per Liste', '<h3><a href="$content.contentLink">$content.Titolo.text</a></h3>
#if ($content.Abstract.text != "")
<p>$content.Abstract.text</p>
#end', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (3, 'DLB', 'Completo - default', '<h2>$content.Numero.value &mdash; $content.Data.getFormattedDate("dd/MM/yyyy")<br />
$content.Oggetto.text</h2>
#if ($content.Abstract.text != "")
$content.Abstract.text
#end
#if ($content.Allegati && $content.Allegati.size() > 0)
<h3 class="clear">$i18n.getLabel(''ATTACHES'')</h3>
	<ul>
		#foreach ($attach in $content.Allegati)
		<li><a href="$attach.attachPath">$attach.text</a></li>
		#end	
	</ul>
#end', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (4, 'BND', 'Completo - default', '<h2>$content.Oggetto.text<br />
$content.DataInizio.getFormattedDate("dd/MM/yyyy") &mdash; $content.DataFine.getFormattedDate("dd/MM/yyyy")</h2>
#if ($content.Abstract.text != "")
$content.Abstract.text
#end
#if ($content.Allegati && $content.Allegati.size() > 0)
<h3 class="clear">$i18n.getLabel(''ATTACHES'')</h3>
	<ul>
		#foreach ($attach in $content.Allegati)
		<li><a href="$attach.attachPath">$attach.text</a></li>
		#end	
	</ul>
#end', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (5, 'SDL', 'Completo - default', '<div class="scheda_download">
<h2><a href="$content.File.attachPath" title="$i18n.getLabel(''DOWNLOAD_THIS'')">$content.Oggetto.text</a></h2>
#if($content.categories.size() >= 1)
#set ($first = "true")
<p><span class="important">$i18n.getLabel(''CATEGORIES''):</span>
#foreach($categ in $content.categories)
#if ($first == "false") | #end
$categ.title
#set ($first = "false")
#end
</p>
#end
#if ( $content.DescrizioneLunga.text != "" )
$content.DescrizioneLunga.getTextBeforeImage(0)
#if ( $content.Immagine.imagePath("2") != "" )
<img src="$content.Immagine.imagePath("2")" alt="$content.Immagine.text" class="left" />
#end
$content.DescrizioneLunga.getTextAfterImage(0)
#end
#if ($content.Riferimenti && $content.Riferimenti.size() > 0)
<h3 class="clear">$i18n.getLabel(''LINKS'')</h3>
<ul>#foreach ($link in $content.Riferimenti)
<li><a href="$link.destination">$link.text</a></li>
#end</ul>
#end
</div>', 'contentmodels/scheda_download.css');
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (12, 'CNG', 'in Evidenza', '<div class="inEvidenza">
<h2 class="title"><a href="$content.contentLink">$content.Titolo.text</a></h2>
#if ($content.Abstract.text != "")
<p>#if ( $content.Immagine_1.imagePath("2") != "" )
<a href="$content.Immagine_1.imagePath("0")"><img src="$content.Immagine_1.imagePath("2")" alt="$content.Immagine_1.text" class="left" /></a>
#end 
$content.Abstract.text</p>
#end
</div>', 'contentmodels/generic.css');
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (22, 'NEW', 'per Mobile - per Liste', '<h3><a href="mobile_contentview.wp?contentId=$content.id&amp;modelId=23">$content.Data.getFormattedDate("dd/MM/yyyy") &mdash; $content.Titolo.text</a></h3>
#if ($content.Lancio.text != "")
<p>$content.Lancio.text</p>
#end', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (32, 'DLB', 'per Mobile - per Liste', '<h3><a href="mobile_contentview.wp?contentId=$content.id&amp;modelId=3">$content.Numero.value &mdash; $content.Data.getFormattedDate("dd/MM/yyyy")</a></h3>
#if ($content.Oggetto.text != "")
<p>$content.Oggetto.text</p>
#end', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (13, 'CNG', 'per Mobile - Completo', '<h2>$content.Titolo.text</h2>
#if ( $content.CorpoTesto.text != "" )
$content.CorpoTesto.text
#end
#if ($content.Allegati && $content.Allegati.size() > 0)
<h3 class="clear">$i18n.getLabel(''ATTACHES'')</h3>
	<ul>
		#foreach ($attach in $content.Allegati)
		<li><a href="$attach.attachPath">$attach.text</a></li>
		#end	
	</ul>
#end', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (23, 'NEW', 'per Mobile - Completo', '<h2>$content.Data.getFormattedDate("dd/MM/yyyy") &mdash; $content.Titolo.text</h2>
#if ( $content.CorpoTesto.text != "" )
$content.CorpoTesto.text
#end
#if ($content.Allegati && $content.Allegati.size() > 0)
<h3 class="clear">$i18n.getLabel(''ATTACHES'')</h3>
	<ul>
		#foreach ($attach in $content.Allegati)
		<li><a href="$attach.attachPath">$attach.text</a></li>
		#end	
	</ul>
#end
', NULL);
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (14, 'CNG', 'per Mobile - per Home', '<div class="mobileInEvidenza">

#if ( $content.Immagine_1.imagePath("1") != "" )

<img src="$content.Immagine_1.imagePath("1")" alt="$content.Immagine_1.text" class="left" />

#end

<h2>$content.Titolo.text</h2>

#if ($content.CorpoTesto.text != "")

<p>$content.CorpoTesto.text</p>

#end

</div>', 'mobile/contentmodels/generic.css');
INSERT INTO contentmodels (modelid, contenttype, descr, model, stylesheet) VALUES (42, 'BND', 'per Mobile - per Liste', '<h3><a href="mobile_contentview.wp?contentId=$content.id&amp;modelId=4">$content.DataInizio.getFormattedDate("dd/MM/yyyy") &mdash; $content.DataFine.getFormattedDate("dd/MM/yyyy") &mdash; $content.Oggetto.text</a></h3>
', NULL);


--
-- TOC entry 1825 (class 0 OID 1823045)
-- Dependencies: 1505
-- Data for Name: contentrelations; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('NEW177', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('NEW177', NULL, 'CNG51', NULL, NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('NEW3', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('NEW3', NULL, NULL, '26', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('NEW3', NULL, NULL, '26', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('NEW27', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('NEW23', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('NEW23', NULL, NULL, '24', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('NEW23', NULL, NULL, '24', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('NEW23', NULL, NULL, '25', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('NEW23', NULL, NULL, '25', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB4', NULL, NULL, NULL, 'delibere', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB4', NULL, NULL, NULL, 'delibere_di_giunta', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB4', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB4', NULL, NULL, '31', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB4', NULL, NULL, '31', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB30', NULL, NULL, NULL, 'delibere', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB30', NULL, NULL, NULL, 'delibere_di_consiglio', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB30', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB30', NULL, NULL, '34', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB30', NULL, NULL, '34', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB32', NULL, NULL, NULL, 'scheda_download', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB32', NULL, NULL, NULL, 'delibere', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB32', NULL, NULL, NULL, 'moduli', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB32', NULL, NULL, NULL, 'delibere_di_giunta', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB32', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB32', NULL, NULL, '33', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB32', NULL, NULL, '33', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB36', NULL, NULL, NULL, 'delibere', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB36', NULL, NULL, NULL, 'delibere_di_consiglio', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB36', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB36', NULL, NULL, '35', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('DLB36', NULL, NULL, '35', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG173', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG173', NULL, NULL, '174', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG256', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG54', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG55', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG53', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG29', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG28', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG17', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG18', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG19', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG49', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG14', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG11', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG12', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG13', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG2', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG2', NULL, NULL, '10', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG2', NULL, NULL, '10', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG20', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG20', NULL, NULL, '21', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG20', NULL, NULL, '21', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG20', NULL, NULL, '22', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG20', NULL, NULL, '22', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG16', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG15', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG15', 'old_town_traffic_pass_int', NULL, NULL, NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG15', 'old_town_traffic_pass_int', NULL, NULL, NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG145', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG145', NULL, NULL, '144', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG51', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG51', 'mobile_home', NULL, NULL, NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG51', 'mobile_home', NULL, NULL, NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG51', NULL, NULL, '143', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG146', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('CNG148', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('BND39', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('BND39', NULL, NULL, '38', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('BND39', NULL, NULL, '38', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('BND48', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('BND48', NULL, NULL, '47', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('BND48', NULL, NULL, '47', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('BND5', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('BND5', NULL, NULL, '37', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('BND5', NULL, NULL, '37', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL42', NULL, NULL, NULL, 'scheda_download', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL42', NULL, NULL, NULL, 'anagrafe', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL42', NULL, NULL, NULL, 'moduli', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL42', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL42', NULL, NULL, '41', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL42', NULL, NULL, '41', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL44', NULL, NULL, NULL, 'scheda_download', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL44', NULL, NULL, NULL, 'autocertificazioni', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL44', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL44', NULL, NULL, '43', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL44', NULL, NULL, '43', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL7', NULL, NULL, NULL, 'scheda_download', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL7', NULL, NULL, NULL, 'autocertificazioni', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL7', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL7', NULL, NULL, '40', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL7', NULL, NULL, '40', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL46', NULL, NULL, NULL, 'scheda_download', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL46', NULL, NULL, NULL, 'tributi', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL46', NULL, NULL, NULL, 'moduli', NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL46', NULL, NULL, NULL, NULL, 'free');
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL46', NULL, NULL, '45', NULL, NULL);
INSERT INTO contentrelations (contentid, refpage, refcontent, refresource, refcategory, refgroup) VALUES ('SDL46', NULL, NULL, '45', NULL, NULL);


--
-- TOC entry 1826 (class 0 OID 1823048)
-- Dependencies: 1506
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG54', 'CNG', 'Intro Delibere Mobile', 'DRAFT', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG54" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Delibere Mobile</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Delibere</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione puoi trovare la lista delle delibere.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', '20091015101844', '20091015101844', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG54" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Delibere Mobile</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Delibere</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione puoi trovare la lista delle delibere.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG55', 'CNG', 'Intro Bandi Mobile', 'DRAFT', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG55" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Bandi Mobile</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Bandi</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione puoi trovare la lista dei Bandi.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', '20091015102100', '20091015102100', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG55" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Bandi Mobile</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Bandi</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione puoi trovare la lista dei Bandi.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG53', 'CNG', 'Intro Notizie Mobile', 'DRAFT', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG53" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Notizie Mobile</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Notizie</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione puoi trovare la lista delle notizie.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', '20091015101654', '20091015102119', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG53" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Notizie Mobile</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Notizie</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione puoi trovare la lista delle notizie.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG29', 'CNG', 'Intro delibere di Consiglio', 'DRAFT', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG29" typecode="CNG" typedescr="Contenuto generico"><descr>Intro delibere di Consiglio</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Elenco delle Delibere di Consiglio presenti nel portale del Comune</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext" /><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', '20090721192226', '20090721192226', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG29" typecode="CNG" typedescr="Contenuto generico"><descr>Intro delibere di Consiglio</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Elenco delle Delibere di Consiglio presenti nel portale del Comune</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext" /><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG28', 'CNG', 'Intro delibere di Giunta', 'DRAFT', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG28" typecode="CNG" typedescr="Contenuto generico"><descr>Intro delibere di Giunta</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Elenco delle Delibere di Giunta presenti nel portale del Comune</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext" /><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', '20090721191954', '20090721191954', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG28" typecode="CNG" typedescr="Contenuto generico"><descr>Intro delibere di Giunta</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Elenco delle Delibere di Giunta presenti nel portale del Comune</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext" /><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG17', 'CNG', 'Il Sindaco', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG17" typecode="CNG" typedescr="Contenuto generico"><descr>Il Sindaco</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Sindaco</text><text lang="en">Mayor</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Il Sindaco è eletto direttamente dai cittadini ed è membro del Consiglio Comunale. È capo dell’amministrazione, ha la rappresentanza legale dell’ente ed è, nel contempo, Ufficiale di Governo per i servizi di competenza statale.</text><text lang="en">Mayor is a modern title used in many countries for the highest ranking officer in a municipal government.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Il <strong>Sindaco</strong> &egrave; eletto direttamente dai cittadini ed &egrave; membro del <strong>Consiglio Comunale</strong>. &Egrave; capo dell&rsquo;amministrazione, ha la rappresentanza legale dell&rsquo;ente ed &egrave;, nel contempo, Ufficiale di Governo per i servizi di competenza statale.</p>
<p>Nomina gli <strong>Assessori</strong>, convoca e presiede la <strong>Giunta comunale</strong>, assicurandone unit&agrave; di indirizzo; sovrintende al funzionamento degli uffici e dei servizi.</p>
<p>Al Sindaco competono la nomina del segretario generale, del direttore generale e dei direttori di settore.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p><strong>Mayor</strong> is a modern title used in many countries for the highest ranking officer in a municipal government.</p>
<p>The mayor is an elected politician who serves as chief executive officer and/or ceremonial official of Villamarina municipalities. </p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', '20090721112111', '20100104115812', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG17" typecode="CNG" typedescr="Contenuto generico"><descr>Il Sindaco</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Sindaco</text><text lang="en">Mayor</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Il Sindaco è eletto direttamente dai cittadini ed è membro del Consiglio Comunale. È capo dell’amministrazione, ha la rappresentanza legale dell’ente ed è, nel contempo, Ufficiale di Governo per i servizi di competenza statale.</text><text lang="en">Mayor is a modern title used in many countries for the highest ranking officer in a municipal government.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Il <strong>Sindaco</strong> &egrave; eletto direttamente dai cittadini ed &egrave; membro del <strong>Consiglio Comunale</strong>. &Egrave; capo dell&rsquo;amministrazione, ha la rappresentanza legale dell&rsquo;ente ed &egrave;, nel contempo, Ufficiale di Governo per i servizi di competenza statale.</p>
<p>Nomina gli <strong>Assessori</strong>, convoca e presiede la <strong>Giunta comunale</strong>, assicurandone unit&agrave; di indirizzo; sovrintende al funzionamento degli uffici e dei servizi.</p>
<p>Al Sindaco competono la nomina del segretario generale, del direttore generale e dei direttori di settore.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p><strong>Mayor</strong> is a modern title used in many countries for the highest ranking officer in a municipal government.</p>
<p>The mayor is an elected politician who serves as chief executive officer and/or ceremonial official of Villamarina municipalities. </p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG18', 'CNG', 'Giunta Comunale', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG18" typecode="CNG" typedescr="Contenuto generico"><descr>Giunta Comunale</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Giunta Comunale</text><text lang="en">Council</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">La Giunta del Comune è l''organo esecutivo composto dal Sindaco, che ne è anche presidente, e da un numero di assessori, stabilito dallo statuto comunale, che non deve essere superiore a un terzo (arrotondato) del numero dei consiglieri comunali (computando a tale fine anche il sindaco) e comunque non superiore a sedici (art. 47 del d. lgs. 267/2000).</text><text lang="en">A Council is a type of committee that is usually intended to lead or govern. Councils often serve several different functions.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>La <strong>Giunta comunale</strong> &egrave; l''organo esecutivo composto dal Sindaco, che ne &egrave; anche presidente, e da un numero di assessori, stabilito dallo statuto comunale, che non deve essere superiore a un terzo (arrotondato) del numero dei consiglieri comunali (computando a tale fine anche il sindaco) e comunque non superiore a sedici (art. 47 del d. lgs. 267/2000).</p>
<p>La Giunta comunale &egrave; responsabile dell&rsquo;<strong>attuazione delle linee programmatiche e degli indirizzi generali</strong> definiti nel piano di mandato, ossia nel documento con cui il Sindaco, all&rsquo;inizio del suo incarico quinquennale, presenta al Consiglio le linee programmatiche relative alle azioni e ai progetti da realizzare.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>A <strong>Council</strong> is a type of committee that is usually intended to lead or govern. Councils often serve several different functions.</p>
<p>A municipality is often referred to as simply the Council without any further attempt by the speaker at making a size or scale designation, as in Council house. It is assumed the listener will already know the specific meaning of the word without further guidance.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', '20090721113802', '20100104120443', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG18" typecode="CNG" typedescr="Contenuto generico"><descr>Giunta Comunale</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Giunta Comunale</text><text lang="en">Council</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">La Giunta del Comune è l''organo esecutivo composto dal Sindaco, che ne è anche presidente, e da un numero di assessori, stabilito dallo statuto comunale, che non deve essere superiore a un terzo (arrotondato) del numero dei consiglieri comunali (computando a tale fine anche il sindaco) e comunque non superiore a sedici (art. 47 del d. lgs. 267/2000).</text><text lang="en">A Council is a type of committee that is usually intended to lead or govern. Councils often serve several different functions.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>La <strong>Giunta comunale</strong> &egrave; l''organo esecutivo composto dal Sindaco, che ne &egrave; anche presidente, e da un numero di assessori, stabilito dallo statuto comunale, che non deve essere superiore a un terzo (arrotondato) del numero dei consiglieri comunali (computando a tale fine anche il sindaco) e comunque non superiore a sedici (art. 47 del d. lgs. 267/2000).</p>
<p>La Giunta comunale &egrave; responsabile dell&rsquo;<strong>attuazione delle linee programmatiche e degli indirizzi generali</strong> definiti nel piano di mandato, ossia nel documento con cui il Sindaco, all&rsquo;inizio del suo incarico quinquennale, presenta al Consiglio le linee programmatiche relative alle azioni e ai progetti da realizzare.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>A <strong>Council</strong> is a type of committee that is usually intended to lead or govern. Councils often serve several different functions.</p>
<p>A municipality is often referred to as simply the Council without any further attempt by the speaker at making a size or scale designation, as in Council house. It is assumed the listener will already know the specific meaning of the word without further guidance.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG19', 'CNG', 'Consiglio Comunale', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG19" typecode="CNG" typedescr="Contenuto generico"><descr>Consiglio Comunale</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Consiglio Comunale</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Il Consiglio Comunale, secondo il D.Lgs. 267/2000 (Testo unico delle leggi sull''ordinamento degli enti locali) è l''assemblea pubblica rappresentativa di ogni Comune, ente locale previsto dall''art. 114 della Costituzione della Repubblica Italiana.</text><text lang="en">A Municipal Council is the local government of Villamarina municipality.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Il <strong>Consiglio Comunale</strong>, secondo il D.Lgs. 267/2000 (Testo unico delle leggi sull''ordinamento degli enti locali) &egrave; l''assemblea pubblica rappresentativa di ogni Comune, ente locale previsto dall''art. 114 della <strong>Costituzione della Repubblica Italiana</strong>.</p>
<p>Il Consiglio Comunale &egrave; composto dal Sindaco e da un numero variabile di consiglieri, in funzione del numero di abitanti del Comune.</p>
<p>Il Consiglio comunale viene eletto direttamente dai <strong>cittadini</strong>, contestualmente all&rsquo;elezione del Sindaco, e resta in carica <strong>cinque anni</strong>.</p>
<p>Il Consiglio Comunale &egrave; organo di indirizzo e di controllo <strong>politico-amministrativo</strong> del comune. La sua competenza si limita ad atti fondamentali indicati dalla legge: Statuto dell''ente e delle aziende speciali, programmi, piani finanziari, bilanci, conti consuntivi, convenzioni tra enti locali, costituzione di forme associative, etc.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>A <strong>Municipal Council</strong> is the local government of Villamarina municipality. Specifically the term can refer to the institutions of various countries that can be translated by this term.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', '20090721120259', '20100104120649', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG19" typecode="CNG" typedescr="Contenuto generico"><descr>Consiglio Comunale</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Consiglio Comunale</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Il Consiglio Comunale, secondo il D.Lgs. 267/2000 (Testo unico delle leggi sull''ordinamento degli enti locali) è l''assemblea pubblica rappresentativa di ogni Comune, ente locale previsto dall''art. 114 della Costituzione della Repubblica Italiana.</text><text lang="en">A Municipal Council is the local government of Villamarina municipality.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Il <strong>Consiglio Comunale</strong>, secondo il D.Lgs. 267/2000 (Testo unico delle leggi sull''ordinamento degli enti locali) &egrave; l''assemblea pubblica rappresentativa di ogni Comune, ente locale previsto dall''art. 114 della <strong>Costituzione della Repubblica Italiana</strong>.</p>
<p>Il Consiglio Comunale &egrave; composto dal Sindaco e da un numero variabile di consiglieri, in funzione del numero di abitanti del Comune.</p>
<p>Il Consiglio comunale viene eletto direttamente dai <strong>cittadini</strong>, contestualmente all&rsquo;elezione del Sindaco, e resta in carica <strong>cinque anni</strong>.</p>
<p>Il Consiglio Comunale &egrave; organo di indirizzo e di controllo <strong>politico-amministrativo</strong> del comune. La sua competenza si limita ad atti fondamentali indicati dalla legge: Statuto dell''ente e delle aziende speciali, programmi, piani finanziari, bilanci, conti consuntivi, convenzioni tra enti locali, costituzione di forme associative, etc.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>A <strong>Municipal Council</strong> is the local government of Villamarina municipality. Specifically the term can refer to the institutions of various countries that can be translated by this term.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG49', 'CNG', 'URP - Ufficio Relazioni con il Pubblico', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG49" typecode="CNG" typedescr="Contenuto generico"><descr>URP - Ufficio Relazioni con il Pubblico</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">URP - Ufficio Relazioni con il Pubblico</text><text lang="en">Public Relations Office</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p><strong>Sede</strong>: Palazzo Municipale - Via Villamarina, 1, Villamarina</p>
<p><strong>Telefono</strong> 000.000.000 (numero verde)</p>
<p><strong>Fax</strong>  	00.0000.000</p>
<p><strong>E-mail</strong>  	urp@villamarina.it <br />
&nbsp;</p>
<p><strong>Orario di ricevimento</strong></p>
<p>dal luned&igrave; al venerd&igrave;: dalle 9.00 alle 12.30<br />
marted&igrave; e mercoled&igrave;: dalle 16.00 alle 17.00</p>]]></hypertext><hypertext lang="en"><![CDATA[<p><strong>Location</strong>: Palazzo Municipale - Via Villamarina, 1, Villamarina</p>
<p><strong>Phone</strong>: 000.000.000 </p>
<p><strong>Fax:</strong> 00.0000.000</p>
<p><strong>E-mail</strong> urp@villamarina.it</p>
<p><strong>Opening hours</strong></p>
<p>From Monday to Friday: from 9.00 a.m. to 12.30 a.m.<br />
From Tuesday to Wednesday: from 16.00 p.m. to 17.00 p.m.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', '20090722171212', '20100104122227', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG49" typecode="CNG" typedescr="Contenuto generico"><descr>URP - Ufficio Relazioni con il Pubblico</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">URP - Ufficio Relazioni con il Pubblico</text><text lang="en">Public Relations Office</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p><strong>Sede</strong>: Palazzo Municipale - Via Villamarina, 1, Villamarina</p>
<p><strong>Telefono</strong> 000.000.000 (numero verde)</p>
<p><strong>Fax</strong>  	00.0000.000</p>
<p><strong>E-mail</strong>  	urp@villamarina.it <br />
&nbsp;</p>
<p><strong>Orario di ricevimento</strong></p>
<p>dal luned&igrave; al venerd&igrave;: dalle 9.00 alle 12.30<br />
marted&igrave; e mercoled&igrave;: dalle 16.00 alle 17.00</p>]]></hypertext><hypertext lang="en"><![CDATA[<p><strong>Location</strong>: Palazzo Municipale - Via Villamarina, 1, Villamarina</p>
<p><strong>Phone</strong>: 000.000.000 </p>
<p><strong>Fax:</strong> 00.0000.000</p>
<p><strong>E-mail</strong> urp@villamarina.it</p>
<p><strong>Opening hours</strong></p>
<p>From Monday to Friday: from 9.00 a.m. to 12.30 a.m.<br />
From Tuesday to Wednesday: from 16.00 p.m. to 17.00 p.m.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG14', 'CNG', 'Intro Download', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG14" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Download</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Archivio Modulistica</text><text lang="en">Documents Archive</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">In questa sono disponibili per il download i moduli predisposti per i diversi aspetti del rapporto tra il Cittadino ed il Comune.</text><text lang="en">In this section are available for download the documents provided for the relationship between Citizens and Municipality.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sono disponibili per il download i moduli predisposti per i diversi aspetti del rapporto tra il Cittadino ed il Comune.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>In this section are available for download the documents provided for the relationship between Citizens and Municipality.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', '20090703113633', '20100104125122', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG14" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Download</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Archivio Modulistica</text><text lang="en">Documents Archive</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">In questa sono disponibili per il download i moduli predisposti per i diversi aspetti del rapporto tra il Cittadino ed il Comune.</text><text lang="en">In this section are available for download the documents provided for the relationship between Citizens and Municipality.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sono disponibili per il download i moduli predisposti per i diversi aspetti del rapporto tra il Cittadino ed il Comune.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>In this section are available for download the documents provided for the relationship between Citizens and Municipality.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG11', 'CNG', 'Intro Bandi', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG11" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Bandi</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Archivio Bandi</text><text lang="en">Announcements Archive</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">In questa sezione sono pubblicati i bandi, ordinati in base alla data di scadenza.</text><text lang="en">In this section are available Announcements of Villamarina Municipality, sorted by date.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione sono pubblicati i bandi del Comune di Villamarina, ordinati in base alla data di scadenza.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>In this section are available<strong> Announcements</strong> of Villamarina Municipality, sorted by expiry date.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', '20090703112842', '20100104125203', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG11" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Bandi</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Archivio Bandi</text><text lang="en">Announcements Archive</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">In questa sezione sono pubblicati i bandi, ordinati in base alla data di scadenza.</text><text lang="en">In this section are available Announcements of Villamarina Municipality, sorted by date.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione sono pubblicati i bandi del Comune di Villamarina, ordinati in base alla data di scadenza.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>In this section are available<strong> Announcements</strong> of Villamarina Municipality, sorted by expiry date.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG12', 'CNG', 'Intro Notizie', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG12" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Notizie</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Archivio Notizie</text><text lang="en">News Archive</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">In questa sezione sono pubblicate le notizie sul Comune di Villamarina, ordinate in base alla data di pubblicazione.</text><text lang="en">In this section are available News about Villamarina Municipality, sorted by publication date.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione&nbsp; sono pubblicate le notizie del <strong>Comune di Villamarina</strong>, ordinate in base alla data di pubblicazione.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>In this section are&nbsp;available <strong>News</strong> about Villamarina Municipality, sorted by publication date.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', '20090703113055', '20100104125229', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG12" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Notizie</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Archivio Notizie</text><text lang="en">News Archive</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">In questa sezione sono pubblicate le notizie sul Comune di Villamarina, ordinate in base alla data di pubblicazione.</text><text lang="en">In this section are available News about Villamarina Municipality, sorted by publication date.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione&nbsp; sono pubblicate le notizie del <strong>Comune di Villamarina</strong>, ordinate in base alla data di pubblicazione.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>In this section are&nbsp;available <strong>News</strong> about Villamarina Municipality, sorted by publication date.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG13', 'CNG', 'Intro Delibere', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG13" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Delibere</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Archivio Delibere</text><text lang="en">Decisions Archive</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">In questa sezione sono pubblicate le delibere di Giunta e di Consiglio, ordinate in base alla data di pubblicazione.</text><text lang="en">In this section are available the Council decisions, sorted by publication date.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione sono pubblicate le delibere di Giunta e di Consiglio, ordinate in base alla data di pubblicazione.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>In this section are available the <strong>Council decisions</strong>, sorted by publication date.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', '20090703113229', '20100104125252', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG13" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Delibere</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Archivio Delibere</text><text lang="en">Decisions Archive</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">In questa sezione sono pubblicate le delibere di Giunta e di Consiglio, ordinate in base alla data di pubblicazione.</text><text lang="en">In this section are available the Council decisions, sorted by publication date.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>In questa sezione sono pubblicate le delibere di Giunta e di Consiglio, ordinate in base alla data di pubblicazione.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>In this section are available the <strong>Council decisions</strong>, sorted by publication date.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG2', 'CNG', 'Lorem Ipsum dolor sit amet', 'DRAFT', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG2" typecode="CNG" typedescr="Contenuto generico"><descr>Lorem Ipsum dolor sit amet</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Lorem Ipsum dolor sit amet</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec est eu mi dignissim posuere.Sed venenatis sapien sed purus.Sed consequat, dolor sit amet porta interdum, leo nulla mollis nulla, quis congue sapien massa sed risus. Sed consequat, dolor sit amet porta interdum, leo nulla mollis nulla, quis congue sapien massa sed risus. Aliquam convallis quam eget turpis.Donec aliquet lacus eget libero.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec est eu mi dignissim posuere. Duis augue. Fusce in justo sit amet urna egestas rutrum. Phasellus non turpis quis tortor gravida rutrum.</p>
<p>Sed consequat, dolor sit amet porta interdum, leo nulla mollis nulla, quis congue sapien massa sed risus. Aliquam convallis quam eget turpis.Donec aliquet lacus eget libero. Suspendisse nisi odio, luctus eget, pretium quis, placerat a, urna. Ut sed nulla non ante cursus convallis.</p>
<p>Sed venenatis sapien sed purus. Maecenas felis massa, porta sed, semper sed, lobortis luctus, erat. Aliquam nec nunc sit amet diam pulvinar mattis. In at turpis eget dolor volutpat rutrum. Donec aliquet lacus eget libero. Suspendisse nisi odio, luctus eget, pretium quis, placerat a, urna. Ut sed nulla non ante cursus convallis.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="10" lang="it" /><resource resourcetype="Image" id="10" lang="en" /><text lang="it">prova</text><text lang="en">prova</text></attribute><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link"><attribute name="Riferimenti" attributetype="Link"><link type="external"><urldest>http://www.google.com/</urldest></link><text lang="it">Google</text><text lang="en">Google</text></attribute></list><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', '20090219102647', '20100201154934', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG2" typecode="CNG" typedescr="Contenuto generico"><descr>Lorem Ipsum dolor sit amet</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Lorem Ipsum dolor sit amet</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec est eu mi dignissim posuere.Sed venenatis sapien sed purus.Sed consequat, dolor sit amet porta interdum, leo nulla mollis nulla, quis congue sapien massa sed risus. Sed consequat, dolor sit amet porta interdum, leo nulla mollis nulla, quis congue sapien massa sed risus. Aliquam convallis quam eget turpis.Donec aliquet lacus eget libero.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nec est eu mi dignissim posuere. Duis augue. Fusce in justo sit amet urna egestas rutrum. Phasellus non turpis quis tortor gravida rutrum.</p>
<p>Sed consequat, dolor sit amet porta interdum, leo nulla mollis nulla, quis congue sapien massa sed risus. Aliquam convallis quam eget turpis.Donec aliquet lacus eget libero. Suspendisse nisi odio, luctus eget, pretium quis, placerat a, urna. Ut sed nulla non ante cursus convallis.</p>
<p>Sed venenatis sapien sed purus. Maecenas felis massa, porta sed, semper sed, lobortis luctus, erat. Aliquam nec nunc sit amet diam pulvinar mattis. In at turpis eget dolor volutpat rutrum. Donec aliquet lacus eget libero. Suspendisse nisi odio, luctus eget, pretium quis, placerat a, urna. Ut sed nulla non ante cursus convallis.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="10" lang="it" /><resource resourcetype="Image" id="10" lang="en" /><text lang="it">prova</text><text lang="en">prova</text></attribute><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link"><attribute name="Riferimenti" attributetype="Link"><link type="external"><urldest>http://www.google.com/</urldest></link><text lang="it">Google</text><text lang="en">Google</text></attribute></list><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG20', 'CNG', 'Statuto', 'DRAFT', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG20" typecode="CNG" typedescr="Contenuto generico"><descr>Statuto</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Statuto</text><text lang="pt">Statuto Portoghese</text><text lang="en">Statute</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Lo Statuto è il documento che definisce organi, compiti e modalità di funzionamento dell’Ente comunale.&#xD;
Se desideri saperne di più sulle funzioni svolte dall’Ente Comune, sulle regole che ne governano il funzionamento e sulla rappresentatività democratica esercitata dai cittadini tramite il voto elettorale, troverai nello statuto ufficiale molte informazioni interessanti.</text><text lang="en">The Statute is the document that defines the Municipality council, functions and mode of operation.&#xD;
&#xD;
If you want to learn more about the Municipality functions, basic rules and democratic representation exercised by citizens through the electoral vote, you''ll find lots of interesting information in the official status.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Lo <strong>Statuto</strong> &egrave; il documento che definisce <strong>organi</strong>, <strong>compiti</strong> e <strong>modalit&agrave;</strong> di funzionamento dell&rsquo;Ente comunale.</p>
<p>Se desideri saperne di pi&ugrave; sulle funzioni svolte dall&rsquo;Ente Comune, sulle regole che ne governano il funzionamento e sulla rappresentativit&agrave; democratica esercitata dai cittadini tramite il voto elettorale, troverai nello statuto ufficiale molte informazioni interessanti.</p>
<p>In questa sezione puoi trovare, nella sua interezza, il testo ufficiale dello Statuto del Comune di <strong>Villamarina</strong>.</p>
<p>Scarica in Pdf il testo dello Statuto del Comune di Villamarina.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>The <strong>Statute</strong> is the document that defines the Municipality council, functions and mode of operation.</p>
<p>If you want to learn more about the Municipality functions, basic rules and democratic representation exercised by citizens through the electoral vote, you''ll find lots of interesting information in the official status.</p>
<p>In this section you can find the official text of Villamarina Municipality Statute.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="21" lang="it" /><resource resourcetype="Image" id="21" lang="en" /><text lang="it">Stemma</text><text lang="en">Statute</text></attribute><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="22" lang="it" /><resource resourcetype="Attach" id="22" lang="en" /><text lang="it">Statuto Villamarina</text><text lang="en">Statute</text></attribute></list></attributes><status>DRAFT</status></content>
', '20090721120929', '20100201154934', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG20" typecode="CNG" typedescr="Contenuto generico"><descr>Statuto</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Statuto</text><text lang="pt">Statuto Portoghese</text><text lang="en">Statute</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Lo Statuto è il documento che definisce organi, compiti e modalità di funzionamento dell’Ente comunale.&#xD;
Se desideri saperne di più sulle funzioni svolte dall’Ente Comune, sulle regole che ne governano il funzionamento e sulla rappresentatività democratica esercitata dai cittadini tramite il voto elettorale, troverai nello statuto ufficiale molte informazioni interessanti.</text><text lang="en">The Statute is the document that defines the Municipality council, functions and mode of operation.&#xD;
&#xD;
If you want to learn more about the Municipality functions, basic rules and democratic representation exercised by citizens through the electoral vote, you''ll find lots of interesting information in the official status.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Lo <strong>Statuto</strong> &egrave; il documento che definisce <strong>organi</strong>, <strong>compiti</strong> e <strong>modalit&agrave;</strong> di funzionamento dell&rsquo;Ente comunale.</p>
<p>Se desideri saperne di pi&ugrave; sulle funzioni svolte dall&rsquo;Ente Comune, sulle regole che ne governano il funzionamento e sulla rappresentativit&agrave; democratica esercitata dai cittadini tramite il voto elettorale, troverai nello statuto ufficiale molte informazioni interessanti.</p>
<p>In questa sezione puoi trovare, nella sua interezza, il testo ufficiale dello Statuto del Comune di <strong>Villamarina</strong>.</p>
<p>Scarica in Pdf il testo dello Statuto del Comune di Villamarina.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>The <strong>Statute</strong> is the document that defines the Municipality council, functions and mode of operation.</p>
<p>If you want to learn more about the Municipality functions, basic rules and democratic representation exercised by citizens through the electoral vote, you''ll find lots of interesting information in the official status.</p>
<p>In this section you can find the official text of Villamarina Municipality Statute.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="21" lang="it" /><resource resourcetype="Image" id="21" lang="en" /><text lang="it">Stemma</text><text lang="en">Statute</text></attribute><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="22" lang="it" /><resource resourcetype="Attach" id="22" lang="en" /><text lang="it">Statuto Villamarina</text><text lang="en">Statute</text></attribute></list></attributes><status>DRAFT</status></content>
', 'free', '1.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('SDL42', 'SDL', 'Modulo - richiesta carta identità valida per espatrio', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="SDL42" typecode="SDL" typedescr="Scheda Download"><descr>Modulo - richiesta carta identità valida per espatrio</descr><groups mainGroup="free" /><categories><category id="moduli" /><category id="anagrafe" /></categories><attributes><attribute name="Oggetto" attributetype="Text"><text lang="it">Anagrafe - Richiesta Carta Identità valida per espatrio</text><text lang="en">Registry - Request Identity Card valid for foreign travel</text></attribute><attribute name="DescrizioneBreve" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per la richiesta della carta identit&agrave; valida per espatrio.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Request Form for identity card valid for foreign travel.</p>]]></hypertext></attribute><attribute name="DescrizioneLunga" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per la richiesta della carta identit&agrave; valida per espatrio, per i cittadini residenti nel Comune di Villamarina.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Request Form for identity card valid for foreign travel, for Villamarina citizens.</p>]]></hypertext></attribute><attribute name="Immagine" attributetype="Image" /><attribute name="File" attributetype="Attach"><resource resourcetype="Attach" id="41" lang="it" /><resource resourcetype="Attach" id="41" lang="en" /><text lang="it">Modulo richiesta Carta Identità valida per espatrio</text><text lang="en">Identity Card Request Form</text></attribute><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', '20090722134145', '20100201154943', '<?xml version="1.0" encoding="UTF-8"?>
<content id="SDL42" typecode="SDL" typedescr="Scheda Download"><descr>Modulo - richiesta carta identità valida per espatrio</descr><groups mainGroup="free" /><categories><category id="moduli" /><category id="anagrafe" /></categories><attributes><attribute name="Oggetto" attributetype="Text"><text lang="it">Anagrafe - Richiesta Carta Identità valida per espatrio</text><text lang="en">Registry - Request Identity Card valid for foreign travel</text></attribute><attribute name="DescrizioneBreve" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per la richiesta della carta identit&agrave; valida per espatrio.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Request Form for identity card valid for foreign travel.</p>]]></hypertext></attribute><attribute name="DescrizioneLunga" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per la richiesta della carta identit&agrave; valida per espatrio, per i cittadini residenti nel Comune di Villamarina.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Request Form for identity card valid for foreign travel, for Villamarina citizens.</p>]]></hypertext></attribute><attribute name="Immagine" attributetype="Image" /><attribute name="File" attributetype="Attach"><resource resourcetype="Attach" id="41" lang="it" /><resource resourcetype="Attach" id="41" lang="en" /><text lang="it">Modulo richiesta Carta Identità valida per espatrio</text><text lang="en">Identity Card Request Form</text></attribute><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', 'free', '1.0', NULL);
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('SDL44', 'SDL', 'Autocertificazione Stato Civile', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="SDL44" typecode="SDL" typedescr="Scheda Download"><descr>Autocertificazione Stato Civile</descr><groups mainGroup="free" /><categories><category id="autocertificazioni" /></categories><attributes><attribute name="Oggetto" attributetype="Text"><text lang="it">Modulo Autocertificazione Stato Civile</text><text lang="en">Civil Status Self Certification Form</text></attribute><attribute name="DescrizioneBreve" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per l''autocertificazione dello stato civile messo a disposizione dal Comune di Villamarina, Ufficio Relazioni con il Pubblico.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Civil Status Self Certification Form</p>]]></hypertext></attribute><attribute name="DescrizioneLunga" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per l''autocertificazione&nbsp;dello stato civile messo a disposizione dal Comune di Villamarina, Ufficio Relazioni con il Pubblico.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Civil Status Self Certification Form</p>]]></hypertext></attribute><attribute name="Immagine" attributetype="Image" /><attribute name="File" attributetype="Attach"><resource resourcetype="Attach" id="43" lang="it" /><resource resourcetype="Attach" id="43" lang="en" /><text lang="it">Modulo Certificato Stato Civile</text><text lang="en">Civil Status Self Certification Form</text></attribute><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', '20090722143125', '20100201154943', '<?xml version="1.0" encoding="UTF-8"?>
<content id="SDL44" typecode="SDL" typedescr="Scheda Download"><descr>Autocertificazione Stato Civile</descr><groups mainGroup="free" /><categories><category id="autocertificazioni" /></categories><attributes><attribute name="Oggetto" attributetype="Text"><text lang="it">Modulo Autocertificazione Stato Civile</text><text lang="en">Civil Status Self Certification Form</text></attribute><attribute name="DescrizioneBreve" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per l''autocertificazione dello stato civile messo a disposizione dal Comune di Villamarina, Ufficio Relazioni con il Pubblico.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Civil Status Self Certification Form</p>]]></hypertext></attribute><attribute name="DescrizioneLunga" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per l''autocertificazione&nbsp;dello stato civile messo a disposizione dal Comune di Villamarina, Ufficio Relazioni con il Pubblico.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Civil Status Self Certification Form</p>]]></hypertext></attribute><attribute name="Immagine" attributetype="Image" /><attribute name="File" attributetype="Attach"><resource resourcetype="Attach" id="43" lang="it" /><resource resourcetype="Attach" id="43" lang="en" /><text lang="it">Modulo Certificato Stato Civile</text><text lang="en">Civil Status Self Certification Form</text></attribute><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', 'free', '1.0', NULL);
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('SDL7', 'SDL', 'Autocertificazione Residenza', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="SDL7" typecode="SDL" typedescr="Scheda Download"><descr>Autocertificazione Residenza</descr><groups mainGroup="free" /><categories><category id="autocertificazioni" /></categories><attributes><attribute name="Oggetto" attributetype="Text"><text lang="it">Modulo Autocertificazione Residenza</text><text lang="en">Residence Self-certification Form</text></attribute><attribute name="DescrizioneBreve" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per l''autocertificazione di residenza messo a disposizione dal Comune di Villamarina, Ufficio Relazioni con il Pubblico.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Residence Self-certification form.</p>]]></hypertext></attribute><attribute name="DescrizioneLunga" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per l''autocertificazione di residenza&nbsp;messo a disposizione dal Comune di Villamarina, Ufficio Relazioni con il Pubblico.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Residence Self-certification form.</p>]]></hypertext></attribute><attribute name="Immagine" attributetype="Image" /><attribute name="File" attributetype="Attach"><resource resourcetype="Attach" id="40" lang="it" /><resource resourcetype="Attach" id="40" lang="en" /><text lang="it">Certificato di residenza</text><text lang="en">Residence Self-certification form</text></attribute><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', '20090219165640', '20100201154943', '<?xml version="1.0" encoding="UTF-8"?>
<content id="SDL7" typecode="SDL" typedescr="Scheda Download"><descr>Autocertificazione Residenza</descr><groups mainGroup="free" /><categories><category id="autocertificazioni" /></categories><attributes><attribute name="Oggetto" attributetype="Text"><text lang="it">Modulo Autocertificazione Residenza</text><text lang="en">Residence Self-certification Form</text></attribute><attribute name="DescrizioneBreve" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per l''autocertificazione di residenza messo a disposizione dal Comune di Villamarina, Ufficio Relazioni con il Pubblico.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Residence Self-certification form.</p>]]></hypertext></attribute><attribute name="DescrizioneLunga" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per l''autocertificazione di residenza&nbsp;messo a disposizione dal Comune di Villamarina, Ufficio Relazioni con il Pubblico.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Residence Self-certification form.</p>]]></hypertext></attribute><attribute name="Immagine" attributetype="Image" /><attribute name="File" attributetype="Attach"><resource resourcetype="Attach" id="40" lang="it" /><resource resourcetype="Attach" id="40" lang="en" /><text lang="it">Certificato di residenza</text><text lang="en">Residence Self-certification form</text></attribute><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /></attributes><status>READY</status><versionId>2.0</versionId></content>
', 'free', '1.0', NULL);
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('SDL46', 'SDL', 'Modulo - richiesta rimborso ICI', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="SDL46" typecode="SDL" typedescr="Scheda Download"><descr>Modulo - richiesta rimborso ICI</descr><groups mainGroup="free" /><categories><category id="moduli" /><category id="tributi" /></categories><attributes><attribute name="Oggetto" attributetype="Text"><text lang="it">Tributi - Richiesta rimborso ICI</text><text lang="en">Tax - Request ICI refund</text></attribute><attribute name="DescrizioneBreve" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per la richiesta del rimborso ICI</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Request Form for ICI refund.</p>]]></hypertext></attribute><attribute name="DescrizioneLunga" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per la richiesta del del rimborso ICI per i cittadini residenti nel Comune di Villamarina.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>&nbsp;Request Form for ICI refund, for Villamarina citizens.</p>]]></hypertext></attribute><attribute name="Immagine" attributetype="Image" /><attribute name="File" attributetype="Attach"><resource resourcetype="Attach" id="45" lang="it" /><resource resourcetype="Attach" id="45" lang="en" /><text lang="it">Modulo richiesta rimborso ICI</text><text lang="en">Request Form</text></attribute><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', '20090722143535', '20100201154943', '<?xml version="1.0" encoding="UTF-8"?>
<content id="SDL46" typecode="SDL" typedescr="Scheda Download"><descr>Modulo - richiesta rimborso ICI</descr><groups mainGroup="free" /><categories><category id="moduli" /><category id="tributi" /></categories><attributes><attribute name="Oggetto" attributetype="Text"><text lang="it">Tributi - Richiesta rimborso ICI</text><text lang="en">Tax - Request ICI refund</text></attribute><attribute name="DescrizioneBreve" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per la richiesta del rimborso ICI</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Request Form for ICI refund.</p>]]></hypertext></attribute><attribute name="DescrizioneLunga" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Modulo per la richiesta del del rimborso ICI per i cittadini residenti nel Comune di Villamarina.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>&nbsp;Request Form for ICI refund, for Villamarina citizens.</p>]]></hypertext></attribute><attribute name="Immagine" attributetype="Image" /><attribute name="File" attributetype="Attach"><resource resourcetype="Attach" id="45" lang="it" /><resource resourcetype="Attach" id="45" lang="en" /><text lang="it">Modulo richiesta rimborso ICI</text><text lang="en">Request Form</text></attribute><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /></attributes><status>READY</status><versionId>1.0</versionId></content>
', 'free', '1.0', NULL);
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('BND39', 'BND', 'Bando Servizio Civile', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="BND39" typecode="BND" typedescr="Bando"><descr>Bando Servizio Civile</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Bando di gara per la partecipazione al Servizio Civile</text><text lang="en">Announcement for participation in Civil Service</text></attribute><attribute name="DataInizio" attributetype="Date"><date>20110201</date></attribute><attribute name="DataFine" attributetype="Date"><date>20111130</date></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Bando di gara&nbsp;per la selezione di 10 volontari da impiegare in progetti di servizio civile nel Comune di Villamarina.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Announcement for the selection of 10 volunteers for civil service projects.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="38" lang="it" /><resource resourcetype="Attach" id="38" lang="en" /><text lang="it">Scarica il bando</text><text lang="en">Civil Service Announcement</text></attribute></list></attributes><status>READY</status><version>6.0</version></content>
', '20090722125552', '20101120102622', '<?xml version="1.0" encoding="UTF-8"?>
<content id="BND39" typecode="BND" typedescr="Bando"><descr>Bando Servizio Civile</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Bando di gara per la partecipazione al Servizio Civile</text><text lang="en">Announcement for participation in Civil Service</text></attribute><attribute name="DataInizio" attributetype="Date"><date>20110201</date></attribute><attribute name="DataFine" attributetype="Date"><date>20111130</date></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Bando di gara&nbsp;per la selezione di 10 volontari da impiegare in progetti di servizio civile nel Comune di Villamarina.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Announcement for the selection of 10 volunteers for civil service projects.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="38" lang="it" /><resource resourcetype="Attach" id="38" lang="en" /><text lang="it">Scarica il bando</text><text lang="en">Civil Service Announcement</text></attribute></list></attributes><status>READY</status><version>6.0</version></content>
', 'free', '6.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('BND48', 'BND', 'Bando fornitura cancelleria', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="BND48" typecode="BND" typedescr="Bando"><descr>Bando fornitura cancelleria</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Bando di gara per affidamento fornitura di cancelleria e accessori</text><text lang="en">Announcement for supply of stationery and accessories</text></attribute><attribute name="DataInizio" attributetype="Date"><date>20110228</date></attribute><attribute name="DataFine" attributetype="Date"><date>20111027</date></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Affidamento della fornitura di cancelleria e accessori per stampanti, fotocopiatori e fax ad uso degli uffici e servizi comunali.</p>
<p>Appalto n. 4 anno 2009 - Procedura Aperta</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Announcements for the supply of stationery and accessories for printers, copiers and fax machines to use in Villamarina offices and services.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="47" lang="it" /><resource resourcetype="Attach" id="47" lang="en" /><text lang="it">Scarica il bando</text><text lang="en">Announcements for stationery supply</text></attribute></list></attributes><status>READY</status><version>3.0</version></content>
', '20090722163604', '20101118105941', '<?xml version="1.0" encoding="UTF-8"?>
<content id="BND48" typecode="BND" typedescr="Bando"><descr>Bando fornitura cancelleria</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Bando di gara per affidamento fornitura di cancelleria e accessori</text><text lang="en">Announcement for supply of stationery and accessories</text></attribute><attribute name="DataInizio" attributetype="Date"><date>20110228</date></attribute><attribute name="DataFine" attributetype="Date"><date>20111027</date></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Affidamento della fornitura di cancelleria e accessori per stampanti, fotocopiatori e fax ad uso degli uffici e servizi comunali.</p>
<p>Appalto n. 4 anno 2009 - Procedura Aperta</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Announcements for the supply of stationery and accessories for printers, copiers and fax machines to use in Villamarina offices and services.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="47" lang="it" /><resource resourcetype="Attach" id="47" lang="en" /><text lang="it">Scarica il bando</text><text lang="en">Announcements for stationery supply</text></attribute></list></attributes><status>READY</status><version>3.0</version></content>
', 'free', '3.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('BND5', 'BND', 'Bando Lavori Manutenzione Istituto Nautico', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="BND5" typecode="BND" typedescr="Bando"><descr>Bando Lavori Manutenzione Istituto Nautico</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Bando di gara per l''esecuzione dei Lavori per la manutenzione dell''Istituto Nautico</text><text lang="en">Announcement for special maintenance Nautical Institute.</text></attribute><attribute name="DataInizio" attributetype="Date"><date>20110303</date></attribute><attribute name="DataFine" attributetype="Date"><date>20111114</date></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Bando di gara per l''esecuzione dei &quot;Lavori per la manutenzione straordinaria dell''Istituto Nautico, per la realizzazione di laboratorio informatico&quot;.</p>
<p>Appalto n. 3 anno 2009 - Procedura Aperta</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Announcement for special maintenance of Nautical Institute. Realization of a computer lab on the first floor of the institute.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="37" lang="it" /><resource resourcetype="Attach" id="37" lang="en" /><text lang="it">Bando</text><text lang="en">Announcement for maintenance Nautical Institute</text></attribute></list></attributes><status>READY</status><version>3.0</version></content>
', '20090219165221', '20101118110039', '<?xml version="1.0" encoding="UTF-8"?>
<content id="BND5" typecode="BND" typedescr="Bando"><descr>Bando Lavori Manutenzione Istituto Nautico</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Bando di gara per l''esecuzione dei Lavori per la manutenzione dell''Istituto Nautico</text><text lang="en">Announcement for special maintenance Nautical Institute.</text></attribute><attribute name="DataInizio" attributetype="Date"><date>20110303</date></attribute><attribute name="DataFine" attributetype="Date"><date>20111114</date></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Bando di gara per l''esecuzione dei &quot;Lavori per la manutenzione straordinaria dell''Istituto Nautico, per la realizzazione di laboratorio informatico&quot;.</p>
<p>Appalto n. 3 anno 2009 - Procedura Aperta</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Announcement for special maintenance of Nautical Institute. Realization of a computer lab on the first floor of the institute.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="37" lang="it" /><resource resourcetype="Attach" id="37" lang="en" /><text lang="it">Bando</text><text lang="en">Announcement for maintenance Nautical Institute</text></attribute></list></attributes><status>READY</status><version>3.0</version></content>
', 'free', '3.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG16', 'CNG', 'Gestione Card Internal Servlet', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG16" typecode="CNG" typedescr="Contenuto generico"><descr>Gestione Card Internal Servlet</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Internal Servlet</text><text lang="en">Internal Servlet</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Di seguito viene presentato un semplice esempio di erogazione di un servizio applicativo (scritto secondo il &quot;Pattern di integrazione Servizi Applicativi jAPS&quot;) per la gestione dei &quot;Pass ZTL&quot; con l''utilizzo della Showlet &quot;Internal Servlet&quot;..</p>
<p>Tramite la showlet Internal Servlet &egrave; possibile utilizzare il motore del servizio utilizzato per il back-office (le operazioni CRUD realizzate tramite le Action CardAction e CardFinderAction) integrando delle jsp apposite.</p>
<p>In questo esempio, nel front-end vengono presentate le funzioni di ricerca PASS e visione dati singolo PASS. Nel back-end &egrave; possibilie effettuare le semplici operazioni CRUD sugli oggetti.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>This is a simple example of a service application (written under the &quot;jAPS Services Integration Pattern&quot;) for the management of &quot;Limited Traffic Zone Pass&quot; with the use of &quot;Internal Servlet&quot; Showlet.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><version>3.0</version></content>
', '20090708180436', '20101118141922', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG16" typecode="CNG" typedescr="Contenuto generico"><descr>Gestione Card Internal Servlet</descr><groups mainGroup="free"><group name="free" /></groups><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Internal Servlet</text><text lang="en">Internal Servlet</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Di seguito viene presentato un semplice esempio di erogazione di un servizio applicativo (scritto secondo il &quot;Pattern di integrazione Servizi Applicativi jAPS&quot;) per la gestione dei &quot;Pass ZTL&quot; con l''utilizzo della Showlet &quot;Internal Servlet&quot;..</p>
<p>Tramite la showlet Internal Servlet &egrave; possibile utilizzare il motore del servizio utilizzato per il back-office (le operazioni CRUD realizzate tramite le Action CardAction e CardFinderAction) integrando delle jsp apposite.</p>
<p>In questo esempio, nel front-end vengono presentate le funzioni di ricerca PASS e visione dati singolo PASS. Nel back-end &egrave; possibilie effettuare le semplici operazioni CRUD sugli oggetti.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>This is a simple example of a service application (written under the &quot;jAPS Services Integration Pattern&quot;) for the management of &quot;Limited Traffic Zone Pass&quot; with the use of &quot;Internal Servlet&quot; Showlet.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><version>3.0</version></content>
', 'free', '3.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG15', 'CNG', 'Gestione Card', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG15" typecode="CNG" typedescr="Contenuto generico"><descr>Gestione Card</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Esempio Servizio Applicativo</text><text lang="en">Application Service Example</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Di seguito viene presentato un semplice esempio di erogazione di un servizio applicativo (scritto secondo il &quot;Pattern di integrazione Servizi Applicativi jAPS&quot;) per la gestione dei &quot;<strong>Pass ZTL</strong>&quot;.</p>
<p>In front-end vengono presentate le funzioni di erogazione lista per i PASS attraverso l''''utilizzo di un custom tag (CardListTag) e il paginatore di sistema. Nel back-end &egrave; possibilie effettuare le semplici operazioni CRUD sugli oggetti.</p>
<p>Il servizio &egrave; fruibile anche attraverso l''utilizzo della Showlet &quot;Internal Servlet&quot;, <a href="#!P;old_town_traffic_pass_int!#">accedi al servizio</a>.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>This is a simple example of a service application (written under the &quot;jAPS Services Integration Pattern&quot;) for the management of &quot;Limited Traffic Zone Pass&quot;.</p>
<p>The service is available through the use of &quot;<a href="#!P;old_town_traffic_pass_int!#">Internal Servlet</a>&quot; Showlet.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><version>4.0</version></content>
', '20090708175822', '20101120142520', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG15" typecode="CNG" typedescr="Contenuto generico"><descr>Gestione Card</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Esempio Servizio Applicativo</text><text lang="en">Application Service Example</text></attribute><attribute name="Abstract" attributetype="Longtext" /><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Di seguito viene presentato un semplice esempio di erogazione di un servizio applicativo (scritto secondo il &quot;Pattern di integrazione Servizi Applicativi jAPS&quot;) per la gestione dei &quot;<strong>Pass ZTL</strong>&quot;.</p>
<p>In front-end vengono presentate le funzioni di erogazione lista per i PASS attraverso l''''utilizzo di un custom tag (CardListTag) e il paginatore di sistema. Nel back-end &egrave; possibilie effettuare le semplici operazioni CRUD sugli oggetti.</p>
<p>Il servizio &egrave; fruibile anche attraverso l''utilizzo della Showlet &quot;Internal Servlet&quot;, <a href="#!P;old_town_traffic_pass_int!#">accedi al servizio</a>.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>This is a simple example of a service application (written under the &quot;jAPS Services Integration Pattern&quot;) for the management of &quot;Limited Traffic Zone Pass&quot;.</p>
<p>The service is available through the use of &quot;<a href="#!P;old_town_traffic_pass_int!#">Internal Servlet</a>&quot; Showlet.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><version>4.0</version></content>
', 'free', '4.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('NEW3', 'NEW', 'Online il Portale del Comune di Villamarina', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="NEW3" typecode="NEW" typedescr="Notizia"><descr>Online il Portale del Comune di Villamarina</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Data" attributetype="Date"><date>20111121</date></attribute><attribute name="Titolo" attributetype="Text"><text lang="it">Online il Portale del Comune di Villamarina</text><text lang="en">Online the Portal of Villamarina Municipality</text></attribute><attribute name="Lancio" attributetype="Longtext"><text lang="it">Online il Portale del Comune di Villamarina realizzato con la piattaforma jAPS 2.0.</text><text lang="en">Online the Portal of Villamarina Municipality, built with jAPS 2.0 Platform.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Online<strong> il Portale del Comune di Villamarina, </strong>realizzato con la <strong>piattaforma jAPS 2.0</strong>.</p>
<p>Nel portale istituzionale &egrave; possibile trovare tutte le informazioni relative al comune e alle sue attivit&agrave;: gli uffici, delibere e determine, bandi e concorsi e tanto altro.</p>
<p>Il nuovo portale &egrave; stato realizzato per dare una risposta all''altezza delle aspettative dei cittadini che ogni giorno si collegano ad internet per avere notizie ed informazioni aggiornate sull''amministrazione comunale.</p>
<p>Il sito si presenta con una veste <strong>grafica minimalista</strong> e molto leggera proprio per questo <strong>accattivante</strong> ed <strong>efficace</strong>.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Online the Portal of Villamarina Municipality, built with jAPS 2.0 Platform.</p>
<p>In the institutional portal you can find all the information relating to the municipality and its activities: the offices, decisions and results.</p>
<p>The new portal is designed to respond to the expectations of citizens who every day are connected to find news and updated information.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="26" lang="it" /><resource resourcetype="Image" id="26" lang="en" /><text lang="it">Spiaggia</text><text lang="en">Villamarina</text></attribute><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><version>6.0</version></content>
', '20090219163456', '20110119120025', '<?xml version="1.0" encoding="UTF-8"?>
<content id="NEW3" typecode="NEW" typedescr="Notizia"><descr>Online il Portale del Comune di Villamarina</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Data" attributetype="Date"><date>20111121</date></attribute><attribute name="Titolo" attributetype="Text"><text lang="it">Online il Portale del Comune di Villamarina</text><text lang="en">Online the Portal of Villamarina Municipality</text></attribute><attribute name="Lancio" attributetype="Longtext"><text lang="it">Online il Portale del Comune di Villamarina realizzato con la piattaforma jAPS 2.0.</text><text lang="en">Online the Portal of Villamarina Municipality, built with jAPS 2.0 Platform.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Online<strong> il Portale del Comune di Villamarina, </strong>realizzato con la <strong>piattaforma jAPS 2.0</strong>.</p>
<p>Nel portale istituzionale &egrave; possibile trovare tutte le informazioni relative al comune e alle sue attivit&agrave;: gli uffici, delibere e determine, bandi e concorsi e tanto altro.</p>
<p>Il nuovo portale &egrave; stato realizzato per dare una risposta all''altezza delle aspettative dei cittadini che ogni giorno si collegano ad internet per avere notizie ed informazioni aggiornate sull''amministrazione comunale.</p>
<p>Il sito si presenta con una veste <strong>grafica minimalista</strong> e molto leggera proprio per questo <strong>accattivante</strong> ed <strong>efficace</strong>.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Online the Portal of Villamarina Municipality, built with jAPS 2.0 Platform.</p>
<p>In the institutional portal you can find all the information relating to the municipality and its activities: the offices, decisions and results.</p>
<p>The new portal is designed to respond to the expectations of citizens who every day are connected to find news and updated information.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="26" lang="it" /><resource resourcetype="Image" id="26" lang="en" /><text lang="it">Spiaggia</text><text lang="en">Villamarina</text></attribute><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><version>6.0</version></content>
', 'free', '6.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('NEW27', 'NEW', 'Festival della canzone popolare', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="NEW27" typecode="NEW" typedescr="Notizia"><descr>Festival della canzone popolare</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Data" attributetype="Date"><date>20110720</date></attribute><attribute name="Titolo" attributetype="Text"><text lang="it">Festival della canzone popolare</text><text lang="en">Folk Music Festival</text></attribute><attribute name="Lancio" attributetype="Longtext"><text lang="it">Si inaugura la III edizione del "Festival della canzone popolare"</text><text lang="en">It has been inaugurated the third edition of the "Folk Music Festival" to be held on July and August in the amphitheater of Villamarina.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Si inaugura la III edizione del &quot;Festival della <strong>canzone popolare&quot;</strong> che si svolger&agrave; durante i mesi di febbraio ed marzo nell''anfiteatro del lungo mare di Villamarina.</p>
<p>Al centro della manifestazione &egrave; la canzone popolare. L''evento coinvolge <strong>artisti di fama nazionale</strong> e prevede un calendario ricco di incontri.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>It has been inaugurated the third edition of the &quot;<strong>Folk Music Festival</strong>&quot; to be held on July and August in the amphitheater of Villamarina.</p>
<p>At the center of the event is the folk song. The event involves artists and provides a calendar full of meetings.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><version>8.0</version></content>
', '20090721191155', '20110119120211', '<?xml version="1.0" encoding="UTF-8"?>
<content id="NEW27" typecode="NEW" typedescr="Notizia"><descr>Festival della canzone popolare</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Data" attributetype="Date"><date>20110720</date></attribute><attribute name="Titolo" attributetype="Text"><text lang="it">Festival della canzone popolare</text><text lang="en">Folk Music Festival</text></attribute><attribute name="Lancio" attributetype="Longtext"><text lang="it">Si inaugura la III edizione del "Festival della canzone popolare"</text><text lang="en">It has been inaugurated the third edition of the "Folk Music Festival" to be held on July and August in the amphitheater of Villamarina.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Si inaugura la III edizione del &quot;Festival della <strong>canzone popolare&quot;</strong> che si svolger&agrave; durante i mesi di febbraio ed marzo nell''anfiteatro del lungo mare di Villamarina.</p>
<p>Al centro della manifestazione &egrave; la canzone popolare. L''evento coinvolge <strong>artisti di fama nazionale</strong> e prevede un calendario ricco di incontri.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>It has been inaugurated the third edition of the &quot;<strong>Folk Music Festival</strong>&quot; to be held on July and August in the amphitheater of Villamarina.</p>
<p>At the center of the event is the folk song. The event involves artists and provides a calendar full of meetings.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><version>8.0</version></content>
', 'free', '8.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('NEW23', 'NEW', 'Contributo canone di locazione 2010', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="NEW23" typecode="NEW" typedescr="Notizia"><descr>Contributo canone di locazione 2010</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Data" attributetype="Date"><date>20111021</date></attribute><attribute name="Titolo" attributetype="Text"><text lang="it">Contributo canone di locazione 2011</text><text lang="en">Ground Rent Contribution</text></attribute><attribute name="Lancio" attributetype="Longtext"><text lang="it">E'' stato pubblicato l''avviso pubblico per l’attribuzione del contributo ad integrazione dei canoni di locazione 2011.</text><text lang="en">It has been published the public notice for the allocation of Ground Rent Contribution 2011.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>E'' stato pubblicato l''avviso pubblico per<strong> </strong>la presentazione delle domande per  l&rsquo;<strong>attribuzione del contributo ad integrazione dei canoni di locazione</strong> relativo all&rsquo;annualit&agrave; 2011,  di cui all&rsquo;art. 11 L. 431/98 per chi sia residente nel Comune di Villamarina.&nbsp;</p>
<p>E'' possibile scaricare i moduli per la domanda, e il relativo Bando in questa sezione o ritirarli presso gli uffici del Comune di Villamarina.</p>
<p>Le relative domande per accedere al bando devono essere presentate o spedite all''Ufficio Protocollo  entro il<strong>  giorno 11.12.2011</strong>.&nbsp;</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>It has been published the public notice for the allocation of <strong>Ground Rent Contribution 2011</strong>.</p>
<p>You can download the application forms and the notice in this section.</p>
<p>The applications to access the notice must be submitted to Protocol Office until <strong>11/12/2011</strong>.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="24" lang="it" /><resource resourcetype="Attach" id="24" lang="en" /><text lang="it">Bando Locazione 2011</text><text lang="en">Notice</text></attribute><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="25" lang="it" /><resource resourcetype="Attach" id="25" lang="en" /><text lang="it">Modulo domanda Locazione 2011</text><text lang="en">Application Form</text></attribute></list></attributes><status>READY</status><version>6.0</version></content>
', '20090721185336', '20110119121958', '<?xml version="1.0" encoding="UTF-8"?>
<content id="NEW23" typecode="NEW" typedescr="Notizia"><descr>Contributo canone di locazione 2010</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Data" attributetype="Date"><date>20111021</date></attribute><attribute name="Titolo" attributetype="Text"><text lang="it">Contributo canone di locazione 2011</text><text lang="en">Ground Rent Contribution</text></attribute><attribute name="Lancio" attributetype="Longtext"><text lang="it">E'' stato pubblicato l''avviso pubblico per l’attribuzione del contributo ad integrazione dei canoni di locazione 2011.</text><text lang="en">It has been published the public notice for the allocation of Ground Rent Contribution 2011.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>E'' stato pubblicato l''avviso pubblico per<strong> </strong>la presentazione delle domande per  l&rsquo;<strong>attribuzione del contributo ad integrazione dei canoni di locazione</strong> relativo all&rsquo;annualit&agrave; 2011,  di cui all&rsquo;art. 11 L. 431/98 per chi sia residente nel Comune di Villamarina.&nbsp;</p>
<p>E'' possibile scaricare i moduli per la domanda, e il relativo Bando in questa sezione o ritirarli presso gli uffici del Comune di Villamarina.</p>
<p>Le relative domande per accedere al bando devono essere presentate o spedite all''Ufficio Protocollo  entro il<strong>  giorno 11.12.2011</strong>.&nbsp;</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>It has been published the public notice for the allocation of <strong>Ground Rent Contribution 2011</strong>.</p>
<p>You can download the application forms and the notice in this section.</p>
<p>The applications to access the notice must be submitted to Protocol Office until <strong>11/12/2011</strong>.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="24" lang="it" /><resource resourcetype="Attach" id="24" lang="en" /><text lang="it">Bando Locazione 2011</text><text lang="en">Notice</text></attribute><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="25" lang="it" /><resource resourcetype="Attach" id="25" lang="en" /><text lang="it">Modulo domanda Locazione 2011</text><text lang="en">Application Form</text></attribute></list></attributes><status>READY</status><version>6.0</version></content>
', 'free', '6.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('DLB4', 'DLB', 'Delibera 133', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="DLB4" typecode="DLB" typedescr="Delibera"><descr>Delibera 133</descr><groups mainGroup="free" /><categories><category id="delibere_di_giunta" /></categories><attributes><attribute name="Numero" attributetype="Number"><number>133</number></attribute><attribute name="Data" attributetype="Date"><date>20110920</date></attribute><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Manutenzione straordinaria Istituto Nautico - Lavori per la realizzazione di laboratorio informatico.</text><text lang="en">Special maintenance of Nautical Institute.</text></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Manutenzione straordinaria Istituto Nautico. Lavori per la realizzazione di un laboratorio informatico nel primo piano dell''istituto.</p>
<p>Approvazione progetto definitivo - esecutivo.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Special maintenance of Nautical Institute. Realization of a computer lab on the first floor of the institute.</p>
<p>Approval of final project.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="31" lang="it" /><resource resourcetype="Attach" id="31" lang="en" /><text lang="it">Delibera della Giunta Comunale numero 133 del 20 Luglio 2011</text><text lang="en">Decision 133</text></attribute></list></attributes><status>READY</status><version>6.0</version></content>
', '20090219164216', '20110119120322', '<?xml version="1.0" encoding="UTF-8"?>
<content id="DLB4" typecode="DLB" typedescr="Delibera"><descr>Delibera 133</descr><groups mainGroup="free" /><categories><category id="delibere_di_giunta" /></categories><attributes><attribute name="Numero" attributetype="Number"><number>133</number></attribute><attribute name="Data" attributetype="Date"><date>20110920</date></attribute><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Manutenzione straordinaria Istituto Nautico - Lavori per la realizzazione di laboratorio informatico.</text><text lang="en">Special maintenance of Nautical Institute.</text></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Manutenzione straordinaria Istituto Nautico. Lavori per la realizzazione di un laboratorio informatico nel primo piano dell''istituto.</p>
<p>Approvazione progetto definitivo - esecutivo.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Special maintenance of Nautical Institute. Realization of a computer lab on the first floor of the institute.</p>
<p>Approval of final project.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="31" lang="it" /><resource resourcetype="Attach" id="31" lang="en" /><text lang="it">Delibera della Giunta Comunale numero 133 del 20 Luglio 2011</text><text lang="en">Decision 133</text></attribute></list></attributes><status>READY</status><version>6.0</version></content>
', 'free', '6.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('DLB30', 'DLB', 'Delibera 20', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="DLB30" typecode="DLB" typedescr="Delibera"><descr>Delibera 20</descr><groups mainGroup="free" /><categories><category id="delibere_di_consiglio" /></categories><attributes><attribute name="Numero" attributetype="Number"><number>20</number></attribute><attribute name="Data" attributetype="Date"><date>20111004</date></attribute><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Esame ed approvazione del Conto Consuntivo 2011</text><text lang="en">Examination and approval of Villamarina Balance Sheet 2011</text></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Esame ed approvazione del Conto Consuntivo 2011</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Examination and approval of Villamarina Balance Sheet 2011</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="34" lang="it" /><resource resourcetype="Attach" id="34" lang="en" /><text lang="it">Delibera del Consiglio Comunale numero 20 del 13 Luglio 2011</text><text lang="en">Decision 20</text></attribute></list></attributes><status>READY</status><version>4.0</version></content>
', '20090721192612', '20110119120451', '<?xml version="1.0" encoding="UTF-8"?>
<content id="DLB30" typecode="DLB" typedescr="Delibera"><descr>Delibera 20</descr><groups mainGroup="free" /><categories><category id="delibere_di_consiglio" /></categories><attributes><attribute name="Numero" attributetype="Number"><number>20</number></attribute><attribute name="Data" attributetype="Date"><date>20111004</date></attribute><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Esame ed approvazione del Conto Consuntivo 2011</text><text lang="en">Examination and approval of Villamarina Balance Sheet 2011</text></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Esame ed approvazione del Conto Consuntivo 2011</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Examination and approval of Villamarina Balance Sheet 2011</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="34" lang="it" /><resource resourcetype="Attach" id="34" lang="en" /><text lang="it">Delibera del Consiglio Comunale numero 20 del 13 Luglio 2011</text><text lang="en">Decision 20</text></attribute></list></attributes><status>READY</status><version>4.0</version></content>
', 'free', '4.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('DLB32', 'DLB', 'Delibera 120', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="DLB32" typecode="DLB" typedescr="Delibera"><descr>Delibera 120</descr><groups mainGroup="free" /><categories><category id="delibere_di_giunta" /><category id="moduli" /></categories><attributes><attribute name="Numero" attributetype="Number"><number>120</number></attribute><attribute name="Data" attributetype="Date"><date>20110701</date></attribute><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Organizzazione della manifestazione "Festival della canzone popolare” III Edizione.</text><text lang="en">Organization of the event "Folk Music Festival" III Edition.</text></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Organizzazione della manifestazione &quot;Festival della canzone popolare&rdquo; III Edizione che si terr&agrave; a Villamarina&nbsp; nei mesi di Agosto e Settembre 2011.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Organization of the event &quot;<strong>Folk Music Festival</strong>&quot; III edition to be held in Villamarina in the months of August and September 2011.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="33" lang="it" /><resource resourcetype="Attach" id="33" lang="en" /><text lang="it">Delibera della Giunta Comunale numero 120 dell'' 8 Luglio 2011</text><text lang="en">Decision 120</text></attribute></list></attributes><status>READY</status><version>4.0</version></content>
', '20090722101353', '20110119120606', '<?xml version="1.0" encoding="UTF-8"?>
<content id="DLB32" typecode="DLB" typedescr="Delibera"><descr>Delibera 120</descr><groups mainGroup="free" /><categories><category id="delibere_di_giunta" /><category id="moduli" /></categories><attributes><attribute name="Numero" attributetype="Number"><number>120</number></attribute><attribute name="Data" attributetype="Date"><date>20110701</date></attribute><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Organizzazione della manifestazione "Festival della canzone popolare” III Edizione.</text><text lang="en">Organization of the event "Folk Music Festival" III Edition.</text></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Organizzazione della manifestazione &quot;Festival della canzone popolare&rdquo; III Edizione che si terr&agrave; a Villamarina&nbsp; nei mesi di Agosto e Settembre 2011.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Organization of the event &quot;<strong>Folk Music Festival</strong>&quot; III edition to be held in Villamarina in the months of August and September 2011.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="33" lang="it" /><resource resourcetype="Attach" id="33" lang="en" /><text lang="it">Delibera della Giunta Comunale numero 120 dell'' 8 Luglio 2011</text><text lang="en">Decision 120</text></attribute></list></attributes><status>READY</status><version>4.0</version></content>
', 'free', '4.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('DLB36', 'DLB', 'Delibera 15', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="DLB36" typecode="DLB" typedescr="Delibera"><descr>Delibera 15</descr><groups mainGroup="free" /><categories><category id="delibere_di_consiglio" /><category id="delibere" /></categories><attributes><attribute name="Numero" attributetype="Number"><number>15</number></attribute><attribute name="Data" attributetype="Date"><date>20110716</date></attribute><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Approvazione programma di incarichi di consulenza autonoma nel settore turistico</text><text lang="en">Approval for charge of consultant program in tourism sector for 2011.</text></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Approvazione programma di&nbsp; incarichi di consulenza autonoma nel settore turistico &ndash; lavori pubblici &ndash; servizi tecnologici, per l''anno 2011.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Approval for charge of consultant program in tourism sector for 2011.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="35" lang="it" /><resource resourcetype="Attach" id="35" lang="en" /><text lang="it">Delibera del Consiglio Comunale numero 15 del 09 Luglio 2011</text><text lang="en">Decision 15</text></attribute></list></attributes><status>READY</status><version>4.0</version></content>
', '20090722104739', '20110119120705', '<?xml version="1.0" encoding="UTF-8"?>
<content id="DLB36" typecode="DLB" typedescr="Delibera"><descr>Delibera 15</descr><groups mainGroup="free" /><categories><category id="delibere_di_consiglio" /><category id="delibere" /></categories><attributes><attribute name="Numero" attributetype="Number"><number>15</number></attribute><attribute name="Data" attributetype="Date"><date>20110716</date></attribute><attribute name="Oggetto" attributetype="Longtext"><text lang="it">Approvazione programma di incarichi di consulenza autonoma nel settore turistico</text><text lang="en">Approval for charge of consultant program in tourism sector for 2011.</text></attribute><attribute name="Abstract" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Approvazione programma di&nbsp; incarichi di consulenza autonoma nel settore turistico &ndash; lavori pubblici &ndash; servizi tecnologici, per l''anno 2011.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Approval for charge of consultant program in tourism sector for 2011.</p>]]></hypertext></attribute><list attributetype="Monolist" name="Allegati" nestedtype="Attach"><attribute name="Allegati" attributetype="Attach"><resource resourcetype="Attach" id="35" lang="it" /><resource resourcetype="Attach" id="35" lang="en" /><text lang="it">Delibera del Consiglio Comunale numero 15 del 09 Luglio 2011</text><text lang="en">Decision 15</text></attribute></list></attributes><status>READY</status><version>4.0</version></content>
', 'free', '4.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG145', 'CNG', 'Accessibilità', 'DRAFT', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG145" typecode="CNG" typedescr="Contenuto generico"><descr>Accessibilità</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Accessibilità</text><text lang="en">Web Accessibility</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">eAccessibility indica la capacità di sistemi, servizi e applicazioni ICT di essere accessibili in maniera semplice da utenti con disabilità.&#xD;
&#xD;
In particolare, per accessibilità web si indica la capacità di un sito web di essere acceduto efficacemente in termini di navigazione, fruizione dei contenuti e dei servizi da tutti gli utenti senza nessuna esclusione.</text><text lang="en">eAccessibility is the ease use by people with disabilities of information and communication technologies.&#xD;
&#xD;
More specifically, Web accessibility means that people with disabilities can perceive, understand, navigate, and interact with the Web, and that they can contribute to the Web. Web accessibility also benefits others, including older people with changing abilities due to aging.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p><strong>eAccessibility</strong>  indica la capacit&agrave; di sistemi, servizi e applicazioni ICT di essere accessibili in maniera semplice da utenti con disabilit&agrave;.</p>
<p>In particolare, per accessibilit&agrave; web si indica la capacit&agrave; di un sito web di essere acceduto efficacemente  in termini di navigazione,  fruizione dei contenuti e dei servizi da tutti gli utenti senza nessuna esclusione.</p>
<p>Rendere un sito web accessibile significa permettere l''accesso all''informazione contenuta nel sito anche a persone con disabilit&agrave; di diverso tipo, anziani ma non solo: significa anche consentire a tutti di poter partecipare, gestire, condividere le proprie informazioni. A tal proposito il concetto di accessibilit&agrave; &egrave; legato fortemente a quello di usabilit&agrave;: &egrave; fondamentale che un utente sia capace di accedere ad un''informazione in maniera semplice, efficace ed efficiente.</p>
<p>A tali linee guida, ma soprattutto al principio democratico dell''<strong>eParticipation e eAccessibility</strong>, si &egrave; ispirato il portale.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p><strong>eAccessibility</strong>  is the ease use by people with disabilities of information and communication technologies.</p>
<p>More specifically<strong>, Web accessibility </strong>means that people with disabilities can perceive, understand, navigate, and interact with the Web, and that they can contribute to the Web. Web accessibility also benefits others, including older people with changing abilities due to aging.</p>
<p>The Portal is compatible with <strong>accessibility international standards</strong> like WCAG 2.0 and specific governments laws allowing <strong>citizen eParticipation</strong>.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="144" lang="en" /><text lang="it">Portale Villamarina</text><text lang="en">Villamarina Portal</text></attribute><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status><version>3.0</version></content>
', '20110119121703', '20110128101932', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG145" typecode="CNG" typedescr="Contenuto generico"><descr>Accessibilità</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Accessibilità</text><text lang="en">Web Accessibility</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">eAccessibility indica la capacità di sistemi, servizi e applicazioni ICT di essere accessibili in maniera semplice da utenti con disabilità.&#xD;
&#xD;
In particolare, per accessibilità web si indica la capacità di un sito web di essere acceduto efficacemente in termini di navigazione, fruizione dei contenuti e dei servizi da tutti gli utenti senza nessuna esclusione.</text><text lang="en">eAccessibility is the ease use by people with disabilities of information and communication technologies.&#xD;
&#xD;
More specifically, Web accessibility means that people with disabilities can perceive, understand, navigate, and interact with the Web, and that they can contribute to the Web. Web accessibility also benefits others, including older people with changing abilities due to aging.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p><strong>eAccessibility</strong>  indica la capacit&agrave; di sistemi, servizi e applicazioni ICT di essere accessibili in maniera semplice da utenti con disabilit&agrave;.</p>
<p>In particolare, per accessibilit&agrave; web si indica la capacit&agrave; di un sito web di essere acceduto efficacemente  in termini di navigazione,  fruizione dei contenuti e dei servizi da tutti gli utenti senza nessuna esclusione.</p>
<p>Rendere un sito web accessibile significa permettere l''accesso all''informazione contenuta nel sito anche a persone con disabilit&agrave; di diverso tipo, anziani ma non solo: significa anche consentire a tutti di poter partecipare, gestire, condividere le proprie informazioni. A tal proposito il concetto di accessibilit&agrave; &egrave; legato fortemente a quello di usabilit&agrave;: &egrave; fondamentale che un utente sia capace di accedere ad un''informazione in maniera semplice, efficace ed efficiente.</p>
<p>A tali linee guida, ma soprattutto al principio democratico dell''<strong>eParticipation e eAccessibility</strong>, si &egrave; ispirato il portale.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p><strong>eAccessibility</strong>  is the ease use by people with disabilities of information and communication technologies.</p>
<p>More specifically<strong>, Web accessibility </strong>means that people with disabilities can perceive, understand, navigate, and interact with the Web, and that they can contribute to the Web. Web accessibility also benefits others, including older people with changing abilities due to aging.</p>
<p>The Portal is compatible with <strong>accessibility international standards</strong> like WCAG 2.0 and specific governments laws allowing <strong>citizen eParticipation</strong>.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="144" lang="en" /><text lang="it">Portale Villamarina</text><text lang="en">Villamarina Portal</text></attribute><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status><version>3.0</version></content>
', 'free', '3.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG51', 'CNG', 'Intro Mobile', 'DRAFT', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG51" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Mobile</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Area Mobile</text><text lang="en">Mobile Area</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Online la versione MOBILE del portale di Villamarina disegnata con una nuova interfaccia grafica, adatta alla navigazione su schermi di dimensioni ridotte. Il Portale Mobile è stato realizzato con la piattaforma jAPS 2.0.&#xD;
&#xD;
Il Portale Mobile rende disponibile le informazioni che risultano maggiormente utili a chi naviga sul web stando in movimento.&#xD;
&#xD;
Il Portale Mobile è disponibile in modalità multilingua: italiano, inglese.&#xD;
&#xD;
Il Portale Mobile rende disponibile le informazioni che risultano maggiormente utili a chi naviga sul web stando in movimento.</text><text lang="en">The MOBILE portal version of Villamarina is OnLine. The Mobile Portal is designed with a new graphical interface, suitable for "browsing" on small screens. The mobile portal is built on jAPS 2.0 Platform.&#xD;
&#xD;
The Mobile Portal is multi-languages: Italian, English.&#xD;
&#xD;
The Mobile Portal makes available the information most useful to users who surf the web being in the movement.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Online la versione <a href="#!P;mobile_home!#">MOBILE</a> del portale di Villamarina disegnata con una nuova interfaccia grafica, adatta alla &ldquo;navigazione&rdquo; su schermi di dimensioni ridotte. Il Portale Mobile &egrave; stato realizzato con la piattaforma jAPS 2.0.</p>
<p>Il Portale Mobile rende disponibile le informazioni che risultano maggiormente utili a chi naviga sul web stando in &ldquo;movimento&rdquo;.</p>
<p>Il Portale Mobile &egrave; disponibile in modalit&agrave; multilingua: italiano, inglese.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>The <a href="#!P;mobile_home!#">MOBILE</a> portal version of Villamarina is OnLine. The Mobile Portal is designed with a new graphical interface, suitable for &quot;browsing&quot; on small screens. The mobile portal is built on jAPS 2.0 Platform.</p>
<p>The Mobile Portal is multi-languages: Italian, English.</p>
<p>The Mobile Portal makes available the information most useful to users who surf the web being in the movement.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="143" lang="en" /><text lang="it">Mobile</text><text lang="en">Mobile</text></attribute><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status><version>7.0</version></content>
', '20091014175142', '20110128101732', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG51" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Mobile</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Area Mobile</text><text lang="en">Mobile Area</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Online la versione MOBILE del portale di Villamarina disegnata con una nuova interfaccia grafica, adatta alla navigazione su schermi di dimensioni ridotte. Il Portale Mobile è stato realizzato con la piattaforma jAPS 2.0.&#xD;
&#xD;
Il Portale Mobile rende disponibile le informazioni che risultano maggiormente utili a chi naviga sul web stando in movimento.&#xD;
&#xD;
Il Portale Mobile è disponibile in modalità multilingua: italiano, inglese.&#xD;
&#xD;
Il Portale Mobile rende disponibile le informazioni che risultano maggiormente utili a chi naviga sul web stando in movimento.</text><text lang="en">The MOBILE portal version of Villamarina is OnLine. The Mobile Portal is designed with a new graphical interface, suitable for "browsing" on small screens. The mobile portal is built on jAPS 2.0 Platform.&#xD;
&#xD;
The Mobile Portal is multi-languages: Italian, English.&#xD;
&#xD;
The Mobile Portal makes available the information most useful to users who surf the web being in the movement.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Online la versione <a href="#!P;mobile_home!#">MOBILE</a> del portale di Villamarina disegnata con una nuova interfaccia grafica, adatta alla &ldquo;navigazione&rdquo; su schermi di dimensioni ridotte. Il Portale Mobile &egrave; stato realizzato con la piattaforma jAPS 2.0.</p>
<p>Il Portale Mobile rende disponibile le informazioni che risultano maggiormente utili a chi naviga sul web stando in &ldquo;movimento&rdquo;.</p>
<p>Il Portale Mobile &egrave; disponibile in modalit&agrave; multilingua: italiano, inglese.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>The <a href="#!P;mobile_home!#">MOBILE</a> portal version of Villamarina is OnLine. The Mobile Portal is designed with a new graphical interface, suitable for &quot;browsing&quot; on small screens. The mobile portal is built on jAPS 2.0 Platform.</p>
<p>The Mobile Portal is multi-languages: Italian, English.</p>
<p>The Mobile Portal makes available the information most useful to users who surf the web being in the movement.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="143" lang="en" /><text lang="it">Mobile</text><text lang="en">Mobile</text></attribute><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status><version>7.0</version></content>
', 'free', '7.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG146', 'CNG', 'ePartecipation', 'DRAFT', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG146" typecode="CNG" typedescr="Contenuto generico"><descr>ePartecipation</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">ePartecipation</text><text lang="en">ePartecipation</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Il paradigma del Web 2.0 introduce le basi per una nuova modalità di partecipazione alla vita pubblica e di collaborazione tra gli utenti del web.&#xD;
&#xD;
Gli strumenti di e-Participation e e-Collaboration diventano il mezzo attraverso cui rafforzare il grado di coinvolgimento dei cittadini e di interazione tra gli utenti anche nelle fasi che concorrono a determinare i processi decisionali della vita sociale.</text><text lang="en">Participation has become a highly political issue over the last few years, and that eParticipation is seen as a major factor in this development.&#xD;
&#xD;
eParticipation is about reconnecting ordinary people with politics and policy-making and making the decision-making processes easier to understand and follow through the use of new Information and Communication Technologies (ICTs).</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Il paradigma del Web 2.0 introduce le basi per una nuova modalit&agrave; di partecipazione alla vita pubblica e di collaborazione tra gli utenti del web.</p>
<p>Gli strumenti di e-Participation e e-Collaboration diventano il mezzo attraverso cui rafforzare il grado di coinvolgimento dei cittadini e di interazione tra gli utenti anche nelle fasi che concorrono a determinare i processi decisionali della vita sociale.</p>
<p>Il portale implementa il paradigma di partecipazione e collaborazione alla conoscenza e alla condivisione delle informazioni attraverso strumenti fortemente interattivi e accessibili. La piattaforma jAPS&nbsp; consente inoltre di erogare i servizi secondo una logica multicanale e multi-dispositivo e facilitare l&rsquo;accesso ai dati e alle informazioni.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Participation has become a highly political issue over the last few years, and that eParticipation is seen as a major factor in this development.</p>
<p>eParticipation is about reconnecting ordinary people with politics and policy-making and making the decision-making processes easier to  understand and follow through the use of new Information and Communication Technologies (ICTs).</p>
<p><br />
The portal implements the paradigm of participation and collaboration to knowledge and information sharing through highly interactive and accessible services.</p>
<p>&nbsp;</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status><version>3.0</version></content>
', '20110119121846', '20110128102040', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG146" typecode="CNG" typedescr="Contenuto generico"><descr>ePartecipation</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">ePartecipation</text><text lang="en">ePartecipation</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Il paradigma del Web 2.0 introduce le basi per una nuova modalità di partecipazione alla vita pubblica e di collaborazione tra gli utenti del web.&#xD;
&#xD;
Gli strumenti di e-Participation e e-Collaboration diventano il mezzo attraverso cui rafforzare il grado di coinvolgimento dei cittadini e di interazione tra gli utenti anche nelle fasi che concorrono a determinare i processi decisionali della vita sociale.</text><text lang="en">Participation has become a highly political issue over the last few years, and that eParticipation is seen as a major factor in this development.&#xD;
&#xD;
eParticipation is about reconnecting ordinary people with politics and policy-making and making the decision-making processes easier to understand and follow through the use of new Information and Communication Technologies (ICTs).</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Il paradigma del Web 2.0 introduce le basi per una nuova modalit&agrave; di partecipazione alla vita pubblica e di collaborazione tra gli utenti del web.</p>
<p>Gli strumenti di e-Participation e e-Collaboration diventano il mezzo attraverso cui rafforzare il grado di coinvolgimento dei cittadini e di interazione tra gli utenti anche nelle fasi che concorrono a determinare i processi decisionali della vita sociale.</p>
<p>Il portale implementa il paradigma di partecipazione e collaborazione alla conoscenza e alla condivisione delle informazioni attraverso strumenti fortemente interattivi e accessibili. La piattaforma jAPS&nbsp; consente inoltre di erogare i servizi secondo una logica multicanale e multi-dispositivo e facilitare l&rsquo;accesso ai dati e alle informazioni.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Participation has become a highly political issue over the last few years, and that eParticipation is seen as a major factor in this development.</p>
<p>eParticipation is about reconnecting ordinary people with politics and policy-making and making the decision-making processes easier to  understand and follow through the use of new Information and Communication Technologies (ICTs).</p>
<p><br />
The portal implements the paradigm of participation and collaboration to knowledge and information sharing through highly interactive and accessible services.</p>
<p>&nbsp;</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status><version>3.0</version></content>
', 'free', '3.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG148', 'CNG', 'Intro Home per Credenziali', 'DRAFT', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG148" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Home per Credenziali</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Come loggarsi</text><text lang="en">How to sign in</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Cosa aspetti? Prova l''Area di Amministrazione!&#xD;
Scegli il link "Avanzata" e scopri la nuova veste grafica.&#xD;
Scopri quante cose puoi personalizzare, crea un nuovo contenuto, una nuova pagina o magari il tuo utente personale.&#xD;
Entra con Username: admin e Passowrd: adminadmin e poi fai quello che vuoi tu.</text><text lang="en">What are you waiting for? Try the Administration Area!&#xD;
Choose the "Advanced" link and enjoy the new design.&#xD;
Find out how many things you can customize, create new content, a new page or even your own user.&#xD;
Sign in with Username: admin and Password: adminadmin and then do what you want.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Cosa aspetti? Prova l''Area di Amministrazione!</p>
<p>Scegli il link &quot;Avanzata&quot; e scopri la nuova veste grafica.</p>
<p>Scopri quante cose puoi personalizzare, crea un nuovo contenuto, una nuova pagina o magari il tuo utente personale.</p>
<p>Entra con Username: admin e Passowrd: adminadmin e poi fai quello che vuoi tu.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>What are you waiting for? Try the Administration Area!</p>
<p>Choose the &quot;Advanced&quot; link and enjoy the new design.</p>
<p>Find out how many things you can customize, create new content, a new page or even your own user.</p>
<p>Sign in with Username: admin and Password: adminadmin and then do what you want.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status><version>7.0</version></content>
', '20110415113006', '20110415120449', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG148" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Home per Credenziali</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Come loggarsi</text><text lang="en">How to sign in</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Cosa aspetti? Prova l''Area di Amministrazione!&#xD;
Scegli il link "Avanzata" e scopri la nuova veste grafica.&#xD;
Scopri quante cose puoi personalizzare, crea un nuovo contenuto, una nuova pagina o magari il tuo utente personale.&#xD;
Entra con Username: admin e Passowrd: adminadmin e poi fai quello che vuoi tu.</text><text lang="en">What are you waiting for? Try the Administration Area!&#xD;
Choose the "Advanced" link and enjoy the new design.&#xD;
Find out how many things you can customize, create new content, a new page or even your own user.&#xD;
Sign in with Username: admin and Password: adminadmin and then do what you want.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Cosa aspetti? Prova l''Area di Amministrazione!</p>
<p>Scegli il link &quot;Avanzata&quot; e scopri la nuova veste grafica.</p>
<p>Scopri quante cose puoi personalizzare, crea un nuovo contenuto, una nuova pagina o magari il tuo utente personale.</p>
<p>Entra con Username: admin e Passowrd: adminadmin e poi fai quello che vuoi tu.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>What are you waiting for? Try the Administration Area!</p>
<p>Choose the &quot;Advanced&quot; link and enjoy the new design.</p>
<p>Find out how many things you can customize, create new content, a new page or even your own user.</p>
<p>Sign in with Username: admin and Password: adminadmin and then do what you want.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>DRAFT</status><version>7.0</version></content>
', 'free', '7.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG256', 'CNG', 'Intro Home per Credenziali', 'PUBLIC', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG256" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Home per Credenziali</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Come loggarsi</text><text lang="en">How to sign in</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Cosa aspetti? Prova l''Area di Amministrazione!&#xD;
Scegli il link "Avanzata" e scopri la nuova veste grafica.&#xD;
Scopri quante cose puoi personalizzare, crea un nuovo contenuto, una nuova pagina o magari il tuo utente personale.&#xD;
Entra con Username: admin e Password: adminadmin e poi fai quello che vuoi tu.</text><text lang="en">What are you waiting for? Try the Administration Area!&#xD;
Choose the "Advanced" link and enjoy the new design.&#xD;
Find out how many things you can customize, create new content, a new page or even your own user.&#xD;
Sign in with Username: admin and Password: adminadmin and then do what you want.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Cosa aspetti? Prova l''Area di Amministrazione!</p>
<p>Scegli il link &quot;Avanzata&quot; e scopri la nuova veste grafica.</p>
<p>Scopri quante cose puoi personalizzare, crea un nuovo contenuto, una nuova pagina o magari il tuo utente personale.</p>
<p>Entra con Username: <strong>admin</strong> e Password: <strong>adminadmin</strong> e poi fai quello che vuoi tu.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>What are you waiting for? Try the Administration Area!</p>
<p>Choose the &quot;Advanced&quot; link and enjoy the new design.</p>
<p>Find out how many things you can customize, create new content, a new page or even your own user.</p>
<p>Sign in with Username: <strong>admin</strong> and Password: <strong>adminadmin</strong> and then do what you want.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>PUBLIC</status><version>3.0</version><lastEditor>admin</lastEditor><created>20110415124748</created><lastModified>20110602194014</lastModified></content>
', '20110415124748', '20110602194014', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG256" typecode="CNG" typedescr="Contenuto generico"><descr>Intro Home per Credenziali</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Come loggarsi</text><text lang="en">How to sign in</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">Cosa aspetti? Prova l''Area di Amministrazione!&#xD;
Scegli il link "Avanzata" e scopri la nuova veste grafica.&#xD;
Scopri quante cose puoi personalizzare, crea un nuovo contenuto, una nuova pagina o magari il tuo utente personale.&#xD;
Entra con Username: admin e Password: adminadmin e poi fai quello che vuoi tu.</text><text lang="en">What are you waiting for? Try the Administration Area!&#xD;
Choose the "Advanced" link and enjoy the new design.&#xD;
Find out how many things you can customize, create new content, a new page or even your own user.&#xD;
Sign in with Username: admin and Password: adminadmin and then do what you want.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Cosa aspetti? Prova l''Area di Amministrazione!</p>
<p>Scegli il link &quot;Avanzata&quot; e scopri la nuova veste grafica.</p>
<p>Scopri quante cose puoi personalizzare, crea un nuovo contenuto, una nuova pagina o magari il tuo utente personale.</p>
<p>Entra con Username: <strong>admin</strong> e Password: <strong>adminadmin</strong> e poi fai quello che vuoi tu.</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>What are you waiting for? Try the Administration Area!</p>
<p>Choose the &quot;Advanced&quot; link and enjoy the new design.</p>
<p>Find out how many things you can customize, create new content, a new page or even your own user.</p>
<p>Sign in with Username: <strong>admin</strong> and Password: <strong>adminadmin</strong> and then do what you want.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>PUBLIC</status><version>3.0</version><lastEditor>admin</lastEditor><created>20110415124748</created><lastModified>20110602194014</lastModified></content>
', 'free', '3.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('NEW177', 'NEW', 'Online il Portale Mobile', 'PUBLIC', '<?xml version="1.0" encoding="UTF-8"?>
<content id="NEW177" typecode="NEW" typedescr="Notizia"><descr>Online il Portale Mobile</descr><groups mainGroup="free" /><categories><category id="newsletter_1" /><category id="newsletter_2" /><category id="tag2" /><category id="tag5" /><category id="tag1" /></categories><attributes><attribute name="Data" attributetype="Date"><date>20110615</date></attribute><attribute name="Titolo" attributetype="Text"><text lang="it">Online il Portale Mobile</text><text lang="en">Online the Mobile Portal</text></attribute><attribute name="Lancio" attributetype="Longtext"><text lang="it">Online il Portale del Comune di Villamarina realizzato con la piattaforma jAPS 2.0.</text><text lang="en">Online the Mobile Portal of Villamarina Municipality.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Online<strong> il Portale del Comune di Villamarina, </strong>realizzato con la <strong>piattaforma jAPS 2.0</strong>.</p>
<p>Nel portale istituzionale &egrave; possibile trovare tutte le informazioni relative al comune e alle sue attivit&agrave;: gli uffici, delibere e determine, bandi e concorsi e tanto altro.</p>
<p>Il nuovo portale &egrave; stato realizzato per dare una risposta all''altezza delle aspettative dei cittadini che ogni giorno si collegano ad internet per avere notizie ed informazioni aggiornate sull''amministrazione comunale.</p>
<p>Il sito si presenta con una veste <strong>grafica minimalista</strong> e molto leggera proprio per questo <strong>accattivante</strong> ed <strong>efficace</strong>.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Online the Mobile Portal of Villamarina Municipality, built with jAPS 2.0 Platform.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link"><attribute name="Riferimenti" attributetype="Link"><link type="content"><contentdest>CNG51</contentdest></link><text lang="it">Scopri i dettagli</text><text lang="en">Discover More</text></attribute></list><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>PUBLIC</status><version>5.0</version><lastEditor>admin</lastEditor><created>20110118183107</created><lastModified>20110524164633</lastModified></content>
', '20110118183107', '20110524164633', '<?xml version="1.0" encoding="UTF-8"?>
<content id="NEW177" typecode="NEW" typedescr="Notizia"><descr>Online il Portale Mobile</descr><groups mainGroup="free" /><categories><category id="newsletter_1" /><category id="newsletter_2" /><category id="tag2" /><category id="tag5" /><category id="tag1" /></categories><attributes><attribute name="Data" attributetype="Date"><date>20110615</date></attribute><attribute name="Titolo" attributetype="Text"><text lang="it">Online il Portale Mobile</text><text lang="en">Online the Mobile Portal</text></attribute><attribute name="Lancio" attributetype="Longtext"><text lang="it">Online il Portale del Comune di Villamarina realizzato con la piattaforma jAPS 2.0.</text><text lang="en">Online the Mobile Portal of Villamarina Municipality.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p>Online<strong> il Portale del Comune di Villamarina, </strong>realizzato con la <strong>piattaforma jAPS 2.0</strong>.</p>
<p>Nel portale istituzionale &egrave; possibile trovare tutte le informazioni relative al comune e alle sue attivit&agrave;: gli uffici, delibere e determine, bandi e concorsi e tanto altro.</p>
<p>Il nuovo portale &egrave; stato realizzato per dare una risposta all''altezza delle aspettative dei cittadini che ogni giorno si collegano ad internet per avere notizie ed informazioni aggiornate sull''amministrazione comunale.</p>
<p>Il sito si presenta con una veste <strong>grafica minimalista</strong> e molto leggera proprio per questo <strong>accattivante</strong> ed <strong>efficace</strong>.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p>Online the Mobile Portal of Villamarina Municipality, built with jAPS 2.0 Platform.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link"><attribute name="Riferimenti" attributetype="Link"><link type="content"><contentdest>CNG51</contentdest></link><text lang="it">Scopri i dettagli</text><text lang="en">Discover More</text></attribute></list><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>PUBLIC</status><version>5.0</version><lastEditor>admin</lastEditor><created>20110118183107</created><lastModified>20110524164633</lastModified></content>
', 'free', '5.0', 'admin');
INSERT INTO contents (contentid, contenttype, descr, status, workxml, created, lastmodified, onlinexml, maingroup, currentversion, lasteditor) VALUES ('CNG173', 'CNG', 'Accessibilità', 'READY', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG173" typecode="CNG" typedescr="Contenuto generico"><descr>Accessibilità</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Accessibilità</text><text lang="en">Web Accessibility</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">eAccessibility indica la capacità di sistemi, servizi e applicazioni ICT di essere accessibili in maniera semplice da utenti con disabilità.&#xD;
&#xD;
In particolare, per accessibilità web si indica la capacità di un sito web di essere acceduto efficacemente in termini di navigazione, fruizione dei contenuti e dei servizi da tutti gli utenti senza nessuna esclusione.&#xD;
A tali linee guida, ma soprattutto al principio democratico dell''eParticipation e eAccessibility, si è ispirato il portale.</text><text lang="en">eAccessibility is the ease use by people with disabilities of information and communication technologies.&#xD;
&#xD;
More specifically, Web accessibility means that people with disabilities can perceive, understand, navigate, and interact with the Web, and that they can contribute to the Web. Web accessibility also benefits others, including older people with changing abilities due to aging.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p><strong>eAccessibility</strong>  indica la capacit&agrave; di sistemi, servizi e applicazioni ICT di essere accessibili in maniera semplice da utenti con disabilit&agrave;.</p>
<p>In particolare, per accessibilit&agrave; web si indica la capacit&agrave; di un sito web di essere acceduto efficacemente  in termini di navigazione,  fruizione dei contenuti e dei servizi da tutti gli utenti senza nessuna esclusione.</p>
<p>Rendere un sito web accessibile significa permettere l''accesso all''informazione contenuta nel sito anche a persone con disabilit&agrave; di diverso tipo, anziani ma non solo : significa anche consentire a tutti di poter partecipare, gestire, condividere le proprie informazioni. A tal proposito il concetto di accessibilit&agrave; &egrave; legato fortemente a quello di usabilit&agrave;: &egrave; fondamentale che un utente sia capace di accedere ad un''informazione in maniera semplice, efficace ed efficiente.</p>
<p>A tali linee guida, ma soprattutto al principio democratico dell''<strong>eParticipation e eAccessibility</strong>, si &egrave; ispirato il portale.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p><strong>eAccessibility</strong>  is the ease use by people with disabilities of information and communication technologies.</p>
<p>More specifically<strong>, Web accessibility </strong>means that people with disabilities can perceive, understand, navigate, and interact with the Web, and that they can contribute to the Web. Web accessibility also benefits others, including older people with changing abilities due to aging.</p>
<p>The Portal is compatible with <strong>accessibility international standards</strong> like WCAG 2.0 and specific governments laws allowing <strong>citizen eParticipation</strong>.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="174" lang="en" /><text lang="it">Portale Villamarina</text><text lang="en">Villamarina Portal</text></attribute><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><version>7.0</version></content>
', '20110118173705', '20110128142829', '<?xml version="1.0" encoding="UTF-8"?>
<content id="CNG173" typecode="CNG" typedescr="Contenuto generico"><descr>Accessibilità</descr><groups mainGroup="free" /><categories /><attributes><attribute name="Titolo" attributetype="Text"><text lang="it">Accessibilità</text><text lang="en">Web Accessibility</text></attribute><attribute name="Abstract" attributetype="Longtext"><text lang="it">eAccessibility indica la capacità di sistemi, servizi e applicazioni ICT di essere accessibili in maniera semplice da utenti con disabilità.&#xD;
&#xD;
In particolare, per accessibilità web si indica la capacità di un sito web di essere acceduto efficacemente in termini di navigazione, fruizione dei contenuti e dei servizi da tutti gli utenti senza nessuna esclusione.&#xD;
A tali linee guida, ma soprattutto al principio democratico dell''eParticipation e eAccessibility, si è ispirato il portale.</text><text lang="en">eAccessibility is the ease use by people with disabilities of information and communication technologies.&#xD;
&#xD;
More specifically, Web accessibility means that people with disabilities can perceive, understand, navigate, and interact with the Web, and that they can contribute to the Web. Web accessibility also benefits others, including older people with changing abilities due to aging.</text></attribute><attribute name="CorpoTesto" attributetype="Hypertext"><hypertext lang="it"><![CDATA[<p><strong>eAccessibility</strong>  indica la capacit&agrave; di sistemi, servizi e applicazioni ICT di essere accessibili in maniera semplice da utenti con disabilit&agrave;.</p>
<p>In particolare, per accessibilit&agrave; web si indica la capacit&agrave; di un sito web di essere acceduto efficacemente  in termini di navigazione,  fruizione dei contenuti e dei servizi da tutti gli utenti senza nessuna esclusione.</p>
<p>Rendere un sito web accessibile significa permettere l''accesso all''informazione contenuta nel sito anche a persone con disabilit&agrave; di diverso tipo, anziani ma non solo : significa anche consentire a tutti di poter partecipare, gestire, condividere le proprie informazioni. A tal proposito il concetto di accessibilit&agrave; &egrave; legato fortemente a quello di usabilit&agrave;: &egrave; fondamentale che un utente sia capace di accedere ad un''informazione in maniera semplice, efficace ed efficiente.</p>
<p>A tali linee guida, ma soprattutto al principio democratico dell''<strong>eParticipation e eAccessibility</strong>, si &egrave; ispirato il portale.</p>
<p>&nbsp;</p>]]></hypertext><hypertext lang="en"><![CDATA[<p><strong>eAccessibility</strong>  is the ease use by people with disabilities of information and communication technologies.</p>
<p>More specifically<strong>, Web accessibility </strong>means that people with disabilities can perceive, understand, navigate, and interact with the Web, and that they can contribute to the Web. Web accessibility also benefits others, including older people with changing abilities due to aging.</p>
<p>The Portal is compatible with <strong>accessibility international standards</strong> like WCAG 2.0 and specific governments laws allowing <strong>citizen eParticipation</strong>.</p>]]></hypertext></attribute><attribute name="Immagine_1" attributetype="Image"><resource resourcetype="Image" id="174" lang="en" /><text lang="it">Portale Villamarina</text><text lang="en">Villamarina Portal</text></attribute><attribute name="Immagine_2" attributetype="Image" /><list attributetype="Monolist" name="Riferimenti" nestedtype="Link" /><list attributetype="Monolist" name="Allegati" nestedtype="Attach" /></attributes><status>READY</status><version>7.0</version></content>
', 'free', '7.0', 'admin');


--
-- TOC entry 1827 (class 0 OID 1823054)
-- Dependencies: 1507
-- Data for Name: contentsearch; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW177', 'Data', NULL, '2011-06-15', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW177', 'Titolo', 'Online the Mobile Portal', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW177', 'Titolo', 'Online il Portale Mobile', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW3', 'Data', NULL, '2011-11-21', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW3', 'Titolo', 'Online the Portal of Villamarina Municipality', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW3', 'Titolo', 'Online il Portale del Comune di Villamarina', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW27', 'Data', NULL, '2011-07-20', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW27', 'Titolo', 'Folk Music Festival', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW27', 'Titolo', 'Festival della canzone popolare', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW23', 'Data', NULL, '2011-10-21', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW23', 'Titolo', 'Ground Rent Contribution', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW23', 'Titolo', 'Contributo canone di locazione 2011', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB4', 'Numero', NULL, NULL, 133, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB4', 'Data', NULL, '2011-09-20', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB30', 'Numero', NULL, NULL, 20, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB30', 'Data', NULL, '2011-10-04', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB32', 'Numero', NULL, NULL, 120, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB32', 'Data', NULL, '2011-07-01', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB36', 'Numero', NULL, NULL, 15, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB36', 'Data', NULL, '2011-07-16', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG173', 'Titolo', 'Web Accessibility', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG173', 'Titolo', 'Accessibilità', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG256', 'Titolo', 'How to sign in', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG256', 'Titolo', 'Come loggarsi', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG54', 'Titolo', 'Delibere', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG55', 'Titolo', 'Bandi', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG53', 'Titolo', 'Notizie', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG29', 'Titolo', 'Elenco delle Delibere di Consiglio presenti nel portale del Comune', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG28', 'Titolo', 'Elenco delle Delibere di Giunta presenti nel portale del Comune', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG17', 'Titolo', 'Mayor', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG17', 'Titolo', 'Sindaco', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG18', 'Titolo', 'Council', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG18', 'Titolo', 'Giunta Comunale', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG19', 'Titolo', 'Consiglio Comunale', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG49', 'Titolo', 'Public Relations Office', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG49', 'Titolo', 'URP - Ufficio Relazioni con il Pubblico', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG14', 'Titolo', 'Documents Archive', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG14', 'Titolo', 'Archivio Modulistica', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG11', 'Titolo', 'Announcements Archive', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG11', 'Titolo', 'Archivio Bandi', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG12', 'Titolo', 'News Archive', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG12', 'Titolo', 'Archivio Notizie', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG13', 'Titolo', 'Decisions Archive', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG13', 'Titolo', 'Archivio Delibere', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG2', 'Titolo', 'Lorem Ipsum dolor sit amet', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG20', 'Titolo', 'Statute', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG20', 'Titolo', 'Statuto', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG16', 'Titolo', 'Internal Servlet', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG16', 'Titolo', 'Internal Servlet', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG15', 'Titolo', 'Application Service Example', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG15', 'Titolo', 'Esempio Servizio Applicativo', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG145', 'Titolo', 'Web Accessibility', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG145', 'Titolo', 'Accessibilità', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG51', 'Titolo', 'Mobile Area', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG51', 'Titolo', 'Area Mobile', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG146', 'Titolo', 'ePartecipation', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG146', 'Titolo', 'ePartecipation', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG148', 'Titolo', 'How to sign in', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG148', 'Titolo', 'Come loggarsi', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND39', 'DataInizio', NULL, '2011-02-01', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND39', 'DataFine', NULL, '2011-11-30', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND48', 'DataInizio', NULL, '2011-02-28', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND48', 'DataFine', NULL, '2011-10-27', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND5', 'DataInizio', NULL, '2011-03-03', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND5', 'DataFine', NULL, '2011-11-14', NULL, NULL);
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL42', 'Oggetto', 'Registry - Request Identity Card valid for foreign travel', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL42', 'Oggetto', 'Anagrafe - Richiesta Carta Identità valida per espatrio', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL44', 'Oggetto', 'Civil Status Self Certification Form', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL44', 'Oggetto', 'Modulo Autocertificazione Stato Civile', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL7', 'Oggetto', 'Residence Self-certification Form', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL7', 'Oggetto', 'Modulo Autocertificazione Residenza', NULL, NULL, 'it');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL46', 'Oggetto', 'Tax - Request ICI refund', NULL, NULL, 'en');
INSERT INTO contentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL46', 'Oggetto', 'Tributi - Richiesta rimborso ICI', NULL, NULL, 'it');


--
-- TOC entry 1828 (class 0 OID 1823057)
-- Dependencies: 1508
-- Data for Name: localstrings; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PAGE', 'en', 'page');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PAGE', 'it', 'pagina');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PAGE_MODEL', 'en', 'page model');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PAGE_MODEL', 'it', 'modello pagina');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PAGE_TITLE', 'en', 'page title');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PAGE_TITLE', 'it', 'titolo pagina');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('MAIN_SUBTITLE', 'en', 'Official Site');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('MAIN_SUBTITLE', 'it', 'Sito Istituzionale');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('DISCLAIMER', 'en', 'Warning!');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('DISCLAIMER', 'it', 'Attenzione!');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('DISCLAIMER_NOTE', 'en', 'You are browsing with Microsoft Internet Explorer 6.<br />Your browser is old, way too easy for virus makers, and it doesn''t know the standards which are the basics of the World Wide Web.<br />More, this web portal has not been written trying to fix the bugs of your browser.<br />A simple solution might be for you to <a href="http://www.microsoft.com/windows/downloads/ie/getitnow.mspx">get version 7 or newer</a>.<br />You might also like to use a different browser instead.');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('DISCLAIMER_NOTE', 'it', 'Stai utilizzando Microsoft Internet Explorer 6.<br />Il tuo browser è vecchio, una pacchia per i creatori di virus informatici, e irrispettoso degli standard che sono alla base del World Wide Web.<br />Inoltre questo portale non è stato sviluppato nel tentativo di risolvere i problemi del tuo browser.<br />Una soluzione facile per te, sarebbe quella di <a href="http://www.microsoft.com/windows/downloads/ie/getitnow.mspx">aggiornare il tuo browser alla versione 7 o successive</a>.<br />Oppure potresti decidere di utilizzare un altro browser.');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH', 'en', 'Search');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH', 'it', 'Cerca');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('YOU_ARE_HERE', 'en', 'You are here');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('YOU_ARE_HERE', 'it', 'Sei qui');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USERNAME', 'en', 'username');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USERNAME', 'it', 'utente');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('WELCOME', 'en', 'Welcome');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('WELCOME', 'it', 'Benvenuto/a');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_DATE_ACCESS_LAST', 'en', 'Last login');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_DATE_ACCESS_LAST', 'it', 'Ultimo accesso');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_DATE_CREATION', 'en', 'Registered');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_DATE_CREATION', 'it', 'Registrato');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_DATE_PASSWORD_CHANGE_LAST', 'en', 'Last password change');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_DATE_PASSWORD_CHANGE_LAST', 'it', 'Ultimo rinnovo password');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LOGOUT', 'en', 'Exit');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LOGOUT', 'it', 'Esci');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ADMINISTRATION', 'en', 'Administration');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ADMINISTRATION', 'it', 'Gestisci');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_STATUS_EXPIRED', 'en', 'Expired account');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_STATUS_EXPIRED', 'it', 'Utenza scaduta');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_STATUS_CREDENTIALS_INVALID', 'en', 'Invalid credentials.');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_STATUS_CREDENTIALS_INVALID', 'it', 'Username o password non corretti.');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_RESULTS', 'en', 'Search Result');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_RESULTS', 'it', 'Risultati della Ricerca');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCHED_FOR', 'en', 'You searched for');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCHED_FOR', 'it', 'Hai cercato');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_RESULTS_INTRO', 'en', 'Found');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_RESULTS_INTRO', 'it', 'Sono stati trovati');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_RESULTS_OUTRO', 'en', 'matchings');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_RESULTS_OUTRO', 'it', 'risultati');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LINKS', 'en', 'Links');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LINKS', 'it', 'Riferimenti');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LATEST_NEW', 'en', 'Latest News');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LATEST_NEW', 'it', 'Ultime Notizie');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('NEWS_ARCHIVE', 'en', 'Archive News');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('NEWS_ARCHIVE', 'it', 'Archivio Notizie');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('VAI_PAGINA', 'en', 'Go to page');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('VAI_PAGINA', 'it', 'Vai alla pagina');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('RESERVED_AREA', 'en', 'Reserved area');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('RESERVED_AREA', 'it', 'Area riservata');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('DOWNLOAD_THIS', 'en', 'Download this');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('DOWNLOAD_THIS', 'it', 'Scarica');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SKIP_ALL', 'en', 'Go to Contents');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SKIP_ALL', 'it', 'Salta ai Contenuti');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('MENU_NAVIGATION', 'en', 'Navigation menù');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('MENU_NAVIGATION', 'it', 'Menù di navigazione');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LANGUAGE', 'en', 'Language');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LANGUAGE', 'it', 'Lingua');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_ENGINE', 'en', 'Search Engine');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_ENGINE', 'it', 'Ricerca');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CONTENTS', 'en', 'Contents');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CONTENTS', 'it', 'Contenuti');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LOGIN', 'en', 'Login');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LOGIN', 'it', 'Login');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LATEST_NEWS', 'en', 'Latest News');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LATEST_NEWS', 'it', 'Ultime Notizie');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('BACK_TO_THE_TOP', 'en', 'Back to the top');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('BACK_TO_THE_TOP', 'it', 'Torna all''inizio');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SKIP', 'en', 'Skip');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SKIP', 'it', 'Salta');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ALLA', 'en', 'at the');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ALLA', 'it', 'alla');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('AL', 'en', 'at the');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('AL', 'it', 'al');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('AI', 'en', 'at the');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('AI', 'it', 'ai');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ALLE', 'en', 'at the');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ALLE', 'it', 'alle');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SERVICES', 'en', 'The following services are available on this page');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SERVICES', 'it', 'In questa pagina sono disponibili');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CATEGORIES', 'en', 'Categories');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CATEGORIES', 'it', 'Categorie');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CARD_HOLDER', 'en', 'Holder');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CARD_HOLDER', 'it', 'Titolare');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_CARDS', 'en', 'Search Cards');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_CARDS', 'it', 'Cerca Scheda');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LABEL_PAGE', 'en', 'Page');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LABEL_PAGE', 'it', 'Pagina');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CARDS_NUMBER', 'en', 'Number Cards');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CARDS_NUMBER', 'it', 'Numero Schede');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PREV', 'en', 'Previous');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PREV', 'it', 'Precedenti');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('NEXT', 'en', 'Next');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('NEXT', 'it', 'Successivi');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('EDIT', 'en', 'Edit');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('EDIT', 'it', 'Modifica');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('VIEW_CARD', 'en', 'Details');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('VIEW_CARD', 'it', 'Dettagli');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CARD_NOTE', 'en', 'Note');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CARD_NOTE', 'it', 'Note');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('BACK_TO_CARDS_LIST', 'en', 'Returned to the list');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('BACK_TO_CARDS_LIST', 'it', 'Torna alla lista');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LATEST_BANDI', 'en', 'Latest Announcements');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LATEST_BANDI', 'it', 'Ultimi Bandi');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LATEST_DELIBERE', 'en', 'Latest Decisions');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LATEST_DELIBERE', 'it', 'Ultime Delibere');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PASSWORD', 'en', 'password');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PASSWORD', 'it', 'password');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ATTACHES', 'en', 'Attachments');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ATTACHES', 'it', 'Allegati');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PAGE_NOT_FOUND', 'en', 'Page not found');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PAGE_NOT_FOUND', 'it', 'Pagina non trovata');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('GENERIC_ERROR', 'en', 'Generic Error');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('GENERIC_ERROR', 'it', 'Errore Generico');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CNG_Image2_OgnlErrorMessage', 'en', 'Image 2 can be inserted if Image 1 is valued');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CNG_Image2_OgnlErrorMessage', 'it', 'L''immagine 2 può essere inserita se presente immagine 1');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('MAIN_TITLE', 'en', 'Villamarina Municipality');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('MAIN_TITLE', 'it', 'Comune di Villamarina');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CARD_DESCRIPTION', 'en', 'Area Pass');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CARD_DESCRIPTION', 'it', 'Zona Pass');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CARD_CREATION_DATE', 'en', 'Release Date');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CARD_CREATION_DATE', 'it', 'Data Rilascio');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_NOT_ALLOWED', 'it', 'Utente non autorizzato');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('USER_NOT_ALLOWED', 'en', 'User not allowed');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_NOTHING_FOUND', 'en', 'Nothing found.');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_NOTHING_FOUND', 'it', 'Non è stato trovato alcun risultato');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_BASIC', 'it', 'Normale');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_BASIC', 'en', 'Normal');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_MINT', 'it', 'Avanzata');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_MINT', 'en', 'Advanced');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_BASIC_GOTO', 'it', 'Accedi con client normale');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_BASIC_GOTO', 'en', 'Go to the administration with normal client');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_MINT_GOTO', 'it', 'Accedi con client avanzato');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_MINT_GOTO', 'en', 'Go to the administration with advanced client');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('COPYRIGHT', 'en', '<span lang="en">Copyright &copy; Tzente srl 2011</span>');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('COPYRIGHT', 'it', '<span lang="en">Copyright &copy; Tzente srl 2011</span>');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CREDITS_POWERED_BY', 'en', '<span lang="en">Powered by </span><a href="http://www.japsportal.org/"><span lang="en">jAPS 2.0 entando &ndash; Java Agile Portal System, version 2.2</span></a>');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CREDITS_POWERED_BY', 'it', '<span lang="en">Powered by </span><a href="http://www.japsportal.org/"><span lang="en">jAPS 2.0 entando &ndash; Java Agile Portal System, version 2.2</span></a>');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PAGE_DETAILS', 'en', 'Page Details');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('PAGE_DETAILS', 'it', 'Dettagli della Pagina');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('EDIT_THIS_PAGE', 'en', 'Manage this Page');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('EDIT_THIS_PAGE', 'it', 'Gestione Pagina');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('DATE_FROM', 'en', 'From');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('DATE_FROM', 'it', 'Da');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('DATE_TO', 'en', 'To');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('DATE_TO', 'it', 'A');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('TEXT', 'en', 'Text');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('TEXT', 'it', 'Testo');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ALL', 'en', 'All');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ALL', 'it', 'Tutte');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('NUMBER_FROM', 'en', 'From');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('NUMBER_FROM', 'it', 'Da');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('NUMBER_TO', 'en', 'To');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('NUMBER_TO', 'it', 'A');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('EDIT_THIS_CONTENT', 'en', 'Edit this Content');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('EDIT_THIS_CONTENT', 'it', 'Modifica il Contenuto');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_FOR', 'en', 'Search for');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('SEARCH_FOR', 'it', 'Cerca per');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('YES', 'en', 'Yes');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('YES', 'it', 'Si');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('NO', 'en', 'No');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('NO', 'it', 'No');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('BOTH', 'en', 'Both');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('BOTH', 'it', 'Entrambi');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('IGNORE', 'en', 'Ignore this field');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('IGNORE', 'it', 'Ignora questo campo');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CATEGORY', 'en', 'Category');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('CATEGORY', 'it', 'Categoria');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ERRORS', 'en', 'Errors');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('ERRORS', 'it', 'Errori');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LIST_VIEWER_EMPTY', 'en', 'No results found. Check your search filters.');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('LIST_VIEWER_EMPTY', 'it', 'Nessun risultato trovato. Controlla i tuoi filtri di ricerca.');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('END', 'en', 'To');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('END', 'it', 'Fino a');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('START', 'en', 'From');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('START', 'it', 'Da');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('jacms_LIST_VIEWER_INVALID_FORMAT', 'en', 'has a format that is not valid.');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('jacms_LIST_VIEWER_INVALID_FORMAT', 'it', 'ha un formato che risulta non valido.');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('jacms_LIST_VIEWER_INVALID_RANGE', 'en', 'has a value not consistent. Check and start a new search.');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('jacms_LIST_VIEWER_INVALID_RANGE', 'it', 'ha un valore non coerente. Ricontrolla ed effettua una nuova ricerca.');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('jacms_LIST_VIEWER_FIELD', 'en', 'The field');
INSERT INTO localstrings (keycode, langcode, stringvalue) VALUES ('jacms_LIST_VIEWER_FIELD', 'it', 'Il campo');


--
-- TOC entry 1829 (class 0 OID 1823063)
-- Dependencies: 1509
-- Data for Name: pagemodels; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO pagemodels (code, descr, frames, plugincode) VALUES ('internal', 'Internal Page', '<frames>
	<frame pos="0">
		<descr>Choose Language</descr>
		<defaultShowlet code="language_choose" />
	</frame>
	<frame pos="1">
		<descr>Search Form</descr>
		<defaultShowlet code="search_form" />
	</frame>
	<frame pos="2">
		<descr>Breadcrumbs</descr>
		<defaultShowlet code="navigation_breadcrumbs" />
	</frame>
	<frame pos="3">
		<descr>First Column: Box 1</descr>
		<defaultShowlet code="navigation_menu">
			<properties>
				<property key="navSpec">code(comune).subtree(1)+code(trasparenza).subtree(1)+code(servizi_online).subtree(1)</property>
			</properties>
		</defaultShowlet>		
	</frame>
	<frame pos="4">
		<descr>First Column: Box 2</descr>
	</frame>
	<frame pos="5">
		<descr>First Column: Box 3</descr>
	</frame>
	<frame pos="6" main="true">
		<descr>Main Column: Box 1</descr>
	</frame>
	<frame pos="7">
		<descr>Main Column: Box 2</descr>
	</frame>
	<frame pos="8">
		<descr>Main Column: Box 3</descr>
	</frame>
	<frame pos="9">
		<descr>Main Column: Box 4</descr>
	</frame>	
	<frame pos="10">
		<descr>Main Column: Box 5</descr>
	</frame>
	<frame pos="11">
		<descr>Third Column: Box 1</descr>
	</frame>
	<frame pos="12">
		<descr>Third Column: Box 2</descr>
		<defaultShowlet code="news_latest" />
	</frame>
	<frame pos="13">
		<descr>Third Column: Box 3</descr>
	</frame>		
</frames>', NULL);
INSERT INTO pagemodels (code, descr, frames, plugincode) VALUES ('home', 'Home Page', '<frames>
	<frame pos="0">
		<descr>Choose Language</descr>
		<defaultShowlet code="language_choose" />
	</frame>
	<frame pos="1">
		<descr>Search Form</descr>
		<defaultShowlet code="search_form" />
	</frame>
	<frame pos="2">
		<descr>Breadcrumbs</descr>
		<defaultShowlet code="navigation_breadcrumbs" />
	</frame>
	<frame pos="3">
		<descr>First Column: Box 1</descr>
		<defaultShowlet code="navigation_menu">
			<properties>
				<property key="navSpec">code(comune).subtree(1)+code(trasparenza).subtree(1)+code(servizi_online).subtree(1)</property>
			</properties>
		</defaultShowlet>		
	</frame>
	<frame pos="4">
		<descr>First Column: Box 2</descr>
	</frame>
	<frame pos="5">
		<descr>First Column: Box 3</descr>
	</frame>
	<frame pos="6">
		<descr>Main Column: Box 1</descr>
	</frame>
	<frame pos="7">
		<descr>Main Column: Box 2</descr>
	</frame>
	<frame pos="8">
		<descr>Main Column: Box 3</descr>		
	</frame>
	<frame pos="9">
		<descr>Main Column: Box 4</descr>
		<defaultShowlet code="bandi_latest" />	
	</frame>	
	<frame pos="10">
		<descr>Main Column: Box 5</descr>
		<defaultShowlet code="delibere_latest" />
	</frame>
	<frame pos="11">
		<descr>Third Column: Box 1</descr>
		<defaultShowlet code="login_form" />
	</frame>
	<frame pos="12">
		<descr>Third Column: Box 2</descr>
		<defaultShowlet code="news_latest" />
	</frame>
	<frame pos="13">
		<descr>Third Column: Box 3</descr>
	</frame>		
</frames>', NULL);
INSERT INTO pagemodels (code, descr, frames, plugincode) VALUES ('mobile', 'Mobile Page', '<frames>
	<frame pos="0">
		<descr>Choose Language</descr>
		<defaultShowlet code="language_choose" />
	</frame>
	<frame pos="1">
		<descr>Breadcrumbs</descr>
		<defaultShowlet code="navigation_breadcrumbs" />
	</frame>
	<frame pos="2" main="true">
		<descr>Main Column: Box 1</descr>
	</frame>
	<frame pos="3">
		<descr>Main Column: Box 2</descr>
	</frame>
	<frame pos="4">
		<descr>Main Column: Box 3</descr>
	</frame>
	<frame pos="5">
		<descr>Main Column: Box 4</descr>
	</frame>
	<frame pos="6">
		<descr>Main Column: Box 5</descr>
	</frame>
	<frame pos="7">
		<descr>Main Column: Box 6</descr>
	</frame>
</frames>', NULL);


--
-- TOC entry 1830 (class 0 OID 1823069)
-- Dependencies: 1510
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('errorpage', 'service', 5, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Error page</property>
<property key="it">Pagina di errore</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('servizi_online', 'homepage', 4, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Online Services</property>
<property key="it">Servizi Online</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('service', 'homepage', 5, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Service</property>
<property key="it">Pagine di Servizio</property>
</properties>

', 'free', 0, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('notfound', 'service', 4, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Page not found</property>
<property key="it">Pagina non trovata</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('homepage', 'homepage', -1, 'home', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Home</property>
<property key="it">Home</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('search_result', 'service', 4, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Search Result</property>
<property key="it">Risultati della Ricerca</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('delibere_giunta', 'delibere', 2, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Delibere di Giunta</property>
<property key="it">Delibere di Giunta</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('delibere_consiglio', 'delibere', 3, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Delibere di Consiglio</property>
<property key="it">Delibere di Consiglio</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('notizie', 'trasparenza', 1, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">News</property>
<property key="it">Notizie</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('comune', 'homepage', 2, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Municipality</property>
<property key="it">Il Comune</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('trasparenza', 'homepage', 3, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Information</property>
<property key="it">Trasparenza</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('contatti', 'homepage', 5, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Contact</property>
<property key="it">Contatti</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('sindaco', 'comune', 1, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Mayor</property>
<property key="it">Sindaco</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('giunta_comunale', 'comune', 2, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Council</property>
<property key="it">Giunta Comunale</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('statuto', 'comune', 4, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Statute</property>
<property key="it">Statuto</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('consiglio_comunale', 'comune', 3, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Municipal Council</property>
<property key="it">Consiglio Comunale</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('bandi', 'trasparenza', 3, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Announcements</property>
<property key="it">Bandi</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('delibere', 'trasparenza', 2, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Decisions</property>
<property key="it">Delibere</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('moduli', 'servizi_online', 1, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Documents</property>
<property key="it">Modulistica</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('urp', 'contatti', 1, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Public Relations Office</property>
<property key="it">URP - Ufficio Relazioni con il Pubblico</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('login', 'service', 6, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Login</property>
<property key="it">Pagina di login</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('autocertificazioni', 'servizi_online', 2, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Self Certification</property>
<property key="it">Certificazioni</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile', 'homepage', 6, 'home', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">MOBILE</property>
<property key="it">MOBILE</property>
</properties>

', 'free', 0, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile_comune', 'mobile_home', 1, 'mobile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Council</property>
<property key="it">Il Comune</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile_sindaco', 'mobile_comune', 1, 'mobile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Mayor</property>
<property key="it">Sindaco</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile_trasparenza', 'mobile_home', 2, 'mobile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Information</property>
<property key="it">Trasparenza</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile_home', 'mobile', 1, 'mobile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Mobile Home</property>
<property key="it">Home Mobile</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile_giunta_comunale', 'mobile_comune', 2, 'mobile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Council</property>
<property key="it">Giunta Comunale</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('dlview', 'moduli', 1, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Document Details</property>
<property key="it">Dettaglio Modulistica</property>
</properties>

', 'free', 1, '<?xml version="1.0" encoding="UTF-8"?>
<config>
  <useextratitles>true</useextratitles>
</config>

');
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('newsview', 'notizie', 1, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Read the news</property>
<property key="it">Leggi la notizia</property>
</properties>

', 'free', 1, '<?xml version="1.0" encoding="UTF-8"?>
<config>
  <useextratitles>true</useextratitles>
</config>

');
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('bandoview', 'bandi', 1, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Announcements Details</property>
<property key="it">Dettagli del bando</property>
</properties>

', 'free', 1, '<?xml version="1.0" encoding="UTF-8"?>
<config>
  <useextratitles>true</useextratitles>
</config>

');
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile_consiglio_comunale', 'mobile_comune', 3, 'mobile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Municipal Council</property>
<property key="it">Consiglio Comunale</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile_notizie', 'mobile_trasparenza', 1, 'mobile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">News</property>
<property key="it">Notizie</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile_delibere', 'mobile_trasparenza', 2, 'mobile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Decision</property>
<property key="it">Delibere</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile_bandi', 'mobile_trasparenza', 3, 'mobile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Announcements</property>
<property key="it">Bandi</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile_service', 'mobile_home', 3, 'mobile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Service Pages</property>
<property key="it">Pagine di Servizio</property>
</properties>

', 'free', 0, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('mobile_contentview', 'mobile_service', 1, 'mobile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">The Content</property>
<property key="it">Leggi il contenuto</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('simview', 'service', 7, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Image details</property>
<property key="it">Dettagli Scheda Immagine</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('old_town_traffic_pass', 'servizi_online', 3, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Limited Traffic Zone Pass</property>
<property key="it">Pass ZTL</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('old_town_traffic_pass_int', 'old_town_traffic_pass', 1, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Limited Traffic Zone Pass</property>
<property key="it">Pass ZTL</property>
</properties>

', 'free', 1, NULL);
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('contentview', 'service', 5, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Read the full article</property>
<property key="it">Leggi il contenuto</property>
</properties>

', 'free', 1, '<?xml version="1.0" encoding="UTF-8"?>
<config>
  <useextratitles>true</useextratitles>
</config>

');
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('deliberaview', 'delibere', 1, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Decision Details</property>
<property key="it">Dettaglio della delibera</property>
</properties>

', 'free', 0, '<?xml version="1.0" encoding="UTF-8"?>
<config>
  <useextratitles>true</useextratitles>
</config>

');
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('faqview', 'service', 8, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Faq</property>
<property key="it">Faq</property>
</properties>

', 'free', 1, '<?xml version="1.0" encoding="UTF-8"?>
<config>
  <useextratitles>true</useextratitles>
</config>

');
INSERT INTO pages (code, parentcode, pos, modelcode, titles, groupcode, showinmenu, extraconfig) VALUES ('rssview', 'service', 9, 'internal', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Read the insight</property>
<property key="it">Leggi l''approfondimento</property>
</properties>

', 'free', 1, '<?xml version="1.0" encoding="UTF-8"?>
<config>
  <useextratitles>true</useextratitles>
</config>

');


--
-- TOC entry 1831 (class 0 OID 1823075)
-- Dependencies: 1511
-- Data for Name: resourcerelations; Type: TABLE DATA; Schema: public; Owner: agile
--



--
-- TOC entry 1832 (class 0 OID 1823078)
-- Dependencies: 1512
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('22', 'Attach', 'Statuto', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="22"><descr>Statuto</descr><groups mainGroup="free" /><categories /><masterfile>Statuto_Villamarina.pdf</masterfile><instance><size>0</size><filename>Statuto_Villamarina.pdf</filename><mimetype>application/pdf</mimetype><weight>19 Kb</weight></instance></resource>
', 'Statuto_Villamarina.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('47', 'Attach', 'Bando Fornitura Cancelleria', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="47"><descr>Bando Fornitura Cancelleria</descr><groups mainGroup="free" /><categories /><masterfile>Bando_fornitura_cancelleria.pdf</masterfile><instance><size>0</size><filename>Bando_fornitura_cancelleria.pdf</filename><mimetype>application/pdf</mimetype><weight>24 Kb</weight></instance></resource>
', 'Bando_fornitura_cancelleria.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('37', 'Attach', 'Bando Lavori Manutenzione Istituto Nautico', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="37"><descr>Bando Lavori Manutenzione Istituto Nautico</descr><groups mainGroup="free" /><categories /><masterfile>Bando_manutenzione_istituto_nautico.pdf</masterfile><instance><size>0</size><filename>Bando_manutenzione_istituto_nautico.pdf</filename><mimetype>application/pdf</mimetype><weight>25 Kb</weight></instance></resource>
', 'Bando_manutenzione_istituto_nautico.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('24', 'Attach', 'Bando locazione', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="24"><descr>Bando locazione</descr><groups mainGroup="free" /><categories /><masterfile>Bando_canone_locazione.pdf</masterfile><instance><size>0</size><filename>Bando_canone_locazione.pdf</filename><mimetype>application/pdf</mimetype><weight>17 Kb</weight></instance></resource>
', 'Bando_canone_locazione.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('38', 'Attach', 'Bando Servizio Civile', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="38"><descr>Bando Servizio Civile</descr><groups mainGroup="free" /><categories /><masterfile>Bando_servizio_civile.pdf</masterfile><instance><size>0</size><filename>Bando_servizio_civile.pdf</filename><mimetype>application/pdf</mimetype><weight>29 Kb</weight></instance></resource>
', 'Bando_servizio_civile.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('33', 'Attach', 'Delibera 120', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="33"><descr>Delibera 120</descr><groups mainGroup="free" /><categories /><masterfile>Delibera_120.pdf</masterfile><instance><size>0</size><filename>Delibera_120.pdf</filename><mimetype>application/pdf</mimetype><weight>16 Kb</weight></instance></resource>
', 'Delibera_120.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('31', 'Attach', 'Delibera 133', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="31"><descr>Delibera 133</descr><groups mainGroup="free" /><categories /><masterfile>Delibera_133.pdf</masterfile><instance><size>0</size><filename>Delibera_133.pdf</filename><mimetype>application/pdf</mimetype><weight>16 Kb</weight></instance></resource>
', 'Delibera_133.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('35', 'Attach', 'Delibera 15', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="35"><descr>Delibera 15</descr><groups mainGroup="free" /><categories /><masterfile>Delibera_15.pdf</masterfile><instance><size>0</size><filename>Delibera_15.pdf</filename><mimetype>application/pdf</mimetype><weight>16 Kb</weight></instance></resource>
', 'Delibera_15.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('34', 'Attach', 'Delibera 20', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="34"><descr>Delibera 20</descr><groups mainGroup="free" /><categories /><masterfile>Delibera_20.pdf</masterfile><instance><size>0</size><filename>Delibera_20.pdf</filename><mimetype>application/pdf</mimetype><weight>16 Kb</weight></instance></resource>
', 'Delibera_20.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('43', 'Attach', 'Modulo Autocertificazione Stato Civile', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="43"><descr>Modulo Autocertificazione Stato Civile</descr><groups mainGroup="free" /><categories /><masterfile>Modulo_Certificato_Stato_Civile.pdf</masterfile><instance><size>0</size><filename>Modulo_Certificato_Stato_Civile.pdf</filename><mimetype>application/pdf</mimetype><weight>14 Kb</weight></instance></resource>
', 'Modulo_Certificato_Stato_Civile.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('40', 'Attach', 'Modulo Certificato Residenza', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="40"><descr>Modulo Certificato Residenza</descr><groups mainGroup="free" /><categories /><masterfile>Modulo_Certificato_Residenza.pdf</masterfile><instance><size>0</size><filename>Modulo_Certificato_Residenza.pdf</filename><mimetype>application/pdf</mimetype><weight>14 Kb</weight></instance></resource>
', 'Modulo_Certificato_Residenza.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('25', 'Attach', 'Modulo Domanda Locazione', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="25"><descr>Modulo Domanda Locazione</descr><groups mainGroup="free" /><categories /><masterfile>Modulo_domanda_contributo_canone_locazione.pdf</masterfile><instance><size>0</size><filename>Modulo_domanda_contributo_canone_locazione.pdf</filename><mimetype>application/pdf</mimetype><weight>17 Kb</weight></instance></resource>
', 'Modulo_domanda_contributo_canone_locazione.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('45', 'Attach', 'Modulo - richiesta rimborso ICI', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="45"><descr>Modulo - richiesta rimborso ICI</descr><groups mainGroup="free" /><categories /><masterfile>Modulo_Richiesta_Rimborso_ICI.pdf</masterfile><instance><size>0</size><filename>Modulo_Richiesta_Rimborso_ICI.pdf</filename><mimetype>application/pdf</mimetype><weight>17 Kb</weight></instance></resource>
', 'Modulo_Richiesta_Rimborso_ICI.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('41', 'Attach', 'Richiesta Carta Identità', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Attach" id="41"><descr>Richiesta Carta Identità</descr><groups mainGroup="free" /><categories /><masterfile>Modulo_Richiesta_Carta_Identita.pdf</masterfile><instance><size>0</size><filename>Modulo_Richiesta_Carta_Identita.pdf</filename><mimetype>application/pdf</mimetype><weight>17 Kb</weight></instance></resource>
', 'Modulo_Richiesta_Carta_Identita.pdf');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('21', 'Image', 'Stemma', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Image" id="21"><descr>Stemma</descr><groups mainGroup="free" /><categories /><masterfile>Stemma.jpg</masterfile><instance><size>3</size><filename>Stemma_d3.jpg</filename><mimetype>image/jpeg</mimetype><weight>4 Kb</weight></instance><instance><size>2</size><filename>Stemma_d2.jpg</filename><mimetype>image/jpeg</mimetype><weight>3 Kb</weight></instance><instance><size>1</size><filename>Stemma_d1.jpg</filename><mimetype>image/jpeg</mimetype><weight>2 Kb</weight></instance><instance><size>0</size><filename>Stemma_d0.jpg</filename><mimetype>image/jpeg</mimetype><weight>130 Kb</weight></instance></resource>
', 'Stemma.jpg');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('10', 'Image', 'esempio', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Image" id="10"><descr>esempio</descr><groups mainGroup="free" /><categories /><masterfile>mare_014.jpg</masterfile><instance><size>3</size><filename>mare_014_d3.jpg</filename><mimetype>image/jpeg</mimetype><weight>2 Kb</weight></instance><instance><size>2</size><filename>mare_014_d2.jpg</filename><mimetype>image/jpeg</mimetype><weight>2 Kb</weight></instance><instance><size>1</size><filename>mare_014_d1.jpg</filename><mimetype>image/jpeg</mimetype><weight>1 Kb</weight></instance><instance><size>0</size><filename>mare_014_d0.jpg</filename><mimetype>image/jpeg</mimetype><weight>10 Kb</weight></instance></resource>
', 'mare_014.jpg');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('52', 'Image', 'per mobile', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Image" id="52"><descr>per mobile</descr><groups mainGroup="free" /><categories /><masterfile>post_icon.jpg</masterfile><instance><size>3</size><filename>post_icon_d3.jpg</filename><mimetype>image/jpeg</mimetype><weight>3 Kb</weight></instance><instance><size>2</size><filename>post_icon_d2.jpg</filename><mimetype>image/jpeg</mimetype><weight>2 Kb</weight></instance><instance><size>1</size><filename>post_icon_d1.jpg</filename><mimetype>image/jpeg</mimetype><weight>1 Kb</weight></instance><instance><size>0</size><filename>post_icon_d0.jpg</filename><mimetype>image/jpeg</mimetype><weight>19 Kb</weight></instance></resource>
', 'post_icon.jpg');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('26', 'Image', 'Spiaggia', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Image" id="26"><descr>Spiaggia</descr><groups mainGroup="free" /><categories /><masterfile>Immagine1.jpg</masterfile><instance><size>3</size><filename>Immagine1_d3.jpg</filename><mimetype>image/jpeg</mimetype><weight>6 Kb</weight></instance><instance><size>2</size><filename>Immagine1_d2.jpg</filename><mimetype>image/jpeg</mimetype><weight>5 Kb</weight></instance><instance><size>1</size><filename>Immagine1_d1.jpg</filename><mimetype>image/jpeg</mimetype><weight>3 Kb</weight></instance><instance><size>0</size><filename>Immagine1_d0.jpg</filename><mimetype>image/jpeg</mimetype><weight>3444 Kb</weight></instance></resource>
', 'Immagine1.jpg');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('143', 'Image', 'Mobile', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Image" id="143"><descr>Mobile</descr><groups mainGroup="free" /><categories /><masterfile>Mobile.jpg</masterfile><instance><size>3</size><filename>Mobile_d3.jpg</filename><mimetype>image/jpeg</mimetype><weight>2 Kb</weight></instance><instance><size>2</size><filename>Mobile_d2.jpg</filename><mimetype>image/jpeg</mimetype><weight>2 Kb</weight></instance><instance><size>1</size><filename>Mobile_d1.jpg</filename><mimetype>image/jpeg</mimetype><weight>1 Kb</weight></instance><instance><size>0</size><filename>Mobile_d0.jpg</filename><mimetype>image/jpeg</mimetype><weight>2 Kb</weight></instance></resource>
', 'Mobile.jpg');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('144', 'Image', 'Portal', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Image" id="144"><descr>Portal</descr><groups mainGroup="free" /><categories /><masterfile>Portal.jpg</masterfile><instance><size>3</size><filename>Portal_d3.jpg</filename><mimetype>image/jpeg</mimetype><weight>3 Kb</weight></instance><instance><size>2</size><filename>Portal_d2.jpg</filename><mimetype>image/jpeg</mimetype><weight>3 Kb</weight></instance><instance><size>1</size><filename>Portal_d1.jpg</filename><mimetype>image/jpeg</mimetype><weight>2 Kb</weight></instance><instance><size>0</size><filename>Portal_d0.jpg</filename><mimetype>image/jpeg</mimetype><weight>1791 Kb</weight></instance></resource>
', 'Portal.jpg');
INSERT INTO resources (resid, restype, descr, maingroup, xml, masterfilename) VALUES ('174', 'Image', 'Portal', 'free', '<?xml version="1.0" encoding="UTF-8"?>
<resource typecode="Image" id="174"><descr>Portal</descr><groups mainGroup="free" /><categories /><masterfile>Portal.jpg</masterfile><instance><size>3</size><filename>Portal_d3.jpg</filename><mimetype>image/jpeg</mimetype><weight>3 Kb</weight></instance><instance><size>2</size><filename>Portal_d2.jpg</filename><mimetype>image/jpeg</mimetype><weight>3 Kb</weight></instance><instance><size>1</size><filename>Portal_d1.jpg</filename><mimetype>image/jpeg</mimetype><weight>2 Kb</weight></instance><instance><size>0</size><filename>Portal_d0.jpg</filename><mimetype>image/jpeg</mimetype><weight>1791 Kb</weight></instance><instance><size>4</size><filename>Portal_d4.jpg</filename><mimetype>image/jpeg</mimetype><weight>14 Kb</weight></instance></resource>
', 'Portal.jpg');


--
-- TOC entry 1833 (class 0 OID 1823084)
-- Dependencies: 1513
-- Data for Name: showletcatalog; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('navigation_breadcrumbs', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Navigation - Breadcrumbs</property>
<property key="it">Navigazione - Briciole di Pane</property>
</properties>', NULL, NULL, NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Navigation - Menu</property>
<property key="it">Navigazione - Menù</property>
</properties>', '<config>
	<parameter name="navSpec">Rules for the Page List auto-generation</parameter>
	<action name="navigatorConfig" />
</config>', NULL, NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('news_latest', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">News - Latest News</property>
<property key="it">Notizie - Ultime Notizie</property>
</properties>', NULL, NULL, NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('bandi_latest', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Bandi - Latest "Bandi"</property>
<property key="it">Bandi - Ultimi Bandi</property>
</properties>', NULL, NULL, NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('delibere_latest', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Delibere - Latest "Delibere"</property>
<property key="it">Delibere - Ultime Delibere</property>
</properties>', NULL, NULL, NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('language_choose', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Languages - Choose a Language</property>
<property key="it">Lingue - Cambio Lingua</property>
</properties>', NULL, NULL, NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('login_form', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Login Form</property>
<property key="it">Form di Login</property>
</properties>', NULL, NULL, NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('search_form', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Search - Search Form</property>
<property key="it">Ricerca - Form di Ricerca</property>
</properties>', NULL, NULL, NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('search_result', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Search - Search Result</property>
<property key="it">Ricerca - Risultati della Ricerca</property>
</properties>', NULL, 'jacms', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('card_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Personal Cards - List</property>
<property key="it">Personal Card - Lista</property>
</properties>', NULL, NULL, NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('messages_system', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">System Messages</property>
<property key="it">Messaggi di Sistema</property>
</properties>', NULL, NULL, NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('card_list_detail', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Personal Cards - List and detail</property>
<property key="it">Personal Card - Lista e dettagio</property>
</properties>', NULL, NULL, 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/FrontEnd/Card/list.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpuserprofile_editCurrentUser', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Edit Current User</property>
<property key="it">Edita Utente Corrente</property>
</properties>', NULL, 'jpuserprofile', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpuserprofile/Front/CurrentUser/edit.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpuserprofile_editCurrentUser_password', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Edit Current User Password</property>
<property key="it">Edita Password Utente Corrente</property>
</properties>', NULL, 'jpuserprofile', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpuserprofile/Front/CurrentUser/editPassword.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpuserprofile_editCurrentUser_profile', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Edit Current User Profile</property>
<property key="it">Edita Profilo Utente Corrente</property>
</properties>', NULL, 'jpuserprofile', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpuserprofile/Front/CurrentUser/Profile/edit.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpuserreg_loginUserReg', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Login Form - User Reg</property>
<property key="it">Form di login - User Reg</property>
</properties>', NULL, 'jpuserreg', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpuserreg_Activation', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">User Activation</property>
<property key="it">Attivazione Utente</property>
</properties>', NULL, 'jpuserreg', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpuserreg/UserReg/initActivation.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpuserreg_Recover', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Password Recover</property>
<property key="it">Recupero Password</property>
</properties>', NULL, 'jpuserreg', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpuserreg/UserReg/initRecover.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpuserreg_Reactivation', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">User Reactivation</property>
<property key="it">Riattivazione Utente</property>
</properties>', NULL, 'jpuserreg', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpuserreg/UserReg/initReactivation.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpuserreg_Suspension', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">User Suspension</property>
<property key="it">Sospensione Utente</property>
</properties>', NULL, 'jpuserreg', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpuserreg/UserReg/initSuspension.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jprss_rssChannels', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">RSS Channels</property>
<property key="it">Lista Canali RSS</property>
</properties>', NULL, 'jprss', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpsurvey_pollArchive', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Surveys - Archive</property>
<property key="it">Sondaggi - Archivio</property>
</properties>', NULL, 'jpsurvey', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpsurvey_pollList', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Polls - Active List</property>
<property key="it">Sondaggi - Lista Attivi</property>
</properties>', NULL, 'jpsurvey', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpsurvey_questionnaireArchive', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Questionnaires - Archive</property>
<property key="it">Questionari - Archivio</property>
</properties>', NULL, 'jpsurvey', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpsurvey_questionnaireList', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Questionnaires - Active List</property>
<property key="it">Questionari - Lista Attivi</property>
</properties>', NULL, 'jpsurvey', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpsurvey_detailsSurvey', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Detailed questionnaire-survey</property>
<property key="it">Dettaglio questionario-sondaggio</property>
</properties>', NULL, 'jpsurvey', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpsurvey/Front/Survey/entryPoint.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpsurvey_resultsSurvey', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Results questionnaire-survey</property>
<property key="it">Risultati questionari-sondaggi</property>
</properties>', NULL, 'jpsurvey', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpsurvey/Front/SurveyDetail/entryPoint.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpaddressbook_search_form', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Address Book - Search Form</property>
<property key="it">Rubrica Interna - Form Ricerca</property>
</properties>', NULL, 'jpaddressbook', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpaddressbook/Front/AddressBook/searchIntro.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpaddressbook_search_result', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Address Book - Search Risult</property>
<property key="it">Rubrica Interna - Risultati Ricerca</property>
</properties>', NULL, 'jpaddressbook', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpaddressbook/Front/AddressBook/resultIntro.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpaddressbook_search_form_advanced', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Address Book - Advanced Search Form</property>
<property key="it">Rubrica Interna - Form Ricerca Avanzata</property>
</properties>', NULL, 'jpaddressbook', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpaddressbook/Front/AddressBook/searchIntroAdvanced.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpwebdynamicform_message_choice', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Dynamic Web Forms - Choice of a type of Message</property>
<property key="it">Dynamic Web Forms - Scelta tipo di Messaggio</property>
</properties>', '<config>
	<parameter name="actionPath">
		Relative path of an action or a JSP (ex: /ExtStr2/do/jpwebdynamicform/Message/User/listTypes).
	</parameter>
	<action name="configSimpleParameter"/>
</config>', 'jpwebdynamicform', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpwebdynamicform/Message/User/listTypes</property>
</properties>', 0);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpwebdynamicform_message_form', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Dynamic Web Forms - Publish the form for a Message Type</property>
<property key="it">Dynamic Web Forms - Pubblica il form di un tipo di Messaggio</property>
</properties>', '<config>
	<parameter name="typeCode">Code of the Message Type</parameter>
	<action name="webdynamicformConfig"/>
</config>', 'jpwebdynamicform', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpcmstagcloud', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Tag Cloud</property>
<property key="it">Tag Cloud</property>
</properties>', NULL, 'jpcmstagcloud', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpcmstagcloud_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Publish a List of Tagged Contents</property>
<property key="it">Pubblica Lista Contenuti Taggati</property>
</properties>', NULL, 'jpcmstagcloud', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Contents - Publish a Content</property>
<property key="it">Contenuti - Pubblica un Contenuto</property>
</properties>', '<config>
	<parameter name="contentId">
		Content ID
	</parameter>
	<parameter name="modelId">
		Content Model ID
	</parameter>
	<action name="viewerConfig"/>
</config>', 'jacms', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpshowletreplicator', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Showlet Replicator</property>
<property key="it">Replicatore di Showlet</property>
</properties>', '<config>
	<parameter name="pageCodeParam">Page</parameter>
	<parameter name="frameIdParam">Frame</parameter>
	<action name="replicatorConfig"/>
</config>', 'jpshowletreplicator', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Internal Servlet</property>
<property key="it">Invocazione di una Servlet Interna</property>
</properties>', '<config>
	<parameter name="actionPath">
		Path to an action or to a JSP. You must prepend ''/ExtStr2'' to any Struts2 action path
	</parameter>
	<action name="configSimpleParameter"/>
</config>', NULL, NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('content_feedback_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Content feedback</property>
<property key="it">Feedback contenuti</property>
</properties>', '<config>
	<parameter name="contentId">
		Content ID
	</parameter>
	<parameter name="modelId">
		Content Model ID
	</parameter>
	<parameter name="usedContentRating">
		Enable content rating (true|false)
	</parameter>
<parameter name="usedComment">
		Enable user comments (true|false) 
	</parameter>
<parameter name="usedCommentWithRating">
		Enable rating on comments (true|false)
	</parameter>
<parameter name="commentValidation">
		Enable administrator moderation of comments (true|false)
	</parameter>
	<action name="viewerContentFeedbackConfig"/>
</config>', 'jpcontentfeedback', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpfacetnav_results', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Results</property>
<property key="it">Risultati Ricerca</property>
</properties>', '<config>
	<parameter name="contentTypesFilter">
		Restrict results to the content types (OPTIONAL)
	</parameter>
	<action name="facetNavResultConfig"/>
</config>', 'jpfacetnav', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpfacetnav_tree', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Facets Tree</property>
<property key="it">Albero delle faccette</property>
</properties>', '<config>
	<parameter name="facetRootNodes">
		Root facets to include in the tree
	</parameter>
	<parameter name="contentTypesFilter">
		Restrict results to the content types (OPTIONAL)
	</parameter>
	<action name="facetNavTreeConfig"/>
</config>', 'jpfacetnav', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpphotogallery', '<?xml version="1.0" encoding="UTF-8"?>
	<properties>
		<property key="en">Photo gallery</property>
		<property key="it">Foto gallery</property>
	</properties>', '<config>
	<parameter name="contentType">Content type (mandatory)</parameter>
	<parameter name="modelIdMaster">Main model</parameter>
	<parameter name="modelIdPreview">Preview model</parameter>
	<parameter name="category">Content category</parameter>
	<parameter name="filters" />
	<action name="jpphotogalleryConfig"/>
</config>', 'jpphotogallery', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpnewsletter_registration', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Iscrizione Newsletter</property>
<property key="it">Iscrizione Newsletter</property>
</properties>', NULL, 'jpnewsletter', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpnewsletter/Front/RegSubscriber/entry.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpnewsletter_subscription', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Conferma Iscrizione Newsletter</property>
<property key="it">Conferma Iscrizione Newsletter</property>
</properties>', NULL, 'jpnewsletter', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpnewsletter/Front/RegSubscriber/subscription.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpnewsletter_unsubscription', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Cancellazione Iscrizione Newsletter</property>
<property key="it">Cancellazione Iscrizione Newsletter</property>
</properties>', NULL, 'jpnewsletter', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpnewsletter/Front/RegSubscriber/unsubscriptionEntry.action</property>
</properties>', 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('content_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Contents - Publish a List of Contents</property>
<property key="it">Contenuti - Pubblica una Lista di Contenuti</property>
</properties>', '<config>
	<parameter name="contentType">Content Type (mandatory)</parameter>
	<parameter name="modelId">Content Model</parameter>
	<parameter name="userFilters">Front-End user filter options</parameter>
	<parameter name="category">Content Category **deprecated**</parameter>
	<parameter name="categories">Content Category codes (comma separeted)</parameter>
	<parameter name="maxElemForItem">Contents for each page</parameter>
	<parameter name="filters" />
	<parameter name="title_{lang}">Showlet Title in lang {lang}</parameter>
	<parameter name="pageLink">The code of the Page to link</parameter>
	<parameter name="linkDescr_{lang}">Link description in lang {lang}</parameter>
	<action name="listViewerConfig"/>
</config>', 'jacms', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpuserreg_Registration', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">User Registration</property>
<property key="it">Registrazione Utente</property>
</properties>', '<config>
	<parameter name="typeCode">Code of the Profile Type</parameter>
	<action name="userRegConfig"/>
</config>', 'jpuserreg', NULL, NULL, 1);
INSERT INTO showletcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked) VALUES ('jpuserreg_profile_choice', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">User Registration - with profile choice</property>
<property key="it">Registrazione Utente - con scelta del profilo</property>
</properties>', NULL, 'jpuserreg', 'formAction', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/jpuserreg/UserReg/listTypes</property>
</properties>', 1);


--
-- TOC entry 1834 (class 0 OID 1823090)
-- Dependencies: 1514
-- Data for Name: showletconfig; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notfound', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notfound', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notfound', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notfound', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('search_result', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('search_result', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('search_result', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('search_result', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('homepage', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('homepage', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('homepage', 9, 'bandi_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('homepage', 10, 'delibere_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('homepage', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notizie', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notizie', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notizie', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notizie', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('errorpage', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('errorpage', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('errorpage', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('errorpage', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('search_result', 6, 'search_result', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notizie', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG12</property>
</properties>

', 'CNG12');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_giunta', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_giunta', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_giunta', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_giunta', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_consiglio', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_consiglio', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_consiglio', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_consiglio', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_giunta', 11, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(delibere).subtree(1)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_consiglio', 11, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(delibere).subtree(1)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_giunta', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG28</property>
</properties>

', 'CNG28');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_giunta', 7, 'content_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="maxElemForItem">10</property>
<property key="filters">(order=ASC;attributeFilter=false;key=created)</property>
<property key="category">delibere_di_giunta</property>
<property key="modelId">31</property>
<property key="contentType">DLB</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_consiglio', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="contentId">CNG29</property>
</properties>

', 'CNG29');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_consiglio', 7, 'content_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="maxElemForItem">10</property>
<property key="filters">(order=ASC;attributeFilter=false;key=created)</property>
<property key="category">delibere_di_consiglio</property>
<property key="modelId">31</property>
<property key="contentType">DLB</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('homepage', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('sindaco', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('sindaco', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('sindaco', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('sindaco', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="contentId">CNG17</property>
</properties>

', 'CNG17');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('sindaco', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('giunta_comunale', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('giunta_comunale', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('giunta_comunale', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('giunta_comunale', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG18</property>
</properties>

', 'CNG18');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('giunta_comunale', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('consiglio_comunale', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('consiglio_comunale', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('consiglio_comunale', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('consiglio_comunale', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG19</property>
</properties>

', 'CNG19');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('consiglio_comunale', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('statuto', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('statuto', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('statuto', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('statuto', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG20</property>
</properties>

', 'CNG20');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('statuto', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandi', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandi', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandi', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandi', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG11</property>
</properties>

', 'CNG11');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandi', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG13</property>
</properties>

', 'CNG13');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere', 11, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(delibere).subtree(1)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('moduli', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('moduli', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('moduli', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notfound', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('moduli', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG14</property>
</properties>

', 'CNG14');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('moduli', 7, 'content_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="maxElemForItem">15</property>
<property key="filters">(order=ASC;attributeFilter=true;key=Oggetto)</property>
<property key="category">moduli</property>
<property key="modelId">51</property>
<property key="contentType">SDL</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('moduli', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('urp', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('urp', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('urp', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('urp', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="contentId">CNG49</property>
</properties>

', 'CNG49');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('urp', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_notizie', 3, 'content_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="maxElemForItem">5</property>
<property key="filters">(order=DESC;attributeFilter=true;key=Data)</property>
<property key="modelId">22</property>
<property key="contentType">NEW</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_bandi', 3, 'content_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="maxElemForItem">5</property>
<property key="filters">(order=DESC;attributeFilter=true;key=DataInizio)</property>
<property key="modelId">42</property>
<property key="contentType">BND</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('autocertificazioni', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('autocertificazioni', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('autocertificazioni', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('autocertificazioni', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG14</property>
</properties>

', 'CNG14');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('autocertificazioni', 7, 'content_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="maxElemForItem">15</property>
<property key="filters">(order=ASC;attributeFilter=true;key=Oggetto)</property>
<property key="category">autocertificazioni</property>
<property key="modelId">51</property>
<property key="contentType">SDL</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('autocertificazioni', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_home', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_home', 1, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_sindaco', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_sindaco', 1, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_giunta_comunale', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_giunta_comunale', 1, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_consiglio_comunale', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_consiglio_comunale', 1, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_notizie', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_notizie', 1, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_delibere', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_delibere', 1, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_bandi', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_bandi', 1, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_sindaco', 2, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="contentId">CNG17</property>
</properties>

', 'CNG17');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_giunta_comunale', 2, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="contentId">CNG18</property>
</properties>

', 'CNG18');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_consiglio_comunale', 2, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="contentId">CNG19</property>
</properties>

', 'CNG19');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_contentview', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_contentview', 1, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_contentview', 2, 'content_viewer', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_notizie', 2, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG53</property>
</properties>

', 'CNG53');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_delibere', 2, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG54</property>
</properties>

', 'CNG54');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_delibere', 3, 'content_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="maxElemForItem">5</property>
<property key="modelId">32</property>
<property key="contentType">DLB</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_bandi', 2, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG55</property>
</properties>

', 'CNG55');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notfound', 6, 'messages_system', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('errorpage', 6, 'messages_system', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('simview', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('simview', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('simview', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('simview', 6, 'content_viewer', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('simview', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('login', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('login', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('login', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('sindaco', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('giunta_comunale', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG15</property>
</properties>

', 'CNG15');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('consiglio_comunale', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('statuto', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notizie', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandi', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('moduli', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('urp', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_giunta', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere_consiglio', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass', 7, 'card_list', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass_int', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass_int', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass_int', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass_int', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="modelId">1</property>
<property key="contentId">CNG16</property>
</properties>

', 'CNG16');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass_int', 7, 'card_list_detail', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="actionPath">/ExtStr2/do/FrontEnd/Card/list.action</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass_int', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('contentview', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('contentview', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('contentview', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('contentview', 6, 'content_viewer', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('contentview', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('faqview', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('faqview', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('faqview', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('faqview', 6, 'content_viewer', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('faqview', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('dlview', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('dlview', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('dlview', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('dlview', 6, 'content_viewer', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('dlview', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('newsview', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('newsview', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('newsview', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('newsview', 6, 'content_viewer', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('newsview', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('deliberaview', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('deliberaview', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('deliberaview', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('deliberaview', 6, 'content_viewer', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('deliberaview', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandoview', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandoview', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandoview', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandoview', 6, 'content_viewer', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandoview', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('deliberaview', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('rssview', 0, 'language_choose', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('rssview', 1, 'search_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('rssview', 2, 'navigation_breadcrumbs', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('rssview', 6, 'content_viewer', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('rssview', 12, 'news_latest', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('homepage', 6, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="contentId">CNG256</property>
<property key="modelId">12</property>
</properties>

', 'CNG256');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('homepage', 7, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="contentId">CNG51</property>
<property key="modelId">12</property>
</properties>

', 'CNG51');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('homepage', 8, 'content_viewer', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="contentId">CNG173</property>
<property key="modelId">12</property>
</properties>

', 'CNG173');
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('notizie', 7, 'content_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="maxElemForItem">15</property>
<property key="userFilters">(attributeFilter=false;key=fulltext)+(attributeFilter=true;key=Data;type=attribute)</property>
<property key="filters">(order=DESC;attributeFilter=true;key=Data)</property>
<property key="contentType">NEW</property>
<property key="modelId">21</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('delibere', 7, 'content_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="maxElemForItem">10</property>
<property key="userFilters">(attributeFilter=false;key=fulltext)+(attributeFilter=true;key=Numero)+(attributeFilter=false;key=category)+(attributeFilter=true;key=Data)</property>
<property key="filters">(attributeFilter=true;order=DESC;key=Numero)+(order=DESC;attributeFilter=true;key=Data)</property>
<property key="contentType">DLB</property>
<property key="modelId">31</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandi', 7, 'content_viewer_list', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="maxElemForItem">15</property>
<property key="userFilters">(attributeFilter=false;key=fulltext)+(attributeFilter=true;key=DataInizio)+(attributeFilter=true;key=DataFine)</property>
<property key="filters">(order=DESC;attributeFilter=true;key=DataInizio)</property>
<property key="contentType">BND</property>
<property key="modelId">41</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('simview', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('autocertificazioni', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('homepage', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('login', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('old_town_traffic_pass_int', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('contentview', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('faqview', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('dlview', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('newsview', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('bandoview', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('search_result', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('errorpage', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('rssview', 3, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(homepage).subtree(2)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('mobile_home', 2, 'navigation_menu', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="navSpec">code(mobile_comune).subtree(1) + code(mobile_trasparenza).subtree(1)</property>
</properties>

', NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('login', 6, 'login_form', NULL, NULL);
INSERT INTO showletconfig (pagecode, framepos, showletcode, config, publishedcontent) VALUES ('homepage', 11, 'login_form', NULL, NULL);


--
-- TOC entry 1835 (class 0 OID 1823096)
-- Dependencies: 1515
-- Data for Name: sysconfig; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO sysconfig (version, item, descr, config) VALUES ('production', 'langs', 'Definition of the system languages', '<?xml version="1.0" encoding="UTF-8"?>
<Langs>
  <Lang>
    <code>it</code>
    <descr>Italiano</descr>
    <default>false</default>
  </Lang>
  <Lang>
    <code>en</code>
    <descr>English</descr>
    <default>true</default>
  </Lang>
</Langs>

');
INSERT INTO sysconfig (version, item, descr, config) VALUES ('production', 'imageDimensions', 'Definition of the resized image dimensions', '<Dimensions>
	<Dimension>
		<id>1</id>
		<dimx>90</dimx>
		<dimy>90</dimy>
	</Dimension>
	<Dimension>
		<id>2</id>
		<dimx>130</dimx>
		<dimy>130</dimy>
	</Dimension>
	<Dimension>
		<id>3</id>
		<dimx>150</dimx>
		<dimy>150</dimy>
	</Dimension>
</Dimensions>');
INSERT INTO sysconfig (version, item, descr, config) VALUES ('production', 'subIndexDir', 'Name of the sub-directory containing content indexing files', 'indexdir');
INSERT INTO sysconfig (version, item, descr, config) VALUES ('production', 'params', 'Configuration params. Tags other than "Param" are ignored', '<?xml version="1.0" encoding="UTF-8"?>
<Params>
	<Param name="urlStyle">classic</Param>
	<Param name="hypertextEditor">fckeditor</Param>
	<Param name="treeStyle_page">classic</Param>
	<Param name="treeStyle_category">classic</Param>
	<Param name="startLangFromBrowser">false</Param>
	<SpecialPages>
		<Param name="notFoundPageCode">notfound</Param>
		<Param name="homePageCode">homepage</Param>
		<Param name="errorPageCode">errorpage</Param>
		<Param name="loginPageCode">login</Param>
	</SpecialPages>
	<ExtendendPrivacyModule>
		<Param name="extendedPrivacyModuleEnabled">false</Param>
		<Param name="maxMonthsSinceLastAccess">6</Param>
		<Param name="maxMonthsSinceLastPasswordChange">3</Param>        
	</ExtendendPrivacyModule>
</Params>');
INSERT INTO sysconfig (version, item, descr, config) VALUES ('production', 'contentTypes', 'Definition of the Content Types', '<?xml version="1.0" encoding="UTF-8"?>
<contenttypes>
	<contenttype typecode="BND" typedescr="Bando" viewpage="bandoview" listmodel="41" defaultmodel="4">
		<attributes>
			<attribute name="Oggetto" attributetype="Longtext" indexingtype="TEXT">
				<validations>
					<required>true</required>
				</validations>
				<roles>
					<role>jacms:title</role>
				</roles>
			</attribute>
			<attribute name="DataInizio" attributetype="Date" searcheable="true">
				<validations>
					<required>true</required>
					<expression evalOnValuedAttribute="true">
						<ognlexpression><![CDATA[#attribute.date.after(new java.util.Date())]]></ognlexpression>
						<errormessage><![CDATA[The start date has to be after than today]]></errormessage>
						<helpmessage><![CDATA[The start date has to be after than today]]></helpmessage>
					</expression>
				</validations>
			</attribute>
			<attribute name="DataFine" attributetype="Date" searcheable="true">
				<validations>
					<required>true</required>
					<rangestart attribute="DataInizio" />
				</validations>
			</attribute>
			<attribute name="Abstract" attributetype="Hypertext" indexingtype="text" />
			<list name="Allegati" attributetype="Monolist">
				<nestedtype>
					<attribute name="Allegati" attributetype="Attach" />
				</nestedtype>
			</list>
		</attributes>
	</contenttype>
	<contenttype typecode="CNG" typedescr="Contenuto generico" viewpage="contentview" listmodel="11" defaultmodel="1">
		<attributes>
			<attribute name="Titolo" attributetype="Text" searcheable="true" indexingtype="TEXT">
				<validations>
					<required>true</required>
				</validations>
				<roles>
					<role>jacms:title</role>
				</roles>
			</attribute>
			<attribute name="Abstract" attributetype="Longtext" indexingtype="text" />
			<attribute name="CorpoTesto" attributetype="Hypertext" indexingtype="text" />
			<attribute name="Immagine_1" attributetype="Image" />
			<attribute name="Immagine_2" attributetype="Image">
				<validations>
					<expression evalOnValuedAttribute="true">
						<ognlexpression><![CDATA[#entity.getAttribute(''Immagine_1'').resource != null]]></ognlexpression>
						<errormessage key="CNG_Image2_OgnlErrorMessage" />
						<helpmessage key="CNG_Image2_OgnlHelpMessage" />
					</expression>
				</validations>
			</attribute>
			<list name="Riferimenti" attributetype="Monolist">
				<nestedtype>
					<attribute name="Riferimenti" attributetype="Link" />
				</nestedtype>
			</list>
			<list name="Allegati" attributetype="Monolist">
				<nestedtype>
					<attribute name="Allegati" attributetype="Attach" />
				</nestedtype>
			</list>
		</attributes>
	</contenttype>
	<contenttype typecode="DLB" typedescr="Delibera" viewpage="deliberaview" listmodel="31" defaultmodel="3">
		<attributes>
			<attribute name="Numero" attributetype="Number" searcheable="true" indexingtype="number">
				<validations>
					<required>true</required>
				</validations>
			</attribute>
			<attribute name="Data" attributetype="Date" searcheable="true">
				<validations>
					<required>true</required>
				</validations>
			</attribute>
			<attribute name="Oggetto" attributetype="Longtext" indexingtype="TEXT">
				<validations>
					<required>true</required>
				</validations>
				<roles>
					<role>jacms:title</role>
				</roles>
			</attribute>
			<attribute name="Abstract" attributetype="Hypertext" indexingtype="text" />
			<list name="Allegati" attributetype="Monolist">
				<nestedtype>
					<attribute name="Allegati" attributetype="Attach" />
				</nestedtype>
			</list>
		</attributes>
	</contenttype>
	<contenttype typecode="NEW" typedescr="Notizia" viewpage="newsview" listmodel="21" defaultmodel="2">
		<attributes>
			<attribute name="Data" attributetype="Date" searcheable="true">
				<validations>
					<required>true</required>
				</validations>
			</attribute>
			<attribute name="Titolo" attributetype="Text" searcheable="true" indexingtype="TEXT">
				<validations>
					<required>true</required>
				</validations>
				<roles>
					<role>jacms:title</role>
				</roles>
			</attribute>
			<attribute name="Lancio" attributetype="Longtext" indexingtype="text" />
			<attribute name="CorpoTesto" attributetype="Hypertext" indexingtype="text" />
			<attribute name="Immagine_1" attributetype="Image" />
			<list name="Riferimenti" attributetype="Monolist">
				<nestedtype>
					<attribute name="Riferimenti" attributetype="Link" />
				</nestedtype>
			</list>
			<list name="Allegati" attributetype="Monolist">
				<nestedtype>
					<attribute name="Allegati" attributetype="Attach" />
				</nestedtype>
			</list>
		</attributes>
	</contenttype>
	<contenttype typecode="SDL" typedescr="Scheda Download" viewpage="dlview" listmodel="51" defaultmodel="5">
		<attributes>
			<attribute name="Oggetto" attributetype="Text" searcheable="true" indexingtype="TEXT">
				<validations>
					<required>true</required>
				</validations>
				<roles>
					<role>jacms:title</role>
				</roles>
			</attribute>
			<attribute name="DescrizioneBreve" attributetype="Hypertext" indexingtype="text">
				<validations>
					<required>true</required>
				</validations>
			</attribute>
			<attribute name="DescrizioneLunga" attributetype="Hypertext" indexingtype="text" />
			<attribute name="Immagine" attributetype="Image" />
			<attribute name="File" attributetype="Attach">
				<validations>
					<required>true</required>
				</validations>
			</attribute>
			<list name="Riferimenti" attributetype="Monolist">
				<nestedtype>
					<attribute name="Riferimenti" attributetype="Link" />
				</nestedtype>
			</list>
		</attributes>
	</contenttype>
</contenttypes>

');


--
-- TOC entry 1836 (class 0 OID 1823102)
-- Dependencies: 1516
-- Data for Name: uniquekeys; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO uniquekeys (id, keyvalue) VALUES (1, 260);


--
-- TOC entry 1837 (class 0 OID 1823105)
-- Dependencies: 1517
-- Data for Name: workcontentrelations; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('DLB4', 'delibere');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('DLB4', 'delibere_di_giunta');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('DLB30', 'delibere');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('DLB30', 'delibere_di_consiglio');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('DLB32', 'scheda_download');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('DLB32', 'delibere');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('DLB32', 'moduli');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('DLB32', 'delibere_di_giunta');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('DLB36', 'delibere');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('DLB36', 'delibere_di_consiglio');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('SDL42', 'scheda_download');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('SDL42', 'anagrafe');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('SDL42', 'moduli');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('SDL44', 'scheda_download');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('SDL44', 'autocertificazioni');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('SDL7', 'scheda_download');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('SDL7', 'autocertificazioni');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('SDL46', 'scheda_download');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('SDL46', 'tributi');
INSERT INTO workcontentrelations (contentid, refcategory) VALUES ('SDL46', 'moduli');


--
-- TOC entry 1838 (class 0 OID 1823108)
-- Dependencies: 1518
-- Data for Name: workcontentsearch; Type: TABLE DATA; Schema: public; Owner: agile
--

INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW177', 'Data', NULL, '2011-06-15', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW177', 'Titolo', 'Online the Mobile Portal', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW177', 'Titolo', 'Online il Portale Mobile', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW3', 'Data', NULL, '2011-11-21', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW3', 'Titolo', 'Online the Portal of Villamarina Municipality', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW3', 'Titolo', 'Online il Portale del Comune di Villamarina', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW27', 'Data', NULL, '2011-07-20', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW27', 'Titolo', 'Folk Music Festival', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW27', 'Titolo', 'Festival della canzone popolare', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW23', 'Data', NULL, '2011-10-21', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW23', 'Titolo', 'Ground Rent Contribution', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('NEW23', 'Titolo', 'Contributo canone di locazione 2011', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB4', 'Numero', NULL, NULL, 133, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB4', 'Data', NULL, '2011-09-20', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB30', 'Numero', NULL, NULL, 20, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB30', 'Data', NULL, '2011-10-04', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB32', 'Numero', NULL, NULL, 120, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB32', 'Data', NULL, '2011-07-01', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB36', 'Numero', NULL, NULL, 15, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('DLB36', 'Data', NULL, '2011-07-16', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG173', 'Titolo', 'Web Accessibility', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG173', 'Titolo', 'Accessibilità', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG256', 'Titolo', 'How to sign in', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG256', 'Titolo', 'Come loggarsi', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG54', 'Titolo', 'Delibere', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG55', 'Titolo', 'Bandi', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG53', 'Titolo', 'Notizie', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG29', 'Titolo', 'Elenco delle Delibere di Consiglio presenti nel portale del Comune', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG28', 'Titolo', 'Elenco delle Delibere di Giunta presenti nel portale del Comune', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG17', 'Titolo', 'Mayor', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG17', 'Titolo', 'Sindaco', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG18', 'Titolo', 'Council', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG18', 'Titolo', 'Giunta Comunale', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG19', 'Titolo', 'Consiglio Comunale', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG49', 'Titolo', 'Public Relations Office', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG49', 'Titolo', 'URP - Ufficio Relazioni con il Pubblico', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG14', 'Titolo', 'Documents Archive', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG14', 'Titolo', 'Archivio Modulistica', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG11', 'Titolo', 'Announcements Archive', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG11', 'Titolo', 'Archivio Bandi', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG12', 'Titolo', 'News Archive', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG12', 'Titolo', 'Archivio Notizie', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG13', 'Titolo', 'Decisions Archive', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG13', 'Titolo', 'Archivio Delibere', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG2', 'Titolo', 'Lorem Ipsum dolor sit amet', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG20', 'Titolo', 'Statute', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG20', 'Titolo', 'Statuto', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG16', 'Titolo', 'Internal Servlet', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG16', 'Titolo', 'Internal Servlet', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG15', 'Titolo', 'Application Service Example', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG15', 'Titolo', 'Esempio Servizio Applicativo', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG145', 'Titolo', 'Web Accessibility', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG145', 'Titolo', 'Accessibilità', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG51', 'Titolo', 'Mobile Area', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG51', 'Titolo', 'Area Mobile', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG146', 'Titolo', 'ePartecipation', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG146', 'Titolo', 'ePartecipation', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG148', 'Titolo', 'How to sign in', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('CNG148', 'Titolo', 'Come loggarsi', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND39', 'DataInizio', NULL, '2011-02-01', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND39', 'DataFine', NULL, '2011-11-30', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND48', 'DataInizio', NULL, '2011-02-28', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND48', 'DataFine', NULL, '2011-10-27', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND5', 'DataInizio', NULL, '2011-03-03', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('BND5', 'DataFine', NULL, '2011-11-14', NULL, NULL);
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL42', 'Oggetto', 'Registry - Request Identity Card valid for foreign travel', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL42', 'Oggetto', 'Anagrafe - Richiesta Carta Identità valida per espatrio', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL44', 'Oggetto', 'Civil Status Self Certification Form', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL44', 'Oggetto', 'Modulo Autocertificazione Stato Civile', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL7', 'Oggetto', 'Residence Self-certification Form', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL7', 'Oggetto', 'Modulo Autocertificazione Residenza', NULL, NULL, 'it');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL46', 'Oggetto', 'Tax - Request ICI refund', NULL, NULL, 'en');
INSERT INTO workcontentsearch (contentid, attrname, textvalue, datevalue, numvalue, langcode) VALUES ('SDL46', 'Oggetto', 'Tributi - Richiesta rimborso ICI', NULL, NULL, 'it');


-- Completed on 2011-06-02 21:47:49 CEST

--
-- PostgreSQL database dump complete
--

