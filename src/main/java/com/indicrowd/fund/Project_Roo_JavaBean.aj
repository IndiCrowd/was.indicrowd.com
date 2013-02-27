// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.fund;

import com.indicrowd.fund.Project;
import com.indicrowd.fund.ProjectGenre;
import com.indicrowd.tag.Tag;
import com.indicrowd.user.model.UserInfo;
import java.util.Date;
import java.util.Set;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

privileged aspect Project_Roo_JavaBean {
    
    public String Project.getTitle() {
        return this.title;
    }
    
    public void Project.setTitle(String title) {
        this.title = title;
    }
    
    public String Project.getSummary() {
        return this.summary;
    }
    
    public void Project.setSummary(String summary) {
        this.summary = summary;
    }
    
    public String Project.getContent() {
        return this.content;
    }
    
    public void Project.setContent(String content) {
        this.content = content;
    }
    
    public UserInfo Project.getCreator() {
        return this.creator;
    }
    
    public void Project.setCreator(UserInfo creator) {
        this.creator = creator;
    }
    
    public Date Project.getCreateDate() {
        return this.createDate;
    }
    
    public void Project.setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public CommonsMultipartFile Project.getProfilePhoto() {
        return this.profilePhoto;
    }
    
    public void Project.setProfilePhoto(CommonsMultipartFile profilePhoto) {
        this.profilePhoto = profilePhoto;
    }
    
    public Tag Project.getMainGenre() {
        return this.mainGenre;
    }
    
    public void Project.setMainGenre(Tag mainGenre) {
        this.mainGenre = mainGenre;
    }
    
    public String Project.getMainGenreStr() {
        return this.mainGenreStr;
    }
    
    public void Project.setMainGenreStr(String mainGenreStr) {
        this.mainGenreStr = mainGenreStr;
    }
    
    public Set<ProjectGenre> Project.getGenres() {
        return this.genres;
    }
    
    public void Project.setGenres(Set<ProjectGenre> genres) {
        this.genres = genres;
    }
    
    public String Project.getGenresStr() {
        return this.genresStr;
    }
    
    public void Project.setGenresStr(String genresStr) {
        this.genresStr = genresStr;
    }
    
    public Date Project.getStartDate() {
        return this.startDate;
    }
    
    public void Project.setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    
    public Date Project.getEndDate() {
        return this.endDate;
    }
    
    public void Project.setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    
    public int Project.getTargetFigure() {
        return this.targetFigure;
    }
    
    public void Project.setTargetFigure(int targetFigure) {
        this.targetFigure = targetFigure;
    }
    
    public String Project.getContact() {
        return this.contact;
    }
    
    public void Project.setContact(String contact) {
        this.contact = contact;
    }
    
    public boolean Project.isOpened() {
        return this.opened;
    }
    
    public void Project.setOpened(boolean opened) {
        this.opened = opened;
    }
    
}
