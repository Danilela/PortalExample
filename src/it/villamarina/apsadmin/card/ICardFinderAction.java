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
package it.villamarina.apsadmin.card;

import it.villamarina.aps.system.services.card.Card;

import java.util.List;

/**
 * Interfaccia base per la classe Action 
 * delegate alla gestione della ricerca e visualizzazione lista card.
 * @author E.Mezzano - E.Santoboni
 */
public interface ICardFinderAction {
	
	/**
	 * Restituisce la lista di card definite nel sistema.
	 * @return La lista di Card definite nel sistema.
	 */
	public List<Card> getCards();
	
}
