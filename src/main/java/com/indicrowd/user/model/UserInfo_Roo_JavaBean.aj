// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.user.model;

import com.indicrowd.band.BandInfo;
import com.indicrowd.user.model.UserAuth;
import com.indicrowd.user.model.UserInfo;
import java.util.Date;
import java.util.List;
import java.util.Set;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

privileged aspect UserInfo_Roo_JavaBean {
    
    public String UserInfo.getUsername() {
        return this.username;
    }
    
    public void UserInfo.setUsername(String username) {
        this.username = username;
    }
    
    public String UserInfo.getPassword() {
        return this.password;
    }
    
    public void UserInfo.setPassword(String password) {
        this.password = password;
    }
    
    public String UserInfo.getPasswordConfirm() {
        return this.passwordConfirm;
    }
    
    public void UserInfo.setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }
    
    public String UserInfo.getNickname() {
        return this.nickname;
    }
    
    public void UserInfo.setNickname(String nickname) {
        this.nickname = nickname;
    }
    
    public String UserInfo.getEmail() {
        return this.email;
    }
    
    public void UserInfo.setEmail(String email) {
        this.email = email;
    }
    
    public Date UserInfo.getJoinDate() {
        return this.joinDate;
    }
    
    public void UserInfo.setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }
    
    public Date UserInfo.getLastLoginDate() {
        return this.lastLoginDate;
    }
    
    public void UserInfo.setLastLoginDate(Date lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }
    
    public int UserInfo.getLoginCount() {
        return this.loginCount;
    }
    
    public void UserInfo.setLoginCount(int loginCount) {
        this.loginCount = loginCount;
    }
    
    public boolean UserInfo.isTermsAgree() {
        return this.termsAgree;
    }
    
    public void UserInfo.setTermsAgree(boolean termsAgree) {
        this.termsAgree = termsAgree;
    }
    
    public boolean UserInfo.isSocialUser() {
        return this.socialUser;
    }
    
    public void UserInfo.setSocialUser(boolean socialUser) {
        this.socialUser = socialUser;
    }
    
    public String UserInfo.getSocialDisplayName() {
        return this.socialDisplayName;
    }
    
    public void UserInfo.setSocialDisplayName(String socialDisplayName) {
        this.socialDisplayName = socialDisplayName;
    }
    
    public String UserInfo.getSocialImageUrl() {
        return this.socialImageUrl;
    }
    
    public void UserInfo.setSocialImageUrl(String socialImageUrl) {
        this.socialImageUrl = socialImageUrl;
    }
    
    public String UserInfo.getSocialProfileUrl() {
        return this.socialProfileUrl;
    }
    
    public void UserInfo.setSocialProfileUrl(String socialProfileUrl) {
        this.socialProfileUrl = socialProfileUrl;
    }
    
    public String UserInfo.getSocialProviderId() {
        return this.socialProviderId;
    }
    
    public void UserInfo.setSocialProviderId(String socialProviderId) {
        this.socialProviderId = socialProviderId;
    }
    
    public String UserInfo.getSocialProviderUserId() {
        return this.socialProviderUserId;
    }
    
    public void UserInfo.setSocialProviderUserId(String socialProviderUserId) {
        this.socialProviderUserId = socialProviderUserId;
    }
    
    public boolean UserInfo.isEnabled() {
        return this.enabled;
    }
    
    public void UserInfo.setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
    
    public CommonsMultipartFile UserInfo.getProfilePhoto() {
        return this.profilePhoto;
    }
    
    public void UserInfo.setProfilePhoto(CommonsMultipartFile profilePhoto) {
        this.profilePhoto = profilePhoto;
    }
    
    public Set<UserAuth> UserInfo.getAuths() {
        return this.auths;
    }
    
    public void UserInfo.setAuths(Set<UserAuth> auths) {
        this.auths = auths;
    }
    
    public List<BandInfo> UserInfo.getUserBand() {
        return this.userBand;
    }
    
    public void UserInfo.setUserBand(List<BandInfo> userBand) {
        this.userBand = userBand;
    }
    
    public Long UserInfo.getEnergy() {
        return this.energy;
    }
    
    public void UserInfo.setEnergy(Long energy) {
        this.energy = energy;
    }
    
}
