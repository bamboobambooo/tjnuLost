package com.lgh.common.service;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lgh.common.dao.BaseDao;

@Service
@Transactional
public abstract class BaseService<T extends Serializable> {

	//@Lazy
	@Autowired
	private BaseDao<T> baseDao;

	public void save(T t) {
		this.baseDao.save(t);
	}

	public void update(T t) {
		this.baseDao.update(t);
	}

	public void saveOrUpdate(T t) {
		this.baseDao.saveOrUpdate(t);
	}

	public void delete(T t) {
		this.baseDao.delete(t);
	}

	public T get(Serializable id) {
		return this.baseDao.get(id);
	}

	public List<T> findAll() {
		return this.baseDao.findByAll();
	}
	public List<T> findAll(Class<? extends Object> entityClass){
		return this.baseDao.loadAll(entityClass);
	}
	
	public List<T> findAllByPage(Class<? extends Object> entityClass,int begin,int size){
		DetachedCriteria dc = DetachedCriteria.forClass(entityClass);
		return this.baseDao.findByCriteria(dc, begin, size);
	}
	
	/**
	 * 根据实体和属性名和条件查询实体集
	 * @param clazz
	 * @param orderPropertyName 排序属性名
	 * @param begin
	 * @param size
	 * @param condition 查询条件
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List findAllByPageAndOrder(Class<? extends Object> clazz,String orderPropertyName,String ascOrDesc,int begin,int size,Map<String,Object>... condition){
		return baseDao.findAllByPageAndOrder(clazz, orderPropertyName,ascOrDesc, begin, size, condition);
	}
	
	public List<T> findAllByPageAndAscOrder(Class<? extends Object> entityClass,String prop,int beginIndex,int size){
		DetachedCriteria dc = DetachedCriteria.forClass(entityClass);
		dc.addOrder(Order.asc(prop));
		return this.baseDao.findByCriteria(dc, beginIndex, size);
	}
	
	public List<T> findAllByPageAndDescOrder(Class<? extends Object> entityClass,String prop,int beginIndex,int size){
		DetachedCriteria dc = DetachedCriteria.forClass(entityClass);
		dc.addOrder(Order.desc(prop));
		return this.baseDao.findByCriteria(dc, beginIndex, size);
	}

	public Long findCountByAll() {
		return this.baseDao.findCountByAll();
	}

	public List<T> findByExample(T t) {
		return this.baseDao.findByExample(t);
	}

}
