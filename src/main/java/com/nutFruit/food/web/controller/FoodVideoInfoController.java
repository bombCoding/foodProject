package com.nutFruit.food.web.controller;

import com.github.pagehelper.PageHelper;
import com.nutFruit.food.domain.FoodInfo;
import com.nutFruit.food.domain.VideoInfo;
import com.nutFruit.food.service.FoodVideoService;
import com.nutFruit.food.service.IFoodInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

import static com.nutFruit.food.utils.ApiResponseBuilder.SUCCESS;
import static com.nutFruit.food.utils.ApiResponseBuilder.buildResponse;

/**
 * Created by Lenovo on 2019/3/21.
 */

@Controller
@RequestMapping("/video")
public class FoodVideoInfoController {

    @Autowired
    private FoodVideoService foodVideoService;

    @RequestMapping("/videoList")
    public String foodInfoView() {

        return "video/video-info";
    }
    @RequestMapping("/videoAdd")
    public String foodInfoAdd(){
        return "video/video-add";
    }


    /**
     * app请求接口
     * @Author: sun JinShuang
     * @return
     */
    @RequestMapping(path = "/app-list",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAppFoodInfos(Integer pageNum, Integer pageSize){

        List<VideoInfo> videoInfos = foodVideoService.selectAll(pageNum,pageSize,1);

        return buildResponse(0,SUCCESS,videoInfos,null);
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

        List<VideoInfo> videoInfos = foodVideoService.selectAll(page,limit,2);
        int count = foodVideoService.getAllCountNum();
        return buildResponse(0,SUCCESS,videoInfos,count);
    }
}
