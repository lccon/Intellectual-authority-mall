package com.mall.service.impl;

import com.mall.domain.AuthorizeCompany;
import com.mall.domain.IntellectualTask;
import com.mall.domain.TaskRelease;
import com.mall.service.AuthorizeCompanyService;
import com.mall.service.IntellectualTaskService;
import com.mall.service.SearchService;
import com.mall.service.TaskReleaseService;
import com.mall.vo.SearchBusinessVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/21
 * @Author:lc
 */
@Service("searchService")
public class SearchServiceImpl implements SearchService{

    @Autowired
    private IntellectualTaskService intellectualTaskService;
    @Autowired
    private AuthorizeCompanyService authorizeCompanyService;
    @Autowired
    private TaskReleaseService taskReleaseService;

    @Override
    public SearchBusinessVO getSearchBusinessData(int page, int rows, String productName, String productBrief) {

        int record = page * rows;

        List<IntellectualTask> intellectualTaskList = intellectualTaskService.findByintellectualTask(productName, productBrief);
        List<AuthorizeCompany> authorizeCompanyList = authorizeCompanyService.findByAuthorizeCompany(productName, productBrief);
        List<TaskRelease> taskReleaseList = taskReleaseService.findBytaskRelease(productName, productBrief);

        Integer totalRecord = intellectualTaskList.size() + authorizeCompanyList.size() + taskReleaseList.size();

        SearchBusinessVO searchBusinessVO = new SearchBusinessVO();
        searchBusinessVO.setTotalRecord(totalRecord);
        searchBusinessVO.setTotalPage((totalRecord / rows) + 1);

        if (intellectualTaskList.size() >= record) {
            intellectualTaskList = intellectualTaskList.subList(2*(page - 1), (page * rows));
            searchBusinessVO.setIntellectualTaskList(intellectualTaskList);
            return searchBusinessVO;
        } else if (intellectualTaskList.size() > ((page - 1) * rows) && intellectualTaskList.size() < record) {
            int totalTask = intellectualTaskList.size();
            intellectualTaskList = intellectualTaskList.subList((page - 1) * rows, intellectualTaskList.size());
            searchBusinessVO.setIntellectualTaskList(intellectualTaskList);
            int alsoRecord = (rows - (totalTask - ((page - 1) * rows)));
            if (authorizeCompanyList.size() >= alsoRecord) {
                authorizeCompanyList = authorizeCompanyList.subList(0, alsoRecord);
                searchBusinessVO.setAuthorizeCompanyList(authorizeCompanyList);
                return searchBusinessVO;
            } else {
                authorizeCompanyList = authorizeCompanyList.subList(0, authorizeCompanyList.size());
                searchBusinessVO.setAuthorizeCompanyList(authorizeCompanyList);
                alsoRecord = alsoRecord - authorizeCompanyList.size();
                taskReleaseList = taskReleaseList.subList(0, alsoRecord);
                searchBusinessVO.setTaskReleaseList(taskReleaseList);
                return searchBusinessVO;
            }
        } else if (intellectualTaskList.size() <= ((page - 1) * rows)) {
            intellectualTaskList = intellectualTaskList.subList(0, intellectualTaskList.size());
            searchBusinessVO.setIntellectualTaskList(intellectualTaskList);
            int alsoRecord = record - intellectualTaskList.size();
            if (authorizeCompanyList.size() >= alsoRecord) {
                authorizeCompanyList = authorizeCompanyList.subList(0, alsoRecord);
                searchBusinessVO.setAuthorizeCompanyList(authorizeCompanyList);
                return searchBusinessVO;
            } else {
                authorizeCompanyList = authorizeCompanyList.subList(0, authorizeCompanyList.size());
                searchBusinessVO.setAuthorizeCompanyList(authorizeCompanyList);
                alsoRecord = alsoRecord - authorizeCompanyList.size();
                taskReleaseList = taskReleaseList.subList(0, alsoRecord);
                searchBusinessVO.setTaskReleaseList(taskReleaseList);
                return searchBusinessVO;
            }
        }
        return searchBusinessVO;
    }
}

