package com.nutFruit.food.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nutFruit.food.context.UserContext;
import com.nutFruit.food.domain.*;
import com.nutFruit.food.service.FoodNoticeService;
import com.nutFruit.food.service.IDocTestService;
import com.nutFruit.food.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.nutFruit.food.utils.ApiResponseBuilder.ERROR;
import static com.nutFruit.food.utils.ApiResponseBuilder.SUCCESS;
import static com.nutFruit.food.utils.ApiResponseBuilder.buildResponse;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private IDocTestService docTestService;

    @Autowired
    private FoodNoticeService foodNoticeService;

    @RequestMapping("/noticeList")
    public String foodInfoView() {
        return "notice/notice-info";
    }
    /*@RequestMapping("/foodAdd")
    public String foodInfoAdd(){
        return "foodInfo/uploadPic";
    }*/


    @RequestMapping("/noticeView")
    public String noticeView(Model model, Integer pageIndex) {
        int pageSize = 5;//每页显示的记录数
        if (pageIndex == null)
            pageIndex = 1;//第一次访问页面默认页面为第一页
        PageHelper.startPage(pageIndex, pageSize);
        List<DocTest> docTests = docTestService.selectAll();
        //得到分页的结果对象
        PageInfo<DocTest> personPageInfo = new PageInfo<>(docTests);
        //得到分页中的person条目对象
        List<DocTest> pageList = personPageInfo.getList();
        model.addAttribute("docList", pageList);
        model.addAttribute("page", personPageInfo);
        return "notice/notice";
    }


    @RequestMapping("/addView")
    public String updateOrAddView() {
        return "notice/notice-add";
    }


    /**
     * app请求接口
     * @Author: sun JinShuang
     * @return
     */
    @RequestMapping(path = "/app-list",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAppNoticeInfos(Integer pageNum, Integer pageSize){

        List<FoodNotice> foodNotices = foodNoticeService.selectAll(pageNum,pageSize,1);

        return buildResponse(0,SUCCESS,foodNotices,null);
    }

    /**
     * 后台管理系统请求接口
     *
     * @Author: sun JinShuang
     * @return
     */
    @RequestMapping(path = "/list",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getNoticeInfo(Integer page,Integer limit){

        List<FoodNotice> foodNotices = foodNoticeService.selectAll(page,limit,2);
        int count = foodNoticeService.getAllCountNum();
        return buildResponse(0,SUCCESS,foodNotices,count);
    }

    /**
     * 后台管理系统添加或修改公告接口
     *
     * @Author: sun JinShuang
     * @return
     */
    @RequestMapping(path = "/addOrUpdate",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addOrUpdateNotice(@RequestBody JSONObject ob){
        String data = ob.toJSONString();
        FoodNotice notice = JsonUtils.toObject(data,FoodNotice.class);
        int index= 0;
        if(notice.getId()!=null){ //修改
            notice.setUpdateTime(new Date());
            index = foodNoticeService.updateByPrimaryKeySelective(notice);
        }else{//新增
            User user = UserContext.getCurrentUser();
            notice.setActionUser(user.getId());
            notice.setCreateTime(new Date());
            index = foodNoticeService.insertSelective(notice);
        }
        if (index <=0) {
            return buildResponse(1,"操作失败");
        }
        return buildResponse(0,"操作成功","/notice/noticeList",null);
    }

    @RequestMapping(path = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@RequestParam("id") Long id) {
        if (id != null) {
            User user = UserContext.getCurrentUser();
            FoodNotice updateInfo = new FoodNotice();
            updateInfo.setId(id);
            updateInfo.setStatus(0);
            updateInfo.setUpdateTime(new Date());
            int index = foodNoticeService.updateByPrimaryKeySelective(updateInfo);
            if (index == 0 || index == -1) {
                return buildResponse(1,"操作失败");
            }
        }
        return buildResponse(0,"操作成功");
    }

}
