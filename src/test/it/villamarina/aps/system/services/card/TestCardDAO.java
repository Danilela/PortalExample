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
package test.it.villamarina.aps.system.services.card;

import it.villamarina.aps.system.services.card.Card;
import it.villamarina.aps.system.services.card.DummyCardDAO;
import it.villamarina.aps.system.services.card.ICardDAO;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import test.it.villamarina.aps.VillamarinaBaseTestCase;

/**
 * Classe di test per il DAO delle schede.
 * @author E.Mezzano
 */
public class TestCardDAO extends VillamarinaBaseTestCase {
	
	protected void setUp() throws Exception {
		super.setUp();
		this.init();
	}
	
	/**
	 * Esegue il test sul corretto funzionamento del metodo 'loadCards'.
	 */
	public void testLoadCards() {
		List<Card> cards = this._cardDAO.loadCards();
		assertEquals(4, cards.size());
	}
	
	/**
	 * Esegue il test sul corretto funzionamento del metodo 'searchCards'.
	 */
	public void testSearchCards() {
		List<Card> cards = this._cardDAO.searchCards("anch");
		assertEquals(1, cards.size());
		Card card = (Card) cards.get(0);
		String titolare = card.getHolder();
		assertTrue(titolare.equals("Bianchi Marco"));
	}
	
	/**
	 * Esegue il test sul corretto funzionamento del metodo 'loadCard'.
	 */
	public void testLoadCard() {
		Card card = this._cardDAO.loadCard(1);
		assertEquals("Bianchi Marco", card.getHolder());
		card = this._cardDAO.loadCard(2);
		assertEquals("Rossi Carla", card.getHolder());
		card = this._cardDAO.loadCard(3);
		assertEquals("Verdi Nicola", card.getHolder());
	}
	
	/**
	 * Esegue il test sul corretto funzionamento dei metodi 'addCard' e 'deleteCard' per l'aggiunta e la cancellazione di una scheda.
	 */
	public void testAddDeleteCard() {
		Card newCard = new Card();
		newCard.setHolder("Goofy Goof");
		newCard.setDescr("I'm Mickey Mouse's best friend");
		newCard.setDate(new Date());
		newCard.setNote("Annotations");
		
		this._cardDAO.addCard(newCard);
		
		Card card = this._cardDAO.loadCard(5);
		assertEquals("Goofy Goof", card.getHolder());
		assertEquals("I'm Mickey Mouse's best friend", card.getDescr());
		assertEquals("Annotations", card.getNote());
		
		this._cardDAO.deleteCard(16);
		
		assertNull(this._cardDAO.loadCard(16));
	}
	
	/**
	 * Esegue il test sul corretto funzionamento del metodo 'updateCard'.
	 */
	public void testUpdateCard() {
		Card card = this._cardDAO.loadCard(2);
		String oldTitolare = card.getHolder();
		String oldDescrizione = card.getDescr();
		Date oldDataRilascio = card.getDate();
		String oldNote = card.getNote();
		card.setHolder("Marco Rossi");
		card.setDescr("Main Project Manager");
		card.setDate(new Date());
		card.setNote("with Walter Bianchi");
		
		this._cardDAO.updateCard(card);
		
		Card updatedCard = this._cardDAO.loadCard(2);
		assertEquals("Marco Rossi", updatedCard.getHolder());
		assertEquals("Main Project Manager", updatedCard.getDescr());
		assertEquals("with Walter Bianchi", updatedCard.getNote());
		
		card.setHolder(oldTitolare);
		card.setDescr(oldDescrizione);
		card.setDate(oldDataRilascio);
		card.setNote(oldNote);
		
		this._cardDAO.updateCard(card);
		
		updatedCard = this._cardDAO.loadCard(2);
		assertEquals("Rossi Carla", updatedCard.getHolder());
		assertEquals("Fair", updatedCard.getDescr());
		assertNull(updatedCard.getNote());
	}
	
	/**
	 * Esegue le operazioni di inizializzazione della classe di test. Crea il dao da testare impostandone il datasource.
	 */
	private void init() {
		DataSource dataSource = (DataSource) this.getApplicationContext().getBean("servDataSource");
		DummyCardDAO cardDAO = new DummyCardDAO();
		cardDAO.setDataSource(dataSource);
		this._cardDAO = cardDAO;
	}
	
	private ICardDAO _cardDAO;
	
}