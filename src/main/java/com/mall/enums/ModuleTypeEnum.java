package com.mall.enums;

/**
 * Description:
 *
 * @Date:2020/2/15
 * @Author:lc
 */
public enum ModuleTypeEnum {

    INTELLECTUAL_TASK(1, "知识产权"),
    AUTHORIZE_COMPANY(2, "代办公司"),
    TASK_RELEASE(3, "需求任务");

    /** 类型编码 */
    private Integer moduleCode;
    /** 类型描述 */
    private String moduleDesc;

    ModuleTypeEnum(Integer moduleCode, String moduleDesc) {
        this.moduleCode = moduleCode;
        this.moduleDesc = moduleDesc;
    }

    public Integer getModuleCode() {
        return moduleCode;
    }

    public void setModuleCode(Integer moduleCode) {
        this.moduleCode = moduleCode;
    }

    public String getModuleDesc() {
        return moduleDesc;
    }

    public void setModuleDesc(String moduleDesc) {
        this.moduleDesc = moduleDesc;
    }
}
