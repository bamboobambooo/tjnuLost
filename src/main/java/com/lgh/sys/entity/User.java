package com.lgh.sys.entity;


import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.lgh.common.entity.BaseEntity;

/**
 * User实体
 * @author liugh
 *
 */

@Entity
@Table(name = "t_user")
public class User extends BaseEntity implements Serializable {


	private static final long serialVersionUID = -4344007914742190026L;
	
	private String name;
	private String realname;
	private String password;
	private BigInteger mobile;
	private String email;

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public BigInteger getMobile() {
		return this.mobile;
	}

	public void setMobile(BigInteger mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}