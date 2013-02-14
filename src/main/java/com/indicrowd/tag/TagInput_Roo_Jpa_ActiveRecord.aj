// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.tag;

import com.indicrowd.tag.TagInput;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TagInput_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager TagInput.entityManager;
    
    public static final EntityManager TagInput.entityManager() {
        EntityManager em = new TagInput().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long TagInput.countTagInputs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TagInput o", Long.class).getSingleResult();
    }
    
    public static List<TagInput> TagInput.findAllTagInputs() {
        return entityManager().createQuery("SELECT o FROM TagInput o", TagInput.class).getResultList();
    }
    
    public static TagInput TagInput.findTagInput(String tagInputStr) {
        if (tagInputStr == null || tagInputStr.length() == 0) return null;
        return entityManager().find(TagInput.class, tagInputStr);
    }
    
    public static List<TagInput> TagInput.findTagInputEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TagInput o", TagInput.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void TagInput.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void TagInput.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            TagInput attached = TagInput.findTagInput(this.tagInputStr);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void TagInput.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void TagInput.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public TagInput TagInput.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TagInput merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
