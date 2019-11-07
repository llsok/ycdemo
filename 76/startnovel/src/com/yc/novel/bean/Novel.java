package com.yc.novel.bean;

import java.io.Serializable;

/**
 * novels表的实体类
 * @author psq
 *
 * java.io.NotSerializableException: com.yc.novel.bean.Novel 创建的Novel类未实现Serializable接口
 */
public class Novel implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id ;
	private String ntype;
	private String nname;
	private String clickNum;
	private String dateStr;
	private String author;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNtype() {
		return ntype;
	}
	public void setNtype(String ntype) {
		this.ntype = ntype;
	}
	public String getNname() {
		return nname;
	}
	public void setNname(String nname) {
		this.nname = nname;
	}
	public String getClickNum() {
		return clickNum;
	}
	public void setClickNum(String clickNum) {
		this.clickNum = clickNum;
	}
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	@Override
	public String toString() {
		return "Novel [id=" + id + ", ntype=" + ntype + ", nname=" + nname + ", clickNum=" + clickNum + ", dateStr="
				+ dateStr + ", author=" + author + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((author == null) ? 0 : author.hashCode());
		result = prime * result + ((nname == null) ? 0 : nname.hashCode());
		result = prime * result + ((ntype == null) ? 0 : ntype.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Novel other = (Novel) obj;
		if (author == null) {
			if (other.author != null)
				return false;
		} else if (!author.equals(other.author))
			return false;
		if (nname == null) {
			if (other.nname != null)
				return false;
		} else if (!nname.equals(other.nname))
			return false;
		if (ntype == null) {
			if (other.ntype != null)
				return false;
		} else if (!ntype.equals(other.ntype))
			return false;
		return true;
	}
	
	
}
