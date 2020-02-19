package com.mall.enums;

/**
 * Description:
 *
 * @Date:2020/2/19
 * @Author:lc
 */
public enum RoofPlaceStateEnum {

    NOT_IS_ROOF_PLACE(0, "待审核"),
    REJECT_ASK(1, "驳回"),
    IS_ROOF_PLACE(2, "置顶");

    private Integer roofPlaceCode;
    private String roofPlaceDesc;

    RoofPlaceStateEnum(Integer roofPlaceCode, String roofPlaceDesc) {
        this.roofPlaceCode = roofPlaceCode;
        this.roofPlaceDesc = roofPlaceDesc;
    }

    public Integer getRoofPlaceCode() {
        return roofPlaceCode;
    }

    public void setRoofPlaceCode(Integer roofPlaceCode) {
        this.roofPlaceCode = roofPlaceCode;
    }

    public String getRoofPlaceDesc() {
        return roofPlaceDesc;
    }

    public void setRoofPlaceDesc(String roofPlaceDesc) {
        this.roofPlaceDesc = roofPlaceDesc;
    }
}
