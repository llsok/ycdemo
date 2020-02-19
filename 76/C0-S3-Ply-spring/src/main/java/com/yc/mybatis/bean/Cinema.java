package com.yc.mybatis.bean;

import java.util.List;

public class Cinema {
    private Integer id;

    private String name;

    private String address;

    private String gps;

    private String img;
    
    // 影院下属的影厅
    private List<Hall> halls;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getGps() {
        return gps;
    }

    public void setGps(String gps) {
        this.gps = gps == null ? null : gps.trim();
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

	public List<Hall> getHalls() {
		return halls;
	}

	public void setHalls(List<Hall> halls) {
		this.halls = halls;
	}
    
}