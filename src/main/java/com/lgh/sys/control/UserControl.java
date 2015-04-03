package com.lgh.sys.control;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lgh.common.tools.json.JsonUtil;
import com.lgh.sys.entity.User;
import com.lgh.sys.service.UserService;

@Scope("prototype")
@Controller
@Namespace("/user")
public class UserControl implements com.opensymphony.xwork2.Action {

	@Autowired
	private UserService userService;

	private User user;
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	String contextPath = ServletActionContext.getServletContext().getRealPath("/");
	

	@Action(value = "reg", results = {
			@Result(name = "success", location = "userCenter.jsp", type = "redirect"),
			@Result(name = "error", location = "regFail.jsp", type = "redirect") })
	public String reg() throws Exception {
		try {
			if(userService.existUserName(user.getName())){
				return ERROR;
			}else{
				userService.save(user);
			}
		} catch (Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	/**
	 * 登陆
	 * @return
	 * @throws Exception
	 */
	@Action(value = "login", results = {
			@Result(name = "success", location = "userCenter.jsp", type = "redirect"),
			@Result(name = "model", location = "loginModel.jsp", type = "redirect"),
			@Result(name = "error", location = "loginFail.jsp", type = "redirect"),
			@Result(name = "grapher", location = "loginGrapher.jsp", type = "redirect") })
	public String login() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User tmpUser = new User();
		tmpUser = userService.findUser(user);
		if( tmpUser != null){//根据用户名和密码和角色组合判断用户是否存在
			session.removeAttribute("curruser");
			session.removeAttribute("curradmin");
			session.setAttribute("curruser",tmpUser);
			return SUCCESS;
		} 
		return ERROR;
	}
	
	/**
	 * 退出用户
	 * @return
	 * @throws Exception
	 */
	@Action(value = "logout", results = {
			@Result(name = "success", location = "../login.html", type = "redirect"),
			@Result(name = "error", location = "../login.html", type = "redirect")})
	public String logout() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if( session != null){//根据用户名和密码和角色组合判断用户是否存在
			session.removeAttribute("curruser");
			session.removeAttribute("curradmin");
			return SUCCESS;
		} else{
			return ERROR;
		}
	}
	
	/**
	 * 个人信息显示页 Action
	 * @return JSP
	 */
	@Action(value = "personalInfo",results = {
			@Result(name = "success", location = "personalInfo.jsp"),
			@Result(name = "error", location = "../login.html" ,type = "redirect")})
	public String personalInfo() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			if(session.getAttribute("curruser") == null){
				return ERROR;
			}else{
				this.setUser( userService.get(((User)session.getAttribute("curruser")).getId()) );
			}
			
				return SUCCESS;
			}
	    catch (Exception e) {
			return ERROR;
		}
	}
	
	/**
	 * 个人信息修改 Action 
	 * @return JSON
	 * @throws IOException 
	 * @throws Exception
	 */
	@Action(value = "personalInfoUpdate")
	public String personalInfoUpdate() throws IOException {
		try {
			userService.update(user);
			JsonUtil.outToJson(ServletActionContext.getResponse(), "success");
		} catch (Exception e) {
			JsonUtil.outToJson(ServletActionContext.getResponse(), "error");
		}
		return null;
	}
	
	
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}