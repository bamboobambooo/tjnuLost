package com.lgh.sys.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgh.sys.dao.InfoDao;
import com.lgh.sys.entity.Info;

@Service
public class InfoService {
	@Autowired
	private InfoDao infoDao;
	
	
	public void save(Info info){
		infoDao.save(info);
	
		}
	

		
}