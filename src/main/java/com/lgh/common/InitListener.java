package com.lgh.common;

import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

/**
 * 初始化监听
 * ClassName:InitListener
 *
 * @author   杨鹏
 * @version  
 * @since    Ver 1.1
 * @Date	 2014	2014年7月8日		下午2:23:05
 *
 * @see
 */
public class InitListener implements ServletContextListener {
	public Logger logger = Logger.getLogger(InitListener.class);
	
	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
	}
	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ServletContext servletContext = servletContextEvent.getServletContext();
		ResourceBundle resourceBundle = ResourceBundle.getBundle("jdbc");
		
		this.initPath(servletContext, resourceBundle);
	}

	
	
	/**
	 * 获得绝对路径
	 * initPath
	 * 
	 * @author 杨鹏
	 * @param servletContext
	 * @param resourceBundle
	 * @since 　Ver 1.1
	 */
	public void initPath(ServletContext servletContext,ResourceBundle resourceBundle){
		/*String realPath = resourceBundle.getString("jdbc.realPath");
		if(StringUtils.isBlank(realPath)){
		}*/
		String realPath = servletContext.getRealPath("/");
		String contextPath = servletContext.getContextPath();
		servletContext.setAttribute("contextPath", contextPath);
		servletContext.setAttribute("realPath", realPath);
	}

	
}
