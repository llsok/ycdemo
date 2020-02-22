package com.yc.mybatis.bean;

import java.util.Date;

public class User {
	
	private Hall hall;
	
    public Hall getHall() {
		return hall;
	}

	public void setHall(Hall hall) {
		this.hall = hall;
	}
	
	private Integer id;

    private String username;

    private String password;

    private String email;

    private String headImg;

    private String phone;

    private Integer status;

    private Date regtime;
    
    public User() {
    	
    }
    
    public User(Integer id, String username, String password) {
		super();
		System.out.println("=======  Integer id, String username, String password   =======");
		this.id = id;
		this.username = username;
		this.password = password;
	}
    
    public User(String username, String password, Integer id) {
		super();
		System.out.println("=======  String username, String password, Integer id  =======");
		this.id = id;
		this.username = username;
		this.password = password;
	}


	/**
     *  初始化方法
     */
    public void initA() {
    	System.out.println("=======initA===========");
    }
    
    /**
     * 销毁方法
     */
    public void close() {
    	System.out.println("=======close===========");
    }
    
    /**
     * 静态的工厂方法
     */
    public static User create() {
    	System.out.println("=======create===========");
    	return new User();
    }

    /**
     * 动态的工厂方法
     */
    public User create1() {
    	System.out.println("=======create1===========");
    	return new User();
    }
    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg == null ? null : headImg.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }
}