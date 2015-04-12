package com.lgh.sys.service;


import java.io.File;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgh.common.CommonInfo;
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
	 * 根据搜索词来查询信息
	 * @param search 搜索词
	 * @param status 状态
	 * @param timeFrom 起始时间
	 * @param timeTo 截止时间
	 * @param orderPropertyName 排序属性名  降序
	 * @param begin 开始位置索引
	 * @param size 结果条数
	 * @return List<Info>
	 */
	public List<Info> findInfoByWord(String search,short status,String timeFrom,String timeTo,String orderPropertyName,int begin,int size){
		return infoDao.findInfoByWord(search, status, timeFrom, timeTo, orderPropertyName, begin, size);
	}
	
	/**
	 * 根据搜索词来查询信息 的条数
	 * @param search 搜索词
	 * @param status 状态
	 * @param timeFrom 起始时间
	 * @param timeTo 截止时间
	 * @return BigInteger
	 */
	public BigInteger countInfoByWord(String search, short status,String timeFrom, String timeTo) {
		return infoDao.countInfoByWord(search, status, timeFrom, timeTo);
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
	
    /**
     * 
     * uploadImg:上传图片并返回一些参数
     * 
     * @author 刘各欢
     * @param pic
     * @param req
     * @return
     * @since 　Ver 1.1
     */
    public String uploadImg(File pic,String uploadFileName){
		//从CommonInfo中读取上传文件的路径
		String pathString = CommonInfo.imgPath+"/infoimg/";
		String fileName = "";
		
		//判断文件是否已经被获取到
		if (pic.length() > 0) {
			//user.setImage(pathString + pic.getOriginalFilename());
			//判断文件存储路径是否存在
			File tmp = new File(pathString);

			if (!tmp.exists() && !tmp.isDirectory()) {
				tmp.mkdirs();
			}
			try {
				String ext=uploadFileName.substring(uploadFileName.lastIndexOf(".")+1,uploadFileName.length());
				fileName = System.currentTimeMillis()+"."+ext;
				File fileNew = new File(pathString+fileName);
				FileUtils.copyFile(pic, fileNew);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else{
			return "error";//未获取到文件
		}
		return fileName;
	}
	
}