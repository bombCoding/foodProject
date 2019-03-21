package com.nutFruit.food.domain;

import java.io.Serializable;

public class FoodPic implements Serializable {
    private Long id;

    private Long foodId;

    private Integer type;

    private String imgUrl;

    private Integer status;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getFoodId() {
        return foodId;
    }

    public void setFoodId(Long foodId) {
        this.foodId = foodId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "FoodPic{" +
                "id=" + id +
                ", foodId=" + foodId +
                ", type=" + type +
                ", imgUrl='" + imgUrl + '\'' +
                ", status=" + status +
                '}';
    }
}