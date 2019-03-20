package com.nutFruit.food.web.controller;

import com.nutFruit.food.service.IFoodInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 田宝军 on 2019/3/20.
 */
@Controller
@RequestMapping("/foodInfo")
public class FoodInfoController {

    @Autowired
    private IFoodInfoService foodInfoService;

    @RequestMapping("/foodView")
    public String foodInfoView() {

        return "foodInfo/foodInfo";
    }
    @RequestMapping("/foodAdd")
    public String foodInfoAdd(){
        return "foodInfo/uploadPic";
    }



    /**
     * @Author: sun JinShuang
     * @return
     */
    @RequestMapping(path = "/gongaoList",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getRenttingCommunity(){


        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        //结果总数
        map.put("count", "");
        //结果对象数据
        map.put("data", "");
        return map;
    }
}
