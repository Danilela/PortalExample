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

/**
 * Interfaccia base per la classe Action gestore delle operazioni sugli oggetti Card.
 * @author E.Mezzano - E.Santoboni
 */
public interface ICardAction {
	
	/**
	 * Esegue l'operazione di richiesta creazione di nuova card.
	 * @return Il codice del risultato dell'azione.
	 */
	public String newCard();
	
	/**
	 * Esegue l'operazione di richiesta di modifica di una card.
	 * @return Il codice del risultato dell'azione.
	 */
	public String edit();
	
	/**
	 * Esegue l'operazione di richiesta di visualizzazione di una card.
	 * @return Il codice del risultato dell'azione.
	 */
	public String view();
	
	/**
	 * Esegue l'operazione di salvataggio di una card.
	 * @return Il codice del risultato dell'azione.
	 */
	public String save();
	
	/**
	 * Esegue l'operazione di cancellazione di una card.
	 * @return Il codice del risultato.
	 */
	public String delete();
	
}
