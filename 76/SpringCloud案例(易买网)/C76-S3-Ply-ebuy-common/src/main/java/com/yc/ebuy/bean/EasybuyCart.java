package com.yc.ebuy.bean;

import java.util.Date;

public class EasybuyCart {
    private Integer id;

    private Integer uid;

    private Integer pid;

    private Integer count;

    private Date createtime;
    
    private EasybuyProduct product;
    
    public EasybuyProduct getProduct() {
		return product;
	}

	public void setProduct(EasybuyProduct product) {
		this.product = product;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}