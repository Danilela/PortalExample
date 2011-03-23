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
package test.it.villamarina.apsadmin.card;

import it.villamarina.aps.system.services.card.Card;
import it.villamarina.apsadmin.card.ICardFinderAction;
import test.it.villamarina.apsadmin.VillamarinaApsBaseTestCase;

import com.opensymphony.xwork2.Action;

/**
 * @author E.Santoboni
 */
public class TestCardFinderAction extends VillamarinaApsBaseTestCase {
	
	public void testListCard() throws Throwable {
		this.setUserOnSession("admin");
		this.initAction("/do/Card", "list");
		String result = this.executeAction();
		assertEquals(Action.SUCCESS, result);
		ICardFinderAction action = (ICardFinderAction) this.getAction();
		assertEquals(4, action.getCards().size());
	}
	
	public void testSearchCard_1() throws Throwable {
		this.setUserOnSession("admin");
		this.initAction("/do/Card", "search");
		this.addParameter("holder", "Nicola");
		String result = this.executeAction();
		assertEquals(Action.SUCCESS, result);
		ICardFinderAction action = (ICardFinderAction) this.getAction();
		assertEquals(1, action.getCards().size());
	}
	
	public void testSearchCard_2() throws Throwable {
		this.setUserOnSession("admin");
		this.initAction("/do/Card", "search");
		this.addParameter("holder", "Anna");
		String result = this.executeAction();
		assertEquals(Action.SUCCESS, result);
		ICardFinderAction action = (ICardFinderAction) this.getAction();
		assertEquals(1, action.getCards().size());
		Card card = action.getCards().get(0);
		assertEquals("Verdi Anna", card.getHolder());
	}
	
}
