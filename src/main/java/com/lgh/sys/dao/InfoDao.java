package com.lgh.sys.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.lgh.common.dao.BaseDao;
import com.lgh.sys.entity.Info;
/**
 * Info DAO
 * @author liugh
 *
 */
@Repository
public class InfoDao extends BaseDao<Info> {
	/**
	 * 根据status和orderPropertyName查询Info信息
	 * @param status Info的状态码
	 * @param orderPropertyName 排序的属性名
	 * @param begin
	 * @param size
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Info> findInfoByPageAndStatus(int status,String orderPropertyName,int begin,int size){
		Criteria c = this.createCriteria();
		c.add(Restrictions.eq("status", Short.parseShort(String.valueOf(status))));
		c.addOrder(Order.desc(orderPropertyName));
		c.setFirstResult(begin);
		c.setMaxResults(size);		
		return c.list();
	}
}
