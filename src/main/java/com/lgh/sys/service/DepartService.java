package com.lgh.sys.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgh.common.service.BaseService;
import com.lgh.sys.dao.DepartDao;
import com.lgh.sys.entity.Admin;

/**
 * DepartService
 * @author liugh
 *
 */
@Service
public class DepartService extends BaseService<Admin> {
	@Autowired
	private DepartDao departDao;
	

}