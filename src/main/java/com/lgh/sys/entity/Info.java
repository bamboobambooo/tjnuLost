package com.lgh.sys.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.lgh.common.entity.BaseEntity;

/**
 * 发布的信息 实体
 * @author liugh
 *
 */
@Entity
@Table(name = "t_info")
public class Info extends BaseEntity implements Serializable {

	private static final long serialVersionUID = -340145128503981367L;
	
	private Short status;
	private String place;
	private String item;
	private String imgurl;
	private String detail;
	@Column(name = "pub_time")
	private Timestamp pubTime;
	@Column(name = "update_time")	
	private Timestamp updateTime;
	/*
	@Column(name = "publish_admin_id")
	private Integer publishAdminId;
	*/

	private Admin publishAdmin;
	/*
	@Column(name = "publish_user_id")
	private Integer publishUserId;
	*/

	private User publishUser;

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getPlace() {
		return this.place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Timestamp getPubTime() {
		return this.pubTime;
	}

	public void setPubTime(Timestamp pubTime) {
		this.pubTime = pubTime;
	}

	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	@Access(AccessType.PROPERTY)
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "publish_admin_id")
	public Admin getPublishAdmin() {
		if(this.publishAdmin!=null){
			this.publishAdmin.setPassword(null);
		}
		return publishAdmin;
	}

	public void setPublishAdmin(Admin publishAdmin) {
		this.publishAdmin = publishAdmin;
	}
	@Access(AccessType.PROPERTY)
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "publish_user_id")
	public User getPublishUser() {
		if(this.publishUser!=null){
			this.publishUser.setPassword(null);
		}
		return publishUser;
	}

	public void setPublishUser(User publishUser) {
		this.publishUser = publishUser;
	}

	/*
	public Integer getPublishAdminId() {
		return this.publishAdminId;
	}

	public void setPublishAdminId(Integer publishAdminId) {
		this.publishAdminId = publishAdminId;
	}


	public Integer getPublishUserId() {
		return this.publishUserId;
	}

	public void setPublishUserId(Integer publishUserId) {
		this.publishUserId = publishUserId;
	}
	*/

}