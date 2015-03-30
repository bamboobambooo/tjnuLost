package com.lgh.sys.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lgh.common.tools.json.JsonUtil;
import com.lgh.sys.entity.Admin;
import com.lgh.sys.service.AdminService;

@Controller
@Namespace("/admin")
public class AdminControl implements com.opensymphony.xwork2.Action {

	@Autowired
	private AdminService adminService;
	private Integer p = 1;//当前页码 赋默认值1 防止null
	private Integer size = 5; //设置每页显示的信息条数 防止null

	private Integer deptId = 1;
	//delAdmin获取uid
	private Integer uid = 0;
	
	private Admin admin;
	
	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	
	public Integer getP() {
		return p;
	}

	public void setP(Integer p) {
		this.p = p;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
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
			session.removeAttribute("curradmin");
			session.removeAttribute("curruser");
			session.setAttribute("curradmin",tmpAdmin);
			return SUCCESS;
		} 
		return ERROR;
	}
	
	
	/**
	 * 获取所有管理员 按部门
	 * 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Action(value = "getAdminJSON")
	public String getAdminJSON() throws Exception {
		int fromIndex = (p - 1) * size;
		Map<String,Object> condition = new HashMap<>();
		condition.put("department.id", deptId);
		
		List<Admin> list = adminService.findAllByPageAndOrder(
				Admin.class, "id", "asc", fromIndex, size,condition);
		JsonUtil.outToJson(ServletActionContext.getResponse(), list);
		return null;
	}
	
	//添加某部门的管理员
	@Action(value = "departAdminAdd")
	public String departAdminAdd() throws Exception {
		try {
			if(adminService.existAdminName(admin.getName())){
				JsonUtil.outToJson(ServletActionContext.getResponse(), "existAdmin");
			}else{
				adminService.save(admin);
				JsonUtil.outToJson(ServletActionContext.getResponse(), "success");
			}
		} catch (Exception e) {
			e.printStackTrace(ServletActionContext.getResponse().getWriter());
		}
		return null;
	}
	
	@Action(value="delAdmin")
	public String delAdmin() throws IOException{
		try {
			System.out.println(uid);
			Admin tmpAdmin = adminService.get(uid.intValue());
			adminService.delete(tmpAdmin);
			JsonUtil.outToJson(ServletActionContext.getResponse(), "success");
		} catch (Exception e) {
			e.printStackTrace(ServletActionContext.getResponse().getWriter());
		}
		return null;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}