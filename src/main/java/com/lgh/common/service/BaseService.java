package com.lgh.common.service;

import java.io.Serializable;
import java.util.List;

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

	public List<T> findByAll() {
		return this.baseDao.findByAll();
	}
	public List<T> findByAll(Class<? extends Object> entityClass){
		return this.baseDao.loadAll(entityClass);
	}

	public Long findCountByAll() {
		return this.baseDao.findCountByAll();
	}

	public List<T> findByExample(T t) {
		return this.baseDao.findByExample(t);
	}
	public void haha(){
		
	}

}
