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
package it.villamarina.aps.system.services.card;

import java.util.List;

import com.agiletec.aps.system.ApsSystemUtils;
import com.agiletec.aps.system.common.AbstractService;
import com.agiletec.aps.system.exception.ApsSystemException;

/**
 * Servizio gestore delle schede.
 * @version 1.0
 * @author E.Mezzano - E.Santoboni
 */
public class CardManager extends AbstractService implements ICardManager {
	
	public void init() throws Exception {
		ApsSystemUtils.getLogger().config(this.getClass().getName() + ": inizializzato ");
	}
	
	public List<Card> getCards() throws ApsSystemException {
		List<Card> cards = null;
		try {
			cards = this.getCardDAO().loadCards();
		} catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "getCards");
			throw new ApsSystemException("Errore in caricamento lista cards", t);
		}
		return cards;
	}
	
	public List<Card> searchCards(String holder) throws ApsSystemException {
		List<Card> cards = null;
		try {
			cards = this.getCardDAO().searchCards(holder);
		} catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "searchCards");
			throw new ApsSystemException("Errore in ricerca cards", t);
		}
		return cards;
	}
	
	public Card getCard(int id) throws ApsSystemException {
		Card card = null;
		try {
			card = this.getCardDAO().loadCard(id);
		} catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "getCard");
			throw new ApsSystemException("Errore in ricerca card con id " + id, t);
		}
		return card;
	}
	
	public void addCard(Card card) throws ApsSystemException {
		try {
			this.getCardDAO().addCard(card);
		} catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "addCard");
			throw new ApsSystemException("Errore in aggiunta card", t);
		}
	}
	
	public void updateCard(Card card) throws ApsSystemException {
		try {
			this.getCardDAO().updateCard(card);
		} catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "updateCard");
			throw new ApsSystemException("Errore in aggiornamento card", t);
		}
	}
	
	public void deleteCard(int id) throws ApsSystemException {
		try {
			this.getCardDAO().deleteCard(id);
		} catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "deleteCard");
			throw new ApsSystemException("Errore in cancellazione card con id " + id, t);
		}
	}
	
	/**
	 * Restituisce il dao delle schede.
	 * @return Il dao delle schede.
	 */
	protected ICardDAO getCardDAO() {
		return _cardDAO;
	}
	
	/**
	 * Imposta il dao delle schede.
	 * @param cardDAO Il dao delle schede.
	 */
	public void setCardDAO(ICardDAO cardDAO) {
		this._cardDAO = cardDAO;
	}
	
	private ICardDAO _cardDAO;
	
}