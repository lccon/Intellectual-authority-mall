package com.mall.vo;

import com.mall.domain.AuthorizeCompany;
import com.mall.domain.IntellectualTask;
import com.mall.domain.TaskRelease;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/21
 * @Author:lc
 */
public class SearchBusinessVO {

    /** 总页数 */
    private Integer totalPage;
    /** 总记录数 */
    private Integer totalRecord;
    /** 知识产权 */
    private List<IntellectualTask> intellectualTaskList;
    /** 代办公司 */
    private List<AuthorizeCompany> authorizeCompanyList;
    /** 任务发布 */
    private List<TaskRelease> taskReleaseList;

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(Integer totalRecord) {
        this.totalRecord = totalRecord;
    }

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
