// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.concert.model;

import com.indicrowd.band.BandInfo;
import com.indicrowd.concert.model.Concert;
import com.indicrowd.concert.model.Hall;
import java.util.Date;

privileged aspect Concert_Roo_JavaBean {
    
    public String Concert.getTitle() {
        return this.title;
    }
    
    public void Concert.setTitle(String title) {
        this.title = title;
    }
    
    public String Concert.getDescription() {
        return this.description;
    }
    
    public void Concert.setDescription(String description) {
        this.description = description;
    }
    
    public Hall Concert.getHall() {
        return this.hall;
    }
    
    public void Concert.setHall(Hall hall) {
        this.hall = hall;
    }
    
    public Long Concert.getHallId() {
        return this.hallId;
    }
    
    public void Concert.setHallId(Long hallId) {
        this.hallId = hallId;
    }
    
    public BandInfo Concert.getBandInfo() {
        return this.bandInfo;
    }
    
    public void Concert.setBandInfo(BandInfo bandInfo) {
        this.bandInfo = bandInfo;
    }
    
    public Long Concert.getBandId() {
        return this.bandId;
    }
    
    public void Concert.setBandId(Long bandId) {
        this.bandId = bandId;
    }
    
    public Date Concert.getInputDate() {
        return this.inputDate;
    }
    
    public void Concert.setInputDate(Date inputDate) {
        this.inputDate = inputDate;
    }
    
    public Integer Concert.getStartDate() {
        return this.startDate;
    }
    
    public void Concert.setStartDate(Integer startDate) {
        this.startDate = startDate;
    }
    
    public Integer Concert.getStartHours() {
        return this.startHours;
    }
    
    public void Concert.setStartHours(Integer startHours) {
        this.startHours = startHours;
    }
    
    public Integer Concert.getStartMinutes() {
        return this.startMinutes;
    }
    
    public void Concert.setStartMinutes(Integer startMinutes) {
        this.startMinutes = startMinutes;
    }
    
    public Integer Concert.getDuration() {
        return this.duration;
    }
    
    public void Concert.setDuration(Integer duration) {
        this.duration = duration;
    }
    
    public int Concert.getAudienceLimit() {
        return this.audienceLimit;
    }
    
    public void Concert.setAudienceLimit(int audienceLimit) {
        this.audienceLimit = audienceLimit;
    }
    
    public String Concert.getYoutubeLink() {
        return this.youtubeLink;
    }
    
    public void Concert.setYoutubeLink(String youtubeLink) {
        this.youtubeLink = youtubeLink;
    }
    
    public boolean Concert.isIsValid() {
        return this.isValid;
    }
    
    public void Concert.setIsValid(boolean isValid) {
        this.isValid = isValid;
    }
    
}
