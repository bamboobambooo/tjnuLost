package com.lgh.sys.service;


import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgh.common.service.BaseService;
import com.lgh.sys.dao.DepartDao;
import com.lgh.sys.entity.Department;
import com.lgh.sys.entity.User;

/**
 * DepartService
 * @author liugh
 *
 */
@Service
public class DepartService extends BaseService<Department> {
	@Autowired
	private DepartDao departDao;

	@SuppressWarnings("rawtypes")
	public boolean existDepartName(String name) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Department.class);
		detachedCriteria.add(Restrictions.eq("name", name));
		List list = departDao.findByCriteria(detachedCriteria);
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}
	

}