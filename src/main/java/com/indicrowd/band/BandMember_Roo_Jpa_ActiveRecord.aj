// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.band;

import com.indicrowd.band.BandMember;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect BandMember_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager BandMember.entityManager;
    
    public static final EntityManager BandMember.entityManager() {
        EntityManager em = new BandMember().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long BandMember.countBandMembers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM BandMember o", Long.class).getSingleResult();
    }
    
    public static List<BandMember> BandMember.findAllBandMembers() {
        return entityManager().createQuery("SELECT o FROM BandMember o", BandMember.class).getResultList();
    }
    
    public static BandMember BandMember.findBandMember(Long id) {
        if (id == null) return null;
        return entityManager().find(BandMember.class, id);
    }
    
    public static List<BandMember> BandMember.findBandMemberEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM BandMember o", BandMember.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void BandMember.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void BandMember.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            BandMember attached = BandMember.findBandMember(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void BandMember.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void BandMember.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public BandMember BandMember.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        BandMember merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
