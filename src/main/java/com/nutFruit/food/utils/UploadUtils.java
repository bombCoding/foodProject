package com.nutFruit.food.utils;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.server.handler.FilteringWebHandler;
import org.springframework.web.servlet.mvc.condition.NameValueExpression;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by Lenovo on 2019/3/24.
 */
public class UploadUtils {


    //单上传
    public static String uploadFile(MultipartFile file,String path) throws IOException{
        String name= file.getOriginalFilename();//文件真实名称
        String suffixName = name.substring(name.lastIndexOf("."));//获取后缀
        String fileName =  Integer.toHexString(new Random().nextInt());//随机数作为文件名
        String fullName= fileName + suffixName;
        File temFile = new File(path,fullName);
        if(!temFile.getParentFile().exists()){
            temFile.getParentFile().mkdir();
        }
        if(temFile.exists()){
            temFile.delete();
        }
        temFile.createNewFile();
        file.transferTo(temFile);
        return temFile.getCanonicalPath();
    }

    //多文件
    public static String saveFile(HttpServletRequest req, String thisPath) throws IOException {

       // ServletContext sc = ContextLoader.getCurrentWebApplicationContext().getServletContext();
        ServletContext sc =req.getServletContext();
        String PRE_PATH = sc.getRealPath("");

        String UTIL_PATH = "/upload/img/";
        List<MultipartFile> fList = upload(req,sc);
        if (fList.size() == 0) {
            return null;
        }
        String imgurl ="";
        for (MultipartFile file : fList) {
            // 取得当前上传文件的文件名称
            String myFileName = file.getOriginalFilename();

            // 重命名上传后的文件名
            //String fileName = UUID.randomUUID().toString();
            String fileName =  Integer.toHexString(new Random().nextInt());//随机数作为文件名
            fileName += myFileName.substring(myFileName.indexOf("."));

            // 定义上传路径
            if (thisPath == null) {
                thisPath = UTIL_PATH;
            }
            String path = PRE_PATH + thisPath + fileName;
            String relativePath = thisPath + fileName;
            imgurl+=relativePath + ",";
            File localFile = new File(path);
            file.transferTo(localFile);
        }
        return imgurl.substring(0,imgurl.indexOf(","));
    }

    // 文件上传,传入request请求对象,返回组装成的文件的集合
    private static List<MultipartFile> upload(HttpServletRequest req,ServletContext sc) {
        List<MultipartFile> list = new ArrayList<MultipartFile>();
        // 创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                sc);

        // 判断 req 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(req)) {
            // 转换成多部分req
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
            // 取得req中的所有文件名

            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // 取得上传文件
                MultipartFile file = multiRequest.getFile(iter.next());
                if (file != null && (file.getOriginalFilename().trim() != "")) {
                    list.add(file);
                }

            }

        }
        return list;
    }


    public static ResponseEntity<byte[]> download(String path, String fileName)
            throws Exception {
        String[] ps = path.split("/");
        File file = new File(path);
        if (file != null) {
            HttpHeaders headers = new HttpHeaders();
            // String fileName = p;
            fileName = new String(fileName.getBytes("GBK"), "iso-8859-1");// 为了解决中文名称乱码问题
            headers.setContentDispositionFormData("attachment", fileName);
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            return new ResponseEntity<byte[]>(
                    FileUtils.readFileToByteArray(file), headers,
                    HttpStatus.OK);
        }

        return null;
    }


}

