package com.nutFruit.food.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class FoodInfo implements Serializable {
    private Long id;

    private String foodName;

    private Double recommendedPrice;

    private String flag;

    private String flagStr;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    private Date updateTime;

    private String createUserId;

    private String updateUserId;

    private String foodDesc;

    private List<FoodPic> foodPics;

    private String picStr;//图片拼接

    private static final long serialVersionUID = 1L;

    public String getPicStr() {
        return picStr;
    }

    public void setPicStr(String picStr) {
        this.picStr = picStr;
    }

    public String getFlagStr() {
        return flagStr;
    }

    public void setFlagStr(String flagStr) {
        this.flagStr = flagStr;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName == null ? null : foodName.trim();
    }

    public Double getRecommendedPrice() {
        return recommendedPrice;
    }

    public void setRecommendedPrice(Double recommendedPrice) {
        this.recommendedPrice = recommendedPrice;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId == null ? null : createUserId.trim();
    }

    public String getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId == null ? null : updateUserId.trim();
    }

    public String getFoodDesc() {
        return foodDesc;
    }

    public void setFoodDesc(String foodDesc) {
        this.foodDesc = foodDesc == null ? null : foodDesc.trim();
    }

    public List<FoodPic> getFoodPics() {
        return foodPics;
    }

    public void setFoodPics(List<FoodPic> foodPics) {
        this.foodPics = foodPics;
    }

    @Override
    public String toString() {
        return "FoodInfo{" +
                "id=" + id +
                ", foodName='" + foodName + '\'' +
                ", recommendedPrice=" + recommendedPrice +
                ", flag='" + flag + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", createUserId='" + createUserId + '\'' +
                ", updateUserId='" + updateUserId + '\'' +
                ", foodDesc='" + foodDesc + '\'' +
                '}';
    }
}
