package com.lgh.sys.control;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	private Integer size = 8; //设置每页显示的信息条数 防止null
	private Integer id = 1; //设置当前现实的信息id
	private String status;
	private File imgFile;
	private String imgFileContentType; // 文件的内容类型  image/jpeg
	private String imgFileFileName; // 上传文件名  比附abc.jpg
	private Integer uid = 0;//User的id
	private Integer aid = 0;//Admin的id
	
	private String search = "";//搜索的关键字
	private String timeFrom = "";
	private String timeTo = "";


	/**
	 * 发布丢失了 或 找到的东西的信息
	 * @return
	 */
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
			if(imgFile == null){
				info.setImgurl("");
			}else{
				String imgURL = infoService.uploadImg(imgFile, imgFileFileName);
				info.setImgurl(imgURL);
			}
			
			infoService.save(info);
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
			
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	@Action(value = "getLostJSON")
	public String getLostJSON() {
		try {
			//List<Info> infos = infoService.findAll(Info.class);
			int fromIndex = (p-1) * size;
			List<Info> infos = infoService.findLostByPage("id", fromIndex, size);
			
			Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("status", Short.parseShort("2"));
			
			BigInteger total = infoService.countAllByPageAndOrder(Info.class, "id", "asc",condition);
			Integer pages ;
			if(total.intValue() % size == 0){
				pages = total.intValue()/size;
			}else{
				pages = total.intValue()/size+1;
			}
			Map<String,Object> map = new HashMap<>();
			map.put("result", infos);
			map.put("total", total);
			map.put("pages", pages);
			JsonUtil.outToJson(ServletActionContext.getResponse(), map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Action(value = "getFoundJSON")
	public String getFoundJSON() {
		try {
			int fromIndex = (p-1) * size;
			List<Info> infos = infoService.findFoundByPage("id", fromIndex, size);
			
			Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("status", Short.parseShort("-2"));
			
			BigInteger total = infoService.countAllByPageAndOrder(Info.class, "id", "asc",condition);
			Integer pages ;
			if(total.intValue() % size == 0){
				pages = total.intValue()/size;
			}else{
				pages = total.intValue()/size+1;
			}
			
			Map<String,Object> map = new HashMap<>();
			map.put("result", infos);
			map.put("total", total);
			map.put("pages", pages);
			JsonUtil.outToJson(ServletActionContext.getResponse(), map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Action(value="searchAction")
	public String searchAction(){
		return SUCCESS;
	}
	
	/**
	 * 根据关键字search/状态status/时间time 搜索信息
	 * @return
	 */
	@Action(value = "search")
	public String search() {
		try {
			int fromIndex = (p-1) * size;
			
			
			List<Info> infos = infoService.findInfoByWord(search, Short.valueOf(status), timeFrom, timeTo, "id", fromIndex, size);
			BigInteger total = infoService.countInfoByWord(search, Short.valueOf(status), timeFrom, timeTo);
			Integer pages ;
			if(total.intValue() % size == 0){
				pages = total.intValue()/size;
			}else{
				pages = total.intValue()/size+1;
			}
			
			Map<String,Object> map = new HashMap<>();
			map.put("result", infos);
			map.put("total", total);
			map.put("pages", pages);
			JsonUtil.outToJson(ServletActionContext.getResponse(), map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}	
	
	/**
	 * 根据User或Admin的id查询信息列表
	 * 需要uid/aid status (p size)
	 * 以JSON格式返回查询到的Info List
	 * @return
	 */
	@Action(value = "showInfoListByUser", results = {
			@Result(name = "success", location = "showInfoListByUser.jsp"),
			@Result(name = "error", location = "error.jsp") })
	public String showInfoListByUser() {
		try {
			int fromIndex = (p-1) * size;
			
			Map<String, Object> condition = new HashMap<String, Object>();
			if(uid != 0)condition.put("publishUser.id", uid);
			if(aid != 0)condition.put("publishAdmin.id", aid);
			condition.put("status", Short.parseShort(status));
			List<Info> infos = infoService.findAllByPageAndOrder(Info.class, "id", "desc", fromIndex, size, condition);
			BigInteger total = infoService.countAllByPageAndOrder(Info.class, "id", "desc", condition);
			Integer pages ;
			if(total.intValue() % size == 0){
				pages = total.intValue()/size;
			}else{
				pages = total.intValue()/size+1;
			}
			
			Map<String,Object> map = new HashMap<>();
			map.put("result", infos);
			map.put("total", total);
			map.put("pages", pages);
			JsonUtil.outToJson(ServletActionContext.getResponse(), map);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
			
		}
		return SUCCESS;
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
	
	@Action(value = "changeInfoStatus")
	public String changeInfoStatus() throws IOException {
		try {
			info = infoService.get(id);
			info.setStatus(Short.parseShort(status));
			infoService.update(info);
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public File getImgFile() {
		return imgFile;
	}

	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}

	public String getImgFileContentType() {
		return imgFileContentType;
	}

	public void setImgFileContentType(String imgFileContentType) {
		this.imgFileContentType = imgFileContentType;
	}

	public String getImgFileFileName() {
		return imgFileFileName;
	}

	public void setImgFileFileName(String imgFileFileName) {
		this.imgFileFileName = imgFileFileName;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) throws UnsupportedEncodingException {
		//String tmp = new String(search.getBytes("ISO8859-1"),"UTF-8");
		this.search = search;//tmp;
	}

	public String getTimeFrom() {
		return timeFrom;
	}

	public void setTimeFrom(String timeFrom) {
		this.timeFrom = timeFrom;
	}

	public String getTimeTo() {
		return timeTo;
	}

	public void setTimeTo(String timeTo) {
		this.timeTo = timeTo;
	}

}