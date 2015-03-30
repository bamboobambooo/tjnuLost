package com.lgh.common.tools.json;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;


public class JsonUtil {
	 public static void outToJson(HttpServletResponse response, Object data) 
		        throws IOException {
		        
		        response.setContentType("text/json; charset=utf-8");
		        response.setHeader("Cache-Control", "no-cache"); //取消浏览器缓存
		        PrintWriter out = response.getWriter();
		        
		        
		         String s = "";
		         s =  JSON.toJSONString(data,SerializerFeature.DisableCircularReferenceDetect);//SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullStringAsEmpty);
		         
		         
		        out.print(s);
		        out.flush();
		        out.close();
		    }

}
