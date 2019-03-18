package com.iarchie.crm_v1.domain;

import java.io.Serializable;
import java.util.Date;

public class Foodinfo implements Serializable {
    private String id;

    private String foodname;

    private String fooddesc;

    private Double recommendedprice;

    private String flag;

    private Date createtime;

    private Date updatetime;

    private String creator;

    private String updator;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getFoodname() {
        return foodname;
    }

    public void setFoodname(String foodname) {
        this.foodname = foodname == null ? null : foodname.trim();
    }

    public String getFooddesc() {
        return fooddesc;
    }

    public void setFooddesc(String fooddesc) {
        this.fooddesc = fooddesc == null ? null : fooddesc.trim();
    }

    public Double getRecommendedprice() {
        return recommendedprice;
    }

    public void setRecommendedprice(Double recommendedprice) {
        this.recommendedprice = recommendedprice;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator == null ? null : creator.trim();
    }

    public String getUpdator() {
        return updator;
    }

    public void setUpdator(String updator) {
        this.updator = updator == null ? null : updator.trim();
    }
}