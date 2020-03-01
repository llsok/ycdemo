package com.yc.springmvc.bean;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

public class User {
	
	
	private String[] likes;
	private String edu;
	private String subject;
	
    public String[] getLikes() {
		return likes;
	}

	public void setLikes(String[] likes) {
		this.likes = likes;
	}

	public String getEdu() {
		return edu;
	}

	public void setEdu(String edu) {
		this.edu = edu;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	private Integer id;

	@NotEmpty
	@Length(max=16,min=3,message="用户名长度必须在3~16位之间")
    private String username;

	@NotEmpty
	@Length(max=12,min=6)
    private String password;

	@Email(message="请输入正确的电子邮件格式")
    private String email;

    private String headImg;

    private String phone;

    private Integer status;

    private Date regtime;

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

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", headImg=" + headImg + ", phone=" + phone + ", status=" + status + ", regtime=" + regtime + "]";
	}
    
}