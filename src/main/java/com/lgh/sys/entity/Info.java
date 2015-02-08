package com.lgh.sys.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import com.lgh.common.entity.BaseEntity;

@Entity
@Table(name = "t_info")
public class Info extends BaseEntity implements Serializable {

	private static final long serialVersionUID = -340145128503981367L;
	
	private Short status;
	private String place;
	private String detail;
	private Timestamp pubTime;
	private Timestamp updateTime;
	private Integer publishAdminId;
	private Integer publishUserId;

	@Column(name = "status")
	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	@Column(name = "place")
	public String getPlace() {
		return this.place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	@Column(name = "detail")
	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Column(name = "pub_time", length = 19)
	public Timestamp getPubTime() {
		return this.pubTime;
	}

	public void setPubTime(Timestamp pubTime) {
		this.pubTime = pubTime;
	}

	@Column(name = "update_time", length = 19)
	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "publish_admin_id")
	public Integer getPublishAdminId() {
		return this.publishAdminId;
	}

	public void setPublishAdminId(Integer publishAdminId) {
		this.publishAdminId = publishAdminId;
	}

	@Column(name = "publish_user_id")
	public Integer getPublishUserId() {
		return this.publishUserId;
	}

	public void setPublishUserId(Integer publishUserId) {
		this.publishUserId = publishUserId;
	}

}