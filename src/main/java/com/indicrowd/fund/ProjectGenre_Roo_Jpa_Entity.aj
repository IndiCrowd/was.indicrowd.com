// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.fund;

import com.indicrowd.fund.ProjectGenre;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect ProjectGenre_Roo_Jpa_Entity {
    
    declare @type: ProjectGenre: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ProjectGenre.id;
    
    @Version
    @Column(name = "version")
    private Integer ProjectGenre.version;
    
    public Long ProjectGenre.getId() {
        return this.id;
    }
    
    public void ProjectGenre.setId(Long id) {
        this.id = id;
    }
    
    public Integer ProjectGenre.getVersion() {
        return this.version;
    }
    
    public void ProjectGenre.setVersion(Integer version) {
        this.version = version;
    }
    
}
