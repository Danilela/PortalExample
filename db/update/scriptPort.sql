ALTER TABLE pages ADD COLUMN extraconfig character varying;

ALTER TABLE contents ALTER descr TYPE character varying(260);

ALTER TABLE resources ALTER descr TYPE character varying(260);

CREATE TABLE workcontentrelations
(
  contentid character varying(16) NOT NULL,
  refcategory character varying(30),
  CONSTRAINT workcontentrelations_contentid_fkey FOREIGN KEY (contentid)
      REFERENCES contents (contentid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (OIDS=TRUE);

ALTER TABLE resources ADD COLUMN masterfilename character varying(100);
UPDATE resources SET masterfilename = 'temp';
ALTER TABLE resources ALTER COLUMN masterfilename SET NOT NULL;


UPDATE sysconfig SET config = '<?xml version="1.0" encoding="UTF-8"?>
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
</Params>' WHERE item = 'params';

ALTER TABLE contentsearch ALTER COLUMN contentid SET NOT NULL;
ALTER TABLE contentsearch ALTER COLUMN attrname SET NOT NULL;
ALTER TABLE contentrelations ALTER COLUMN contentid SET NOT NULL;

CREATE INDEX contents_idx ON contents USING btree (contenttype, maingroup);
CREATE INDEX contentrelations_idx ON contentrelations USING btree (contentid, refcategory, refgroup);
CREATE INDEX contentsearch_idx ON contentsearch USING btree (contentid, attrname);

-------------------------------------------------

INSERT INTO localstrings(keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_BASIC','it','Normale');
INSERT INTO localstrings(keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_BASIC','en','Normal');
INSERT INTO localstrings(keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_MINT','it','Avanzata');
INSERT INTO localstrings(keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_MINT','en','Advanced');
INSERT INTO localstrings(keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_BASIC_GOTO','it','Accedi con client normale');
INSERT INTO localstrings(keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_BASIC_GOTO','en','Go to the administration with normal client');
INSERT INTO localstrings(keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_MINT_GOTO','it','Accedi con client avanzato');
INSERT INTO localstrings(keycode, langcode, stringvalue) VALUES ('ADMINISTRATION_MINT_GOTO','en','Go to the administration with advanced client');


ALTER TABLE uniquekeys DROP CONSTRAINT sequence_pkey;
ALTER TABLE uniquekeys ADD CONSTRAINT uniquekeys_pkey PRIMARY KEY(id);

----------------------------

-- Reload content references
-- Execute refresh resource filenames - Action <BASE_URL>/do/jacms/Resource/Porting22/intro


---- localizations  31/01/2011 ---

UPDATE showletcatalog SET parameters='<config>
	<parameter name="contentType">Content Type (mandatory)</parameter>
	<parameter name="modelId">Content Model</parameter>
	<parameter name="category">Content Category</parameter>
	<parameter name="maxElemForItem">Contents for each page</parameter>
	<parameter name="filters" />
	<action name="listViewerConfig"/>
</config>'
 WHERE code='content_viewer_list';
 
 UPDATE showletcatalog SET parameters='<config>
	<parameter name="actionPath">
		Path to an action or to a JSP. You must prepend ''/ExtStr2'' to any Struts2 action path
	</parameter>
	<action name="configSimpleParameter"/>
</config>' WHERE code='formAction';

--- localisation update for MySQL

UPDATE PortalExamplePort.showletcatalog SET parameters='<config>
	<parameter name="contentType">Content Type (mandatory)</parameter>
	<parameter name="modelId">Content Model</parameter>
	<parameter name="category">Content Category</parameter>
	<parameter name="maxElemForItem">Contents for each page</parameter>
	<parameter name="filters" />
	<action name="listViewerConfig"/>
</config>'
 WHERE code='content_viewer_list';
 
 UPDATE PortalExamplePort.showletcatalog SET parameters='<config>
	<parameter name="actionPath">
		Path to an action or to a JSP. You must prepend ''/ExtStr2'' to any Struts2 action path
	</parameter>
	<action name="configSimpleParameter"/>
</config>' WHERE code='formAction';

-- localisation of system params 

UPDATE sysconfig
   SET descr='Definition of the Content Types'
 WHERE item='contentTypes';

UPDATE sysconfig
   SET descr='Definition of the resized image dimensions' 
WHERE item='imageDimensions';

UPDATE sysconfig
   SET descr='Definition of the system languages' 
WHERE item='langs';

UPDATE sysconfig
   SET descr='Configuration params. Tags other than \"Param\" are ignored' 
WHERE item='params';

UPDATE sysconfig
   SET descr='Name of the sub-directory containing content indexing files' 
WHERE item='subIndexDir';


--- sysconfig localisation for MySQL

UPDATE PortalExamplePort.sysconfig
   SET descr='Definition of the Content Types'
 WHERE item='contentTypes';

UPDATE PortalExamplePort.sysconfig
   SET descr='Definition of the resized image dimensions' 
WHERE item='imageDimensions';

UPDATE PortalExamplePort.sysconfig
   SET descr='Definition of the system languages' 
WHERE item='langs';

UPDATE PortalExamplePort.sysconfig
   SET descr='Configuration params. Tags other than \"Param\" are ignored' 
WHERE item='params';

UPDATE PortalExamplePort.sysconfig
   SET descr='Name of the sub-directory containing content indexing files' 
WHERE item='subIndexDir';

