// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.post;

import com.indicrowd.band.BandInfo;
import com.indicrowd.post.Post;
import com.indicrowd.user.model.UserInfo;
import java.util.Calendar;

privileged aspect Post_Roo_JavaBean {
    
    public Calendar Post.getDate() {
        return this.date;
    }
    
    public void Post.setDate(Calendar date) {
        this.date = date;
    }
    
    public String Post.getTitle() {
        return this.title;
    }
    
    public void Post.setTitle(String title) {
        this.title = title;
    }
    
    public BandInfo Post.getBandInfo() {
        return this.bandInfo;
    }
    
    public void Post.setBandInfo(BandInfo bandInfo) {
        this.bandInfo = bandInfo;
    }
    
    public UserInfo Post.getUserInfo() {
        return this.userInfo;
    }
    
    public void Post.setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }
    
    public BandInfo Post.getWriteBandInfo() {
        return this.writeBandInfo;
    }
    
    public void Post.setWriteBandInfo(BandInfo writeBandInfo) {
        this.writeBandInfo = writeBandInfo;
    }
    
    public String Post.getAuthor() {
        return this.author;
    }
    
    public void Post.setAuthor(String author) {
        this.author = author;
    }
    
    public String Post.getAuthorImageUrl() {
        return this.authorImageUrl;
    }
    
    public void Post.setAuthorImageUrl(String authorImageUrl) {
        this.authorImageUrl = authorImageUrl;
    }
    
    public int Post.getCommentCount() {
        return this.commentCount;
    }
    
    public void Post.setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }
    
    public String Post.getSummary() {
        return this.summary;
    }
    
    public void Post.setSummary(String summary) {
        this.summary = summary;
    }
    
    public String Post.getContent() {
        return this.content;
    }
    
    public void Post.setContent(String content) {
        this.content = content;
    }
    
    public String Post.getType() {
        return this.type;
    }
    
    public void Post.setType(String type) {
        this.type = type;
    }
    
    public String Post.getSrc() {
        return this.src;
    }
    
    public void Post.setSrc(String src) {
        this.src = src;
    }
    
    public boolean Post.isHide() {
        return this.hide;
    }
    
    public void Post.setHide(boolean hide) {
        this.hide = hide;
    }
    
}
