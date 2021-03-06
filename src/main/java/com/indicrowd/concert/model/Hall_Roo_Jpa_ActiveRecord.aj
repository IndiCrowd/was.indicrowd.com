// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.concert.model;

import com.indicrowd.concert.model.Hall;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Hall_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Hall.entityManager;
    
    public static final EntityManager Hall.entityManager() {
        EntityManager em = new Hall().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Hall.countHalls() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Hall o", Long.class).getSingleResult();
    }
    
    public static List<Hall> Hall.findAllHalls() {
        return entityManager().createQuery("SELECT o FROM Hall o", Hall.class).getResultList();
    }
    
    public static Hall Hall.findHall(Long id) {
        if (id == null) return null;
        return entityManager().find(Hall.class, id);
    }
    
    public static List<Hall> Hall.findHallEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Hall o", Hall.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Hall.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Hall.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Hall attached = Hall.findHall(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Hall.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Hall.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Hall Hall.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Hall merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
