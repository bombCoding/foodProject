package com.nutFruit.food.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by v on 2019/03/21.
 */
public class ApiResponseBuilder {

    public static final String SUCCESS = "success";

    public static final String FAILURE = "failure";

    public static final String ERROR = "error";
    /**
     * api bean
     * @param code
     * @param message
     * @param data
     * @return
     */
    public static <T> Map<String, Object> buildResponse(int code, String message, T data,Integer count){
        Map<String, Object> apiResponse = new HashMap<>();
        apiResponse.put("code",code);
        apiResponse.put("msg", message);
        //结果总数
        apiResponse.put("count", count);
        //结果对象数据
        apiResponse.put("data", data);
        return apiResponse;
    }

    public static <T> Map<String, Object> buildResponse(int code, String message){
        Map<String, Object> apiResponse = new HashMap<>();
        apiResponse.put("code",code);
        apiResponse.put("msg", message);
        return apiResponse;
    }

    public static<K,V> Map<K,V> buildEntry(K key,V v){
        Map<K,V> entryMap = new HashMap<>();
        entryMap.put(key,v);
        return entryMap;
    }

}
