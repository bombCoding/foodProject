package com.nutFruit.food.web.controller;

import com.nutFruit.food.service.IFoodInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 田宝军 on 2019/3/20.
 */
@Controller
@RequestMapping("/foodInfo")
public class FoodInfoController {

    /*@Autowired
    private IFoodInfoService foodInfoService;*/

    @RequestMapping("/foodView")
    public String foodInfoView() {

        return "foodInfo/foodInfo";
    }
    @RequestMapping("/foodAdd")
    public String foodInfoAdd(){
        return "foodInfo/uploadPic";
    }

}
