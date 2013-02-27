// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.fund;

import com.indicrowd.fund.Investor;
import com.indicrowd.fund.Project;
import com.indicrowd.fund.Reward;
import com.indicrowd.user.model.UserInfo;
import java.util.Date;

privileged aspect Investor_Roo_JavaBean {
    
    public Project Investor.getProject() {
        return this.project;
    }
    
    public void Investor.setProject(Project project) {
        this.project = project;
    }
    
    public Long Investor.getProjectId() {
        return this.projectId;
    }
    
    public void Investor.setProjectId(Long projectId) {
        this.projectId = projectId;
    }
    
    public Reward Investor.getReward() {
        return this.reward;
    }
    
    public void Investor.setReward(Reward reward) {
        this.reward = reward;
    }
    
    public Long Investor.getRewardId() {
        return this.rewardId;
    }
    
    public void Investor.setRewardId(Long rewardId) {
        this.rewardId = rewardId;
    }
    
    public UserInfo Investor.getUserInfo() {
        return this.userInfo;
    }
    
    public void Investor.setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }
    
    public Date Investor.getInvestDate() {
        return this.investDate;
    }
    
    public void Investor.setInvestDate(Date investDate) {
        this.investDate = investDate;
    }
    
}
