// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.band;

import com.indicrowd.band.BandRoleType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect BandRoleType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager BandRoleType.entityManager;
    
    public static final EntityManager BandRoleType.entityManager() {
        EntityManager em = new BandRoleType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long BandRoleType.countBandRoleTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM BandRoleType o", Long.class).getSingleResult();
    }
    
    public static List<BandRoleType> BandRoleType.findAllBandRoleTypes() {
        return entityManager().createQuery("SELECT o FROM BandRoleType o", BandRoleType.class).getResultList();
    }
    
    public static BandRoleType BandRoleType.findBandRoleType(Long id) {
        if (id == null) return null;
        return entityManager().find(BandRoleType.class, id);
    }
    
    public static List<BandRoleType> BandRoleType.findBandRoleTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM BandRoleType o", BandRoleType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void BandRoleType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void BandRoleType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            BandRoleType attached = BandRoleType.findBandRoleType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void BandRoleType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void BandRoleType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public BandRoleType BandRoleType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        BandRoleType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
