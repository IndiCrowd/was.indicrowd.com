// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.indicrowd.shop;

import com.indicrowd.shop.Shop;

privileged aspect Shop_Roo_JavaBean {
    
    public String Shop.getName() {
        return this.name;
    }
    
    public void Shop.setName(String name) {
        this.name = name;
    }
    
}