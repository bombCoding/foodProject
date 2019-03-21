package com.nutFruit.food.utils;

/**
 * Created by v on 2019/03/21.
 */
public class ExceptionUtils {

    //按照Java格式解析异常信息
    public static String parseException(Throwable throwable){
        StringBuilder errorMessage = new StringBuilder();
        errorMessage.append("Exception in thread \"")
                .append(Thread.currentThread().getName())
                .append("\"")
                .append(throwable.getClass())
                .append(":")
                .append(throwable.getMessage())
                .append("\n");
        StackTraceElement[] trace = throwable.getStackTrace();
        if (trace != null){
            for (StackTraceElement traceElement : trace) {
                errorMessage.append("\tat ")
                        .append(traceElement)
                        .append("\n");
            }
        }
        errorMessage.append("Cause by:")
                .append(throwable.getCause());
        return errorMessage.toString();
    }
}
