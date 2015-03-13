package com.lgh.sys.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgh.common.service.BaseService;
import com.lgh.sys.dao.InfoDao;
import com.lgh.sys.entity.Info;

@Service
public class InfoService extends BaseService<Info> {
	@Autowired
	private InfoDao infoDao;
	
	/**
	 * 根据status来查询信息
	 * @param status
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<Info> findInfoByPageAndStatus(int status,int begin,int size){
		return infoDao.findInfoByPageAndStatus(status,begin,size);
	}
	
	/**
	 * 分页查询 丢失的信息
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<Info> findLostByPage(int begin,int size){
		return infoDao.findInfoByPageAndStatus(2,begin,size);
	}
	
	/**
	 * 分页查询 找到的信息
	 * @param begin
	 * @param size
	 * @return
	 */
	public List<Info> findFoundByPage(int begin,int size){
		return infoDao.findInfoByPageAndStatus(-2,begin,size);
	}
}