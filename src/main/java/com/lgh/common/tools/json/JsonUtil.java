package com.lgh.common.tools.json;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;


public class JsonUtil {
	 public static void outToJson(HttpServletResponse response, Object data) 
		        throws IOException {
		        
		        response.setContentType("text/json; charset=utf-8");
		        response.setHeader("Cache-Control", "no-cache"); //取消浏览器缓存
		        PrintWriter out = response.getWriter();
		        
		        
		         String s = "";
		         s =  JSON.toJSONString(data);
		         
		         
		        out.print(s);
		        out.flush();
		        out.close();
		    }

}
