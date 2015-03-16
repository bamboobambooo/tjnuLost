package com.lgh.sys.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgh.common.service.BaseService;
import com.lgh.sys.dao.InfoDao;
import com.lgh.sys.entity.Info;

/**
 * Info失物信息和找到信息的Service类
 * @author liugh
 *
 */
@Service
public class InfoService extends BaseService<Info> {
	@Autowired
	private InfoDao infoDao;
	
	/**
	 * 根据status来查询信息
	 * @param status Info的状态
	 * @param orderPropertyName 排序的属性名
	 * @param begin
	 * @param size
	 * @return List<Info>
	 */
	public List<Info> findInfoByPageAndStatus(short status,String orderPropertyName,int begin,int size){
		return infoDao.findInfoByPageAndStatus(status,orderPropertyName,begin,size);
	}
	
	/**
	 * 分页查询 丢失的信息
	 * @param orderPropertyName 排序的属性名
	 * @param begin
	 * @param size
	 * @return List<Info>
	 */
	public List<Info> findLostByPage(String orderPropertyName,int begin,int size){
		return infoDao.findInfoByPageAndStatus(2,orderPropertyName, begin,size);
	}
	
	/**
	 * 分页查询 找到的信息
	 * @param orderPropertyName 排序的属性名
	 * @param begin
	 * @param size
	 * @return List<Info>
	 */
	public List<Info> findFoundByPage(String orderPropertyName,int begin,int size){
		return infoDao.findInfoByPageAndStatus(-2,orderPropertyName, begin,size);
	}
}