// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.user.model;

import com.indicrowd.auth.Auth;
import com.indicrowd.user.model.UserAuth;
import com.indicrowd.user.model.UserInfo;

privileged aspect UserAuth_Roo_JavaBean {
    
    public UserInfo UserAuth.getUserInfo() {
        return this.userInfo;
    }
    
    public void UserAuth.setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }
    
    public Auth UserAuth.getAuth() {
        return this.auth;
    }
    
    public void UserAuth.setAuth(Auth auth) {
        this.auth = auth;
    }
    
}
