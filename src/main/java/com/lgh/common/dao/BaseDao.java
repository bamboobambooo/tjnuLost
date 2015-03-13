package com.lgh.common.dao;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.lgh.common.tools.GenericUtil;
/**
 * Hibernate 3与Spring整合适用
 * @author liugh
 *
 * @param <T>
 */
@Repository
public class BaseDao<T extends Serializable> extends HibernateDaoSupport{
	@Resource(name="sessionFactory")
	private void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
	private Class<? extends Object> entityClass;
	
	public Class<? extends Object> getEntityClass() {
		return entityClass;
	}
	public void setEntityClass(Class<? extends Object> entityClass) {
		this.entityClass = entityClass;
	}
	public BaseDao() {
		//Class<? extends Object> genericClass = GenericUtil.getSuperGenericClass(this.getClass());
		Class<? extends Object> genericClass = GenericUtil.getSuperClassGenricType(this.getClass());
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
