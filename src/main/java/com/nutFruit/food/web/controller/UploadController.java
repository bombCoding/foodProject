package com.nutFruit.food.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.nutFruit.food.domain.User;
import com.nutFruit.food.utils.UploadUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

import static com.nutFruit.food.utils.ApiResponseBuilder.SUCCESS;
import static com.nutFruit.food.utils.ApiResponseBuilder.buildResponse;

/**
 * Created by Lenovo on 2019/3/24.
 */

@Controller
@RequestMapping("/upload")
public class UploadController {


    /**
     * 上传视频和图片
     * @param  type   : img  video
     * */
    @RequestMapping(path = "/file/{type}" ,method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> update(MultipartFile file, HttpServletRequest request, @PathVariable String type) {
        String path3 = request.getSession().getServletContext().getRealPath("/")+"/upload/"+type+"/";
        //String p = request
        String url = "";
        try {
            //url = UploadUtils.uploadFile(file,path3);
            url = UploadUtils.saveFile(request,"/upload/"+type+"/");
        } catch (IOException e) {
            e.printStackTrace();
            return buildResponse(1,"上传失败");
        }
        System.out.println(url);
        return buildResponse(0,SUCCESS,url,null);
    }



}
