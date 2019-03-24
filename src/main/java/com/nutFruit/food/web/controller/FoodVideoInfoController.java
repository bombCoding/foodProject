package com.nutFruit.food.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.nutFruit.food.context.UserContext;
import com.nutFruit.food.domain.FoodInfo;
import com.nutFruit.food.domain.User;
import com.nutFruit.food.domain.VideoInfo;
import com.nutFruit.food.service.FoodVideoService;
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

    //更新
    @RequestMapping(path = "/updateOrAdd" ,method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> update(@RequestBody JSONObject ob) {
        String data = ob.toJSONString();
        int index = 0;
        User user = UserContext.getCurrentUser();
        VideoInfo videoInfo = JsonUtils.toObject(data,VideoInfo.class);
        if (videoInfo.getId() == null) {// 新增
            videoInfo.setCreateTime(new Date());
            videoInfo.setCreateUserId(user.getId());
            videoInfo.setStatus(1);
            index = foodVideoService.insertSelective(videoInfo);
        }else{//修改
            index = foodVideoService.updateByPrimaryKeySelective(videoInfo);
        }
        if (index == 0 || index == -1) {
            return buildResponse(1,"操作失败");
        }
        return buildResponse(0,SUCCESS,"/video/videoList",null);
    }

    //删除
    @RequestMapping(path = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@RequestParam("id") Long id) {
        if (id != null) {
            User user = UserContext.getCurrentUser();
            VideoInfo videoInfo = new VideoInfo();
            videoInfo.setId(id);
            videoInfo.setStatus(0);
            videoInfo.setUpdateTime(new Date());
            int index = foodVideoService.updateByPrimaryKeySelective(videoInfo);
            if (index == 0 || index == -1) {
                return buildResponse(1,ERROR);
            }
        }
        return buildResponse(0,SUCCESS);
    }
}
