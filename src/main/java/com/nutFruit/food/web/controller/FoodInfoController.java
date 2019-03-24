package com.nutFruit.food.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.nutFruit.food.context.UserContext;
import com.nutFruit.food.domain.FoodInfo;
import com.nutFruit.food.domain.User;
import com.nutFruit.food.service.IFoodInfoService;
import com.nutFruit.food.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.nutFruit.food.utils.ApiResponseBuilder.ERROR;
import static com.nutFruit.food.utils.ApiResponseBuilder.SUCCESS;
import static com.nutFruit.food.utils.ApiResponseBuilder.buildResponse;

/**
 * Created by 田宝军 on 2019/3/20.
 */
@Controller
@RequestMapping("/foodInfo")
public class FoodInfoController {

    @Autowired
    private IFoodInfoService foodInfoService;

    @RequestMapping("/foodList")
    public String foodInfoView() {
        return "foodInfo/food-info";
    }
    @RequestMapping("/foodAdd")
    public String foodInfoAdd(){
        return "foodInfo/food-add";
    }

    /**
     * app请求接口
     * @Author: sun JinShuang
     * @return
     */
    @RequestMapping(path = "/app-list",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAppFoodInfos(Integer pageNum,Integer pageSize){

        List<FoodInfo> foodInfos = foodInfoService.selectAll(pageNum,pageSize,1);

        return buildResponse(0,SUCCESS,foodInfos,null);
    }

    /**
     * 后台管理系统请求接口
     *
     * @Author: sun JinShuang
     * @return
     */
    @RequestMapping(path = "/list",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getFoodInfo(Integer page,Integer limit){

        List<FoodInfo> foodInfos = foodInfoService.selectAll(page,limit,2);
        int allCount = foodInfoService.getAllCountNum();
        //分页
        if (page < 0) {
            page = 1;
            PageHelper.startPage(page, limit);
        }
        return buildResponse(0,SUCCESS,foodInfos,allCount);
    }

    //删除
    @RequestMapping(path = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@RequestParam("id") Long id) {
        if (id != null) {
            User user = UserContext.getCurrentUser();
            FoodInfo updateInfo = new FoodInfo();
            updateInfo.setId(id);
            updateInfo.setFlag("0");
            updateInfo.setUpdateTime(new Date());
            updateInfo.setUpdateUserId(user.getId().toString());
            int index = foodInfoService.updateByPrimaryKey(updateInfo);
            if (index == 0 || index == -1) {
                return buildResponse(1,ERROR);
            }
        }
        return buildResponse(0,SUCCESS);
    }

    //更新
    @RequestMapping(path = "/updateOrAdd" ,method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> update(@RequestBody JSONObject ob) {
        String data = ob.toJSONString();
        int index = 0;
        User user = UserContext.getCurrentUser();
        FoodInfo foodInfo = JsonUtils.toObject(data,FoodInfo.class);
        if (foodInfo.getId() == null) {// 新增
            foodInfo.setCreateTime(new Date());
            foodInfo.setCreateUserId(user.getId().toString());
            foodInfo.setFlag("1");
            index = foodInfoService.insertFoodInfo(foodInfo);
        }else{//修改
            index = foodInfoService.updateFoodInfo(foodInfo,user.getId());
        }
        if (index == 0 || index == -1) {
            return buildResponse(1,"操作失败");
        }
        return buildResponse(0,SUCCESS,"/foodInfo/foodList",null);
    }
}
