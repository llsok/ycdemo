package com.yc.springmvc.web.d0303;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.springmvc.bean.User;

@Controller
public class UploadAction {

	@PostMapping("upload.do")
	public String handleFormUpload(@RequestParam("name") String name, 
			@RequestParam("file") MultipartFile file) 
			throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			// file.getInputStream(); // 返回上传的流
			file.getName(); // ==>  控件名 file
			String filename = file.getOriginalFilename(); // ===> 提交的文件名
			file.getSize(); // 文件大小
			File diskFile = new File("d:/", filename);
			file.transferTo(diskFile);  // 保存文件
			return "success";
		}
		return "redirect:upload.html";
	}
	
	@GetMapping("upload.html")
	public String toupload() {
		return "upload";
	}
	
	@ResponseBody
	@PostMapping("upload_ajax.do")
	public List<String> handleFormUpload1(@RequestParam("name") String name, 
			@RequestParam("file") MultipartFile[] files) 
			throws IllegalStateException, IOException {
		List<String>ret = new ArrayList<>();
		for(  MultipartFile file : files) {
			if (!file.isEmpty()) {
				String filename = file.getOriginalFilename(); // ===> 提交的文件名
				File diskFile = new File("d:/", filename);  // ???????
				file.transferTo(diskFile);  // 保存文件
				ret.add("d/"+filename);
			}
		}
		return ret;
	}
	
	@GetMapping("reg.do")
	public String reg(User user) {
		System.out.println(user.getRegtime());
		return "success";
	}
	
/*	@InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }
*/	
	/**
	 * Spring 4.2 以上版本支持
	 * @param binder
	 */
	@InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.addCustomFormatter(new DateFormatter("yyyy-MM-dd"));
    }


}
