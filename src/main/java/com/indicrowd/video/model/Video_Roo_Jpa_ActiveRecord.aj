// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.video.model;

import com.indicrowd.video.model.Video;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Video_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Video.entityManager;
    
    public static final EntityManager Video.entityManager() {
        EntityManager em = new Video().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Video.countVideos() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Video o", Long.class).getSingleResult();
    }
    
    public static List<Video> Video.findAllVideos() {
        return entityManager().createQuery("SELECT o FROM Video o", Video.class).getResultList();
    }
    
    public static Video Video.findVideo(Long id) {
        if (id == null) return null;
        return entityManager().find(Video.class, id);
    }
    
    public static List<Video> Video.findVideoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Video o", Video.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Video.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Video.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Video attached = Video.findVideo(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Video.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Video.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Video Video.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Video merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
