// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.band;

import com.indicrowd.band.BandInfo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect BandInfo_Roo_Jpa_Entity {
    
    declare @type: BandInfo: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long BandInfo.id;
    
    @Version
    @Column(name = "version")
    private Integer BandInfo.version;
    
    public Long BandInfo.getId() {
        return this.id;
    }
    
    public void BandInfo.setId(Long id) {
        this.id = id;
    }
    
    public Integer BandInfo.getVersion() {
        return this.version;
    }
    
    public void BandInfo.setVersion(Integer version) {
        this.version = version;
    }
    
}
