package com.mall.base;

import java.io.Serializable;
import java.util.Date;

/**
 * Description:
 *
 * @Date:2019/11/22
 * @Author:lc
 */
public class BaseDomain implements Serializable {

    private Date createDate;

    private String createUser;

    private Date updateDate;

    private String updateUser;

    private String mobile;

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
