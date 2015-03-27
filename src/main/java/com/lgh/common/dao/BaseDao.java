package com.lgh.common.dao;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.lgh.common.tools.GenericUtil;
/**
 * Hibernate 3与Spring整合适用
 * @author liugh
 *
 * @param <T>
 */
@Lazy
@Repository
@Scope("prototype")
public class BaseDao<T extends Serializable> extends HibernateDaoSupport{
	@Resource(name="sessionFactory")
	private void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
	//private Class<? extends Object> entityClass;
	private Class<T> entityClass;
	
	/*public Class<? extends Object> getEntityClass() {
		return entityClass;
	}*/
	public Class<T> getEntityClass() {
		return entityClass;
	}
	/*public void setEntityClass(Class<? extends Object> entityClass) {
		this.entityClass = entityClass;
	}*/
	public void setEntityClass(Class<T> entityClass) {
		this.entityClass = entityClass;
	}
	public BaseDao() {
		//Class<? extends Object> genericClass = GenericUtil.getSuperGenericClass(this.getClass());
		/*Class<? extends Object> genericClass = GenericUtil.getSuperClassGenricType(this.getClass());
		this.setEntityClass(genericClass);*/
		@SuppressWarnings("unchecked")
		Class<T> genericClass = (Class<T>) GenericUtil.getSuperClassGenricType(this.getClass());
		this.setEntityClass(genericClass);
	}
	
	public Criteria createCriteria()                                
	{                                                      
	  //Session session = getSession();
	  Session session = getSessionFactory().getCurrentSession();                               
	  Criteria criteria = session.createCriteria(getEntityClass()); 
	  return criteria;                                              
	}                                                               

	public void save(T t){
		super.getHibernateTemplate().save(t);
	}
	
	@SuppressWarnings("unchecked")
	public T get(Serializable id){
		return (T) super.getHibernateTemplate().get(this.getEntityClass(), id);
	}
	
	public T get(Class<T> clazz, Serializable id) {
		return super.getHibernateTemplate().get(clazz, id);
	}                                                        
	@SuppressWarnings("unchecked")
	public List<T> loadAll(Class<? extends Object> entityClass){
		return (List<T>) super.getHibernateTemplate().loadAll(entityClass);
	}
	public List<T> findByAll(){
		return this.loadAll(entityClass);
	}

	@SuppressWarnings("rawtypes")
	public List findByCriteria(DetachedCriteria criteria){
		List list = super.getHibernateTemplate().findByCriteria(criteria);
		return list;
	}
	/**
	 * 
	 * findByCriteria:分页查询
	 * 
	 * @author 刘各欢
	 * @param criteria qbc对象
	 * @param firstResult 从零开始的索引
	 * @param maxResults 想要的结果条数
	 * @return List<T>
	 * @since  　Ver 1.1
	 */
	@SuppressWarnings("unchecked")
	public List<T> findByCriteria(DetachedCriteria criteria, int firstResult, int maxResults){
		return super.getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
	}
	
	
	/**
	 * 根据实体和属性名查询信息
	 * @param clazz
	 * @param orderPropertyName 排序属性名
	 * @param ascOrDesc 升序或者降序
	 * @param begin
	 * @param size
	 * @param condition 查询条件
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List findAllByPageAndOrder(Class<? extends Object> clazz,String orderPropertyName,String ascOrDesc,int begin,int size,Map<String,Object>... condition){
		Criteria c = super.getSessionFactory().getCurrentSession().createCriteria(clazz);
		if (condition.length > 0) {
			for (Map<String, Object> map : condition) {
				Iterator<String> it = map.keySet().iterator();
				while (it.hasNext()) {
					String en = it.next();
					c.add(Restrictions.eq(en, map.get(en)));
				}
			}
		}
		if("asc".equals(ascOrDesc)){
			c.addOrder(Order.asc(orderPropertyName));
		}else if("desc".equals(ascOrDesc)){
			c.addOrder(Order.desc(orderPropertyName));
		}
		c.setFirstResult(begin);
		c.setMaxResults(size);		
		return c.list();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<T> findByExample(T t){
		return super.getHibernateTemplate().findByExample(t);
	}
	
	@SuppressWarnings("unchecked")
	public Long findCountByAll(){
		String hql = "select count(*) from "+entityClass.getSimpleName();
		List<Object> list = this.getHibernateTemplate().find(hql);
		Object countObj = list.get(0);
		Long count = Long.valueOf(countObj.toString());
		return count;
	}
	
	public void update(T t){
		super.getHibernateTemplate().update(t);
	}
	public void delete(T t){
		super.getHibernateTemplate().delete(t);
	}
	@SuppressWarnings("rawtypes")
	public List find(String queryString, Object...values){
		return super.getHibernateTemplate().find(queryString, values);
	}
	
	public void saveOrUpdate(T t){
		super.getHibernateTemplate().saveOrUpdate(t);
	}
}
