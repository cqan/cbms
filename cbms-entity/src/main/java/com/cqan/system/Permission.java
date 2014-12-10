package com.cqan.system;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.cqan.IdLongEntity;



@Entity
@Table(name="tbl_permission")
//默认的缓存策略.
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Permission extends IdLongEntity{

	private List<Permission> children;
	
	private String name;
	
	private Permission parent;
	
	private String permissionCode;
	
	private int status;

	
	@OneToMany(mappedBy="parent",cascade=CascadeType.ALL)
	public List<Permission> getChildren() {
		return children;
	}

	public String getName() {
		return name;
	}

	@ManyToOne
	@JoinColumn(name = "pid") 
	public Permission getParent() {
		return parent;
	}

	public String getPermissionCode() {
		return permissionCode;
	}

	public int getStatus() {
		return status;
	}

	public void setChildren(List<Permission> children) {
		this.children = children;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setParent(Permission parent) {
		this.parent = parent;
	}

	public void setPermissionCode(String permissionCode) {
		this.permissionCode = permissionCode;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
