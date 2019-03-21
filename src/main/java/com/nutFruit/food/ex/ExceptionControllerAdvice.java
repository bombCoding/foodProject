package com.nutFruit.food.ex;


import com.nutFruit.food.utils.ExceptionUtils;
import com.nutFruit.food.utils.JsonUtils;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.lang.reflect.Method;

import static com.nutFruit.food.utils.ApiResponseBuilder.buildResponse;

/**
 * 类描述信息 统一异常处理器
 *
 * @author sunjinshuang
 * @ClassName ExceptionControllerAdvice
 * @Description: TODO
 * @date 2019/03/21 15:53
 * @Viersion V1.0.1
 */
@ControllerAdvice
public class ExceptionControllerAdvice {

    private static Logger logger = Logger.getLogger(ExceptionControllerAdvice.class);

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public String errorView(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, Exception e) {
        logger.error("异常请求URL：" + httpServletRequest.getRequestURL());
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            logger.warn("处理器的方法为：" + method.getName());
        }
        logger.error("异常栈 ==>> ");
        logger.error(ExceptionUtils.parseException(e));
        Map<String,Object> respBean = buildResponse(1,"erro  happend..." + e.getMessage());
        return JsonUtils.toJSONString(respBean);
    }

    private void responseJson(HttpServletResponse response,String content){
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        Map<String,Object> respBean = buildResponse(1,content);
        PrintWriter out =null;
        try {
            out =  response.getWriter();
            out.write(JsonUtils.toJSONString(respBean));
            out.flush();//记得刷新io流问题
            out.close();
        } catch (IOException e) {
            logger.error(ExceptionUtils.parseException(e));
        }finally {
            if(out!=null){
                out.close();
            }
        }
    };
}
