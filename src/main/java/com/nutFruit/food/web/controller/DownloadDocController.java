package com.nutFruit.food.web.controller;

import com.nutFruit.food.service.IDownloadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 类描述信息 下载中心处理类
 *
 * @author Tomlin
 * @ClassName DownloadDocController
 * @Description: TODO
 * @date 2018/12/30 14:23
 * @Viersion V1.0.1
 */

@Controller
@RequestMapping("/download")
public class DownloadDocController {


    @Autowired
    private IDownloadService downloadService;

    @RequestMapping("/downloadView")
    public String downView() {

        return "documentFile/fileDoc";
    }


    @RequestMapping("/uploadView")
    public String uploadView() {
        return "documentFile/uploadFile";
    }
}
