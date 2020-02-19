package com.yc.mybatis.bean;

public class Hall {
    private Integer id;

    private String name;

    private String hallType;

    private Integer capacity;

    private Integer cinemaId;
    
    // 该影厅所属的影院
    private Cinema cinema;

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

    public String getHallType() {
        return hallType;
    }

    public void setHallType(String hallType) {
        this.hallType = hallType == null ? null : hallType.trim();
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public Integer getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Integer cinemaId) {
        this.cinemaId = cinemaId;
    }

	public Cinema getCinema() {
		return cinema;
	}

	public void setCinema(Cinema cinema) {
		this.cinema = cinema;
	}
    
    
}