package com.lgh.sys.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.lgh.common.dao.BaseDao;
import com.lgh.sys.entity.Info;
@Repository
public class InfoDao extends BaseDao<Info> {
	@SuppressWarnings("unchecked")
	public List<Info> findInfoByPageAndStatus(int status,int begin,int size){
		Criteria c = this.createCriteria();
		c.add(Restrictions.eq("status", status));
		c.setFirstResult(begin);
		c.setMaxResults(size);		
		return c.list();
	}
}
