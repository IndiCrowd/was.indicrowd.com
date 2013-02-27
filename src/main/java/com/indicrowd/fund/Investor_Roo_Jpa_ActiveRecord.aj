// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.fund;

import com.indicrowd.fund.Investor;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Investor_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Investor.entityManager;
    
    public static final EntityManager Investor.entityManager() {
        EntityManager em = new Investor().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Investor.countInvestors() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Investor o", Long.class).getSingleResult();
    }
    
    public static List<Investor> Investor.findAllInvestors() {
        return entityManager().createQuery("SELECT o FROM Investor o", Investor.class).getResultList();
    }
    
    public static Investor Investor.findInvestor(Long id) {
        if (id == null) return null;
        return entityManager().find(Investor.class, id);
    }
    
    public static List<Investor> Investor.findInvestorEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Investor o", Investor.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Investor.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Investor.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Investor attached = Investor.findInvestor(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Investor.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Investor.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Investor Investor.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Investor merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
