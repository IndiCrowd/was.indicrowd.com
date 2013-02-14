// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.concert.model;

import com.indicrowd.concert.model.Concert;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Concert_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Concert.entityManager;
    
    public static final EntityManager Concert.entityManager() {
        EntityManager em = new Concert().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Concert.countConcerts() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Concert o", Long.class).getSingleResult();
    }
    
    public static List<Concert> Concert.findAllConcerts() {
        return entityManager().createQuery("SELECT o FROM Concert o", Concert.class).getResultList();
    }
    
    public static Concert Concert.findConcert(Long id) {
        if (id == null) return null;
        return entityManager().find(Concert.class, id);
    }
    
    public static List<Concert> Concert.findConcertEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Concert o", Concert.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Concert.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Concert.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Concert attached = Concert.findConcert(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Concert.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Concert.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Concert Concert.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Concert merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
