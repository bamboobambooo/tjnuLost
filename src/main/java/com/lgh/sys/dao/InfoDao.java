package com.lgh.sys.dao;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
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

	/**
	 * 根据搜索词来查询信息
	 * @param search 搜索词
	 * @param status 状态
	 * @param timeFrom 起始时间
	 * @param timeTo 截止时间
	 * @param orderPropertyName 排序属性名  降序
	 * @param begin 开始位置索引
	 * @param size 结果条数
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Info> findInfoByWord(String search, short status,String timeFrom, String timeTo,String orderPropertyName,int begin, int size) {
		Criteria c = this.createCriteria();
		c.add(Restrictions.eq("status", Short.parseShort(String.valueOf(status))));
		c.add(Restrictions.like("item", "%"+search+"%"));
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//c.add(Restrictions.between("pubTime", sdf.parse(timeFrom), sdf.parse(timeTo)));
		if(!("".equals(timeTo)&&"".equals(timeFrom))){
			c.add(Restrictions.between("pubTime", Timestamp.valueOf(timeFrom), Timestamp.valueOf(timeTo)));
		}else if((("".equals(timeFrom))&&(!"".equals(timeTo))) ){ //如果开始时间为空字符串
			c.add(Restrictions.between("pubTime", new Timestamp(1L), Timestamp.valueOf(timeTo) ));
		}else if( (!"".equals(timeTo))&&("".equals(timeTo))){ //如果截止时间为空字符串
			c.add(Restrictions.between("pubTime",Timestamp.valueOf(timeFrom), new Timestamp(System.currentTimeMillis()) ));
		}else{
			
		}
			
		c.addOrder(Order.desc(orderPropertyName));//新的在前
		c.setFirstResult(begin);
		c.setMaxResults(size);		
		return c.list();		
	}
	
	/**
	 * 根据搜索词来查询信息 的条数
	 * @param search 搜索词
	 * @param status 状态
	 * @param timeFrom 起始时间
	 * @param timeTo 截止时间
	 * @return
	 */
	public BigInteger countInfoByWord(String search, short status,String timeFrom, String timeTo) {
		Criteria c = this.createCriteria();
		c.add(Restrictions.eq("status", Short.parseShort(String.valueOf(status))));
		c.add(Restrictions.like("item", "%"+search+"%"));
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//c.add(Restrictions.between("pubTime", sdf.parse(timeFrom), sdf.parse(timeTo)));
		if(!("".equals(timeTo)&&"".equals(timeFrom))){
			c.add(Restrictions.between("pubTime", Timestamp.valueOf(timeFrom), Timestamp.valueOf(timeTo)));
		}else if((("".equals(timeFrom))&&(!"".equals(timeTo))) ){ //如果开始时间为空字符串
			c.add(Restrictions.between("pubTime", new Timestamp(1L), Timestamp.valueOf(timeTo) ));
		}else if( (!"".equals(timeTo))&&("".equals(timeTo))){ //如果截止时间为空字符串
			c.add(Restrictions.between("pubTime",Timestamp.valueOf(timeFrom), new Timestamp(System.currentTimeMillis()) ));
		}else{
			
		}
		
		c.setProjection(Projections.rowCount());
		String str= "";
		str = c.uniqueResult().toString();
		
		return BigInteger.valueOf(Long.valueOf(str));		
	}
}
