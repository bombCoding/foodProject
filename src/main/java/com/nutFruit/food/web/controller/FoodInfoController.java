package com.nutFruit.food.web.controller;

import com.github.pagehelper.PageHelper;
import com.nutFruit.food.domain.FoodInfo;
import com.nutFruit.food.service.IFoodInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        return "foodInfo/uploadPic";
    }



    /**
     * app请求接口
     * @Author: sun JinShuang
     * @return
     */
    @RequestMapping(path = "/app-list",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAppFoodInfos(Integer pageNum,Integer pageSize){

        List<FoodInfo> foodInfos = foodInfoService.selectAll(pageNum,pageSize);

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

        List<FoodInfo> foodInfos = foodInfoService.selectAll(page,limit);
        //分页
        if (page < 0) {
            page = 1;
            PageHelper.startPage(page, limit);
        }
        return buildResponse(0,SUCCESS,foodInfos,foodInfos.size());
    }
}
