package com.lgh.sys.control;

import java.io.IOException;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lgh.common.tools.json.JsonUtil;
import com.lgh.sys.entity.Department;
import com.lgh.sys.service.DepartService;

@Scope("prototype")
@Controller
@Namespace("/admin/depart")
public class DepartControl implements com.opensymphony.xwork2.Action {

	@Autowired
	private DepartService departService;
	private Department depart;
	private Integer p = 1;//当前页码 赋默认值1 防止null
	private Integer size = 10; //设置每页显示的信息条数 防止null
	
	public Department getDepart() {
		return depart;
	}

	public void setDepart(Department depart) {
		this.depart = depart;
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

	/**
	 * 获取所有部门信息 分页
	 * 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Action(value = "getDepartJSON")
	public String getDepartJSON() throws Exception {
		int fromIndex = (p - 1) * size;
		List<Department> list = departService.findAllByPageAndOrder(
				Department.class, "id", "asc", fromIndex, size);
		BigInteger total = departService.countAllByPageAndOrder(Department.class, "id", "asc");
		Integer pages ;
		if(total.intValue() % size == 0){
			pages = total.intValue()/size;
		}else{
			pages = total.intValue()/size+1;
		}
		Map<String,Object> map = new HashMap<>();
		map.put("result", list);
		map.put("total", total);
		map.put("pages", pages);
		JsonUtil.outToJson(ServletActionContext.getResponse(), map);
		return null;
	}
	
	//添加部门
	@Action(value = "departAdd")
	public String departAdd() throws IOException{
		try {
			System.out.println(depart.getName());
			if(departService.existDepartName(depart.getName())){
				JsonUtil.outToJson(ServletActionContext.getResponse(), "exist");
			}else{
				departService.save(depart);
				JsonUtil.outToJson(ServletActionContext.getResponse(), "success");
			}
		} catch (Exception e) {
			JsonUtil.outToJson(ServletActionContext.getResponse(), "error");
		}
		return null;
	}
	
	//修改部门名称
	@Action(value = "departNameChange")
	public String departNameChange() throws IOException{
		try {
			departService.update(depart);
			JsonUtil.outToJson(ServletActionContext.getResponse(), "success");
		} catch (Exception e) {
			e.printStackTrace();
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