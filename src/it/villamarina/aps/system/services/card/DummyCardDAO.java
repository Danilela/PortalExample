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

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.beanutils.BeanComparator;

import com.agiletec.aps.system.common.AbstractDAO;
import com.agiletec.aps.util.DateConverter;

/**
 * Classe DAO fasulla per simulare la presenza di un DB. 
 * Estende la classe AbstractDAO pur non eseguendo operazioni su DB ma operando esclusivamente su una List di Card popolata nel costruttore della classe.
 * @author E.Mezzano
 */
public class DummyCardDAO extends AbstractDAO implements ICardDAO {
	
	/**
	 * Costruttore implementato per popolare una List iniziale di card per simulare un Database
	 */
	public DummyCardDAO() {
		this._cards = new ArrayList<Card>();
		this._cards.add(this.createCard(1, "Bianchi Marco", "Old Town", "20/10/2010", null));
		this._cards.add(this.createCard(2, "Rossi Carla", "Fair", "20/12/2010", null));
		this._cards.add(this.createCard(3, "Verdi Nicola", "Fair", "25/01/2011", null));
		this._cards.add(this.createCard(4, "Verdi Anna", "Old Town", "05/11/2010", null));
		
		BeanComparator comparator = new BeanComparator("holder");
		Collections.sort(this._cards, comparator);
	}
	
	/**
	 * Metodo di utilità per la creazione di una scheda.
	 * @param id L'identificativo della scheda.
	 * @param holder Il titolare della scheda.
	 * @param descr La descrizione della scheda.
	 * @param date La data di rilascio della scheda.
	 * @param note Le note della scheda.
	 * @return Una nuova scheda popolata con i parametri.
	 */
	private Card createCard(int id, String holder, String descr, String date, String note) {
		Card card = new Card();
		card.setId(id);
		card.setHolder(holder);
		card.setDescr(descr);
		card.setDate(DateConverter.parseDate(date, "dd/MM/yyyy"));
		card.setNote(note);
		return card;
	}
	
	public List<Card> loadCards() {
		BeanComparator comparator = new BeanComparator("holder");
		Collections.sort(this._cards, comparator);
		return this._cards;
	}
	
	public List<Card> searchCards(String holder) {
		List<Card> foundCards = new ArrayList<Card>();
		if (holder == null || holder.length() == 0) {
			foundCards = this._cards;
		} else {
			Iterator<Card> cardsIter = this._cards.iterator();
			while (cardsIter.hasNext()) {
				Card card = (Card) cardsIter.next();
				String currentHolder = card.getHolder();
				if (currentHolder.toLowerCase().contains(holder.toLowerCase())) {
					foundCards.add(card);
				}
			}
		}
		return foundCards;
	}
	
	public Card loadCard(int id) {
		Iterator<Card> cardsIter = this._cards.iterator();
		while (cardsIter.hasNext()) {
			Card card = (Card) cardsIter.next();
			if (id == card.getId()) {
				return card;
			}
		}
		return null;
	}
	
	public void addCard(Card card) {
		int nextId = this.getNextId();
		card.setId(nextId);
		this._cards.add(card);
		BeanComparator comparator = new BeanComparator("holder");
		Collections.sort(this._cards, comparator);
	}
	
	public void updateCard(Card card) {
		int index = 0;
		int id = card.getId();
		Iterator<Card> cardsIter = this._cards.iterator();
		while (cardsIter.hasNext()) {
			Card currentCard = (Card) cardsIter.next();
			if (id == currentCard.getId()) {
				this._cards.remove(index);
				this._cards.add(card);
				break;
			}
			index++;
		}
	}
	
	public void deleteCard(int id) {
		int index = 0;
		Iterator<Card> cardsIter = this._cards.iterator();
		while (cardsIter.hasNext()) {
			Card currentCard = (Card) cardsIter.next();
			if (id == currentCard.getId()) {
				this._cards.remove(index);
				break;
			}
			index++;
		}
	}
	
	/**
	 * Metodo di utilità. Recupera il primo identificativo utile.
	 * @return Il primo identificativo utile.
	 */
	protected int getNextId() {
		int lastId = 0;
		Iterator<Card> cardsIter = this._cards.iterator();
		while (cardsIter.hasNext()) {
			Card currentCard = (Card) cardsIter.next();
			int currentId = currentCard.getId();
			if (currentId>lastId) {
				lastId = currentId;
			}
		}
		return lastId+1;
	}
	
	private List<Card> _cards;
	
}