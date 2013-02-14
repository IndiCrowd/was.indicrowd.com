// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.concert.model;

import com.indicrowd.concert.model.Message;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Message_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Message.entityManager;
    
    public static final EntityManager Message.entityManager() {
        EntityManager em = new Message().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Message.countMessages() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Message o", Long.class).getSingleResult();
    }
    
    public static List<Message> Message.findAllMessages() {
        return entityManager().createQuery("SELECT o FROM Message o", Message.class).getResultList();
    }
    
    public static Message Message.findMessage(Long id) {
        if (id == null) return null;
        return entityManager().find(Message.class, id);
    }
    
    public static List<Message> Message.findMessageEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Message o", Message.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Message.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Message.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Message attached = Message.findMessage(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Message.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Message.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Message Message.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Message merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
