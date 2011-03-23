/*
*
* Copyright 2005 AgileTec s.r.l. (http://www.agiletec.it) All rights reserved.
*
* This file is part of jAPS software.
* jAPS is a free software; 
* you can redistribute it and/or modify it
* under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; version 2.
* 
* See the file License for the specific language governing permissions   
* and limitations under the License
* 
* 
* 
* Copyright 2005 AgileTec s.r.l. (http://www.agiletec.it) All rights reserved.
*
*/
package test.it.villamarina;

import test.com.agiletec.ConfigTestUtils;

/**
 * @author E.Santoboni
 */
public class VillamarinaConfigUtils extends ConfigTestUtils {
	
    protected String[] getSpringConfigFilePaths() {
    	String[] filePaths = new String[7];
		filePaths[0] = "admin/test/testSystemConfig.xml";
		filePaths[1] = "WebContent/WEB-INF/conf/managers/**/**.xml";
		filePaths[2] = "WebContent/WEB-INF/apsadmin/conf/**/**.xml";
		filePaths[3] = "WebContent/WEB-INF/plugins/**/conf/**/**.xml";
		filePaths[4] = "WebContent/WEB-INF/plugins/**/apsadmin/conf/**/**.xml";
		filePaths[5] = "WebContent/WEB-INF/villamarina/conf/managers/cardManagersConfig.xml";
		filePaths[6] = "WebContent/WEB-INF/villamarina/apsadmin/conf/cardActionsConfig.xml";
		return filePaths;
    }
	
}
