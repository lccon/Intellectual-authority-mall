package com.mall.vo;

import com.mall.domain.AuthorizeCompany;
import com.mall.domain.IntellectualTask;
import com.mall.domain.TaskRelease;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/24
 * @Author:lc
 */
public class MeSeeWhoVO {

    private List<IntellectualTask> intellectualTaskList;

    private List<AuthorizeCompany>  authorizeCompanyList;

    private List<TaskRelease> taskReleaseList;

    public List<IntellectualTask> getIntellectualTaskList() {
        return intellectualTaskList;
    }

    public void setIntellectualTaskList(List<IntellectualTask> intellectualTaskList) {
        this.intellectualTaskList = intellectualTaskList;
    }

    public List<AuthorizeCompany> getAuthorizeCompanyList() {
        return authorizeCompanyList;
    }

    public void setAuthorizeCompanyList(List<AuthorizeCompany> authorizeCompanyList) {
        this.authorizeCompanyList = authorizeCompanyList;
    }

    public List<TaskRelease> getTaskReleaseList() {
        return taskReleaseList;
    }

    public void setTaskReleaseList(List<TaskRelease> taskReleaseList) {
        this.taskReleaseList = taskReleaseList;
    }
}
