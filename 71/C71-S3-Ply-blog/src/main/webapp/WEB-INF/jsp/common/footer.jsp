<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<script type="text/javascript">
function login(){
	var username = $("#loginModalUserNmae").val();
	var password = $("#loginModalUserPwd").val();
	$.post("login",
			{account : username,
			 pwd : password},
		function(result){
			
			if(result.code == 0){
				alert(result.msg);
			} else if (result.code == 2){
				console.info(result.data);
				for(var i=0; i< result.data.length; i++){
					console.info(result.data[i].field);
					if(result.data[i].field == 'account'){
						// html 元素.innerText
						$("#unameLabel").text("用户名   " + result.data[i].defaultMessage);
					} else if(result.data[i].field == 'pwd'){
						$("#upassLabel").text("密码   " + result.data[i].defaultMessage);
					}
				}
			} else if(result.code == 1){
				// 隐藏模态框
				$('#loginModal').modal('hide');
				$(".login").text("Hi,"+result.data.name);
			}
				 
			
			
		}
	)
}
</script>

<footer class="footer">
  <div class="container">
    <p>&copy; 2016 <a href="">ylsat.com</a> &nbsp; <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">豫ICP备20151109-1</a> &nbsp; <a href="sitemap.xml" target="_blank" class="sitemap">网站地图</a></p>
  </div>
  <div id="gotop"><a class="gotop"></a></div>
</footer>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <img src="images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
    </div>
  </div>
</div>
<!--该功能正在日以继夜的开发中-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--登录注册模态框-->
<div class="modal fade user-select" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form action="/Admin/Index/login" method="post">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="loginModalLabel">登录</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="loginModalUserNmae" id="unameLabel">用户名</label>
            <input type="text" class="form-control" id="loginModalUserNmae" placeholder="请输入用户名" autofocus maxlength="15" autocomplete="off" required>
          </div>
          <div class="form-group">
            <label for="loginModalUserPwd" id="upassLabel">密码</label>
            <input type="password" class="form-control" id="loginModalUserPwd" placeholder="请输入密码" maxlength="18" autocomplete="off" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="button" class="btn btn-primary" onclick="login()">登录</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!--右键菜单列表-->
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问异清轩博客</li>
    <li class="list-group-item"><span>IP：</span>172.16.10.129</li>
    <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
  </ul>
</div>
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.ias.js"></script> 
<script src="js/scripts.js"></script>