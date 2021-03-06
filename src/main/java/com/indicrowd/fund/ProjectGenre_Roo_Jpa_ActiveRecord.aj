// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.fund;

import com.indicrowd.fund.ProjectGenre;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProjectGenre_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ProjectGenre.entityManager;
    
    public static final EntityManager ProjectGenre.entityManager() {
        EntityManager em = new ProjectGenre().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ProjectGenre.countProjectGenres() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ProjectGenre o", Long.class).getSingleResult();
    }
    
    public static List<ProjectGenre> ProjectGenre.findAllProjectGenres() {
        return entityManager().createQuery("SELECT o FROM ProjectGenre o", ProjectGenre.class).getResultList();
    }
    
    public static ProjectGenre ProjectGenre.findProjectGenre(Long id) {
        if (id == null) return null;
        return entityManager().find(ProjectGenre.class, id);
    }
    
    public static List<ProjectGenre> ProjectGenre.findProjectGenreEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ProjectGenre o", ProjectGenre.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ProjectGenre.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ProjectGenre.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ProjectGenre attached = ProjectGenre.findProjectGenre(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ProjectGenre.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ProjectGenre.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ProjectGenre ProjectGenre.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ProjectGenre merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
