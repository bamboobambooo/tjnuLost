package com.lgh.sys.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
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
	private String detail;
	@Column(name = "pub_time")
	private Timestamp pubTime;
	@Column(name = "update_time")	
	private Timestamp updateTime;
	@Column(name = "publish_admin_id")
	private Integer publishAdminId;
	@Column(name = "publish_user_id")
	private Integer publishUserId;

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

}