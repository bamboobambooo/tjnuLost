package com.lgh.sys.control;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lgh.sys.entity.Admin;
import com.lgh.sys.service.AdminService;

@Scope("prototype")
@Controller
@Namespace("/admin")
public class AdminControl implements com.opensymphony.xwork2.Action {

	@Autowired
	private AdminService adminService;

	private Admin admin;
	
	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	
	/**
	 * 管理员登陆
	 * @return
	 * @throws Exception
	 */
	@Action(value = "login", results = {
			@Result(name = "success", location = "adminCenter.jsp", type = "redirect"),
			@Result(name = "model", location = "loginModel.jsp", type = "redirect"),
			@Result(name = "error", location = "loginFail.jsp", type = "redirect"),
			@Result(name = "grapher", location = "loginGrapher.jsp", type = "redirect") })
	public String login() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		Admin tmpAdmin = new Admin();
		tmpAdmin = adminService.findAdmin(admin);
		if( tmpAdmin != null){//根据用户名和密码和角色组合判断用户是否存在
			session.removeAttribute("curruser");
			session.setAttribute("curruser",tmpAdmin);
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