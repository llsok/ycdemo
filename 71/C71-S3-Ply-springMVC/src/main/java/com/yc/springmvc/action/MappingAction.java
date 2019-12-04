package com.yc.springmvc.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.springmvc.bean.Result;

@Controller
/**
 * 
 * 1、@RequestMapping 加在类上，表示该路径会拼接到所有的方法地址前面
 * 2、地址映射支持匹配符：
 * 		1） ? 表示1个字符
 * 		2） * 表示0~N字符
 * 		3) ** 表示N级目录
 * 3、path 可以使用数组配置多个地址
 * 4、method 可以指定请求的方法类型 get post
 * 5、params 用于限定参数名或值
 * 6、headers 用于判断头域中是否包含某个键值对 
 * 7、consumes 用来限制ContentType  produces 用来限制Accept  
 * 
 *
 * ResponseBody 用于设定 json 返回
 * RequestBody 用于定义接收请求实体的内容
 *
 */

@RequestMapping("page")
public class MappingAction {

	@RequestMapping("user.do")
	public String getUser(){
		System.out.println("user.do");
		return "user";
	}
	
	// auser.do, buser.do
	@RequestMapping("?user.do")
	public String getUser1(){
		System.out.println("?user.do");
		return "user";
	}
	
	// abcuser.do,erguser.do
	@RequestMapping("*user.do")
	public String getUser2(){
		System.out.println("*user.do");
		return "user";
	}
	
	// a/b/c/user.do, a/user.do, b/c/user.do
	@RequestMapping("**/*user.do")
	public String getUser3(){
		System.out.println("**/user.do");
		return "user";
	}
	
	@RequestMapping(path={"myuser.do","myuser1.do","youruser.do"})
	public String getUser4(){
		System.out.println("myuser.do   myuser1.do   youruser.do");
		return "user";
	}
	
	@RequestMapping(path={"userget.do"},method=RequestMethod.GET)
	public String getUser5(){
		System.out.println("userget.do");
		return "user";
	}
	
	@RequestMapping(path={"userpost.do"},method=RequestMethod.POST)
	public String getUser6(){
		System.out.println("userpost.do");
		return "user";
	}
	
	/**
	 * 判断参数是否存在
	 */
	@RequestMapping(value="login.do",params={"name","pwd"})
	public String login(String name, String pwd){
		return "user";
	}
	
	/**
	 * 判读参数是否为指定值
	 */
	@RequestMapping(value="find.do",params={"id=1"})
	public String findusers(String id){
		System.out.println("id=1");
		return "user";
	}
	@RequestMapping(value="find.do",params={"id!=1"})
	public String findusers1(String id){
		System.out.println("id!=1");
		return "user";
	}
	
	/**
	 * 只能相应 ajax 请求
	 * 如果地址栏输入 ，或是表单提交则失败
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="get.do",headers="X-Requested-With=XMLHttpRequest")
	public String get(){
		System.out.println("get.do");
		return "user";
	}
	
	/**
	 * 需要 jackson-databind 依赖
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="addOrder.do")
	public Result addOrder(){
		System.out.println("addOrder.do");
		return new Result("1", "订单提交成功！", null);
	}
	
	@RequestMapping(value="getBody.do")
	public String getBody(@RequestBody String body){
		System.out.println(body);
		return "user";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	// TODO 未完成测试
	@RequestMapping(value="get1.do", produces="image/*")
	public String get1(){
		System.out.println("get1.do");
		return "user";
	}
	
}
