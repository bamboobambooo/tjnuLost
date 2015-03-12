package com.lgh.sys.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgh.common.service.BaseService;
import com.lgh.sys.dao.UserDao;
import com.lgh.sys.entity.User;

@Service
public class UserService extends BaseService<User> {
	@Autowired
	private UserDao userDao;
	
	
	@SuppressWarnings("rawtypes")
	public boolean existUser(User user){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
		detachedCriteria.add(Restrictions.eq("name", user.getName()));
		detachedCriteria.add(Restrictions.eq("password", user.getPassword()));
		List list = userDao.findByCriteria(detachedCriteria);
		
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	
	}
	
	@SuppressWarnings("rawtypes")
	public boolean existUserName(String name){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
		detachedCriteria.add(Restrictions.eq("name", name));
		List list = userDao.findByCriteria(detachedCriteria);
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}
		
}