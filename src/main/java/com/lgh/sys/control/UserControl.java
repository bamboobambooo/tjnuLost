package com.lgh.sys.control;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

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
			session.setAttribute("curruser",tmpUser);
			return SUCCESS;
		} 
		return ERROR;
	}
	
	/**
	 * 管理员登陆
	 * @return
	 * @throws Exception
	 */
	@Action(value = "loginAdmin", results = {
			@Result(name = "success", location = "adminCenter.jsp", type = "redirect"),
			@Result(name = "error", location = "loginFail.jsp", type = "redirect")})
	public String loginAdmin() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(userService.existUser(user)){//根据用户名和密码和角色组合判断用户是否存在
			session.setAttribute("curruser",user);
			return SUCCESS;
		} 
		return ERROR;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}