package com.lgh.sys.control;


import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lgh.common.tools.json.JsonUtil;
import com.lgh.sys.entity.Admin;
import com.lgh.sys.entity.Info;
import com.lgh.sys.entity.User;
import com.lgh.sys.service.InfoService;

@Scope("prototype")
@Controller
@Namespace("/info")
public class InfoControl implements com.opensymphony.xwork2.Action {

	@Autowired
	private InfoService infoService;
	private Info info; //发布信息  从数据库查到信息注入页面  共用
	
	private Integer p = 1;//当前页码 赋默认值1 防止null
	private Integer size = 5; //设置每页显示的信息条数 防止null
	private Integer id = 1; //设置当前现实的信息id

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Action(value = "pubLost", results = {
			@Result(name = "success", location = "pubSuccess.jsp", type = "redirect"),
			@Result(name = "error", location = "pubError.jsp", type = "redirect") })
	public String pubLost() {
		try {
			User curruser = null;
			Admin curradmin = null;
			if(ServletActionContext.getRequest().getSession().getAttribute("curruser")!=null){
				curruser = (User) ServletActionContext.getRequest().getSession().getAttribute("curruser");
				info.setPublishUser(curruser);
			}
			else if(ServletActionContext.getRequest().getSession().getAttribute("curradmin")!=null){
				curradmin = (Admin) ServletActionContext.getRequest().getSession().getAttribute("curradmin");
				info.setPublishAdmin(curradmin);
			}
			
			infoService.save(info);
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
			
		}
		return SUCCESS;
	}
	
	@Action(value = "getLostJSON")
	public String getLostJSON() {
		try {
			//List<Info> infos = infoService.findAll(Info.class);
			int fromIndex = (p-1) * size;
			List<Info> infos = infoService.findLostByPage("id", fromIndex, size);
			
			JsonUtil.outToJson(ServletActionContext.getResponse(), infos);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Action(value = "getFoundJSON")
	public String getFoundJSON() {
		try {
			int fromIndex = (p-1) * size;
			List<Info> infos = infoService.findFoundByPage("id", fromIndex, size);
			
			JsonUtil.outToJson(ServletActionContext.getResponse(), infos);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Action(value = "showInfo", results = {
			@Result(name = "success", location = "showInfo.jsp"),
			@Result(name = "error", location = "error.jsp") })
	public String showInfo() {
		try {
			info = infoService.get(id);
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
			
		}
		return SUCCESS;
	}
	
	

	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}