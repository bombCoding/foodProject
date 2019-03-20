package com.nutFruit.food.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class WelcomeController {

    @RequestMapping("/hello")
    public String welcome(){

        return "common/welcome";
    }

    //跳转到主页
    @RequestMapping("/index")
    public String index(){

        return "/main.jsp";
    }

    /**
     * @Author: sun JinShuang
     * @return
     */
    @RequestMapping(path = "/rentCommunityInit",method = RequestMethod.GET)
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
