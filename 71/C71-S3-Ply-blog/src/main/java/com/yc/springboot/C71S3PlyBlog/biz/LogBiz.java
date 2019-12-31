package com.yc.springboot.C71S3PlyBlog.biz;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.springboot.C71S3PlyBlog.dao.LogMapper;

/**
 * 日志业务类
 */
@Service
public class LogBiz {
	
	@Resource
	private LogMapper logMapper;
	
	public void log(Object obj){
		logMapper.addLog(obj);
	}
	
	public void log1(Object obj){
		logMapper.addLog(obj);
	}
	
	public int log2(Object obj){
		logMapper.addLog(obj);
		return 0;
	}

}
