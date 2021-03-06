<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include   page="../common/header.jsp" flush="true"/>
 <style>
	.thumb {margin-left:5px; margin-top:15px; height:128px}
	#prevModal {width:100%; height:100%; text-align:center; display:none;}
	#img_prev {max-width:98%; max-height:98%; margin: 10px auto}
  </style>
<div class="bread-crumbs">
  <span class="layui-breadcrumb">
  <a href="">首页</a>
  <a><cite></cite></a>
  </span>
</div>
<div class="page-concent-div">
  <h1>添加邮件模板</h1>
  <hr>
</div>
<div class="page-concent-div">
  <form id="activity_form" class="layui-form" action="" method="post">
  	<input type="hidden" value="admin_add_email_template" name="post_type">
  	<div class="layui-form-item">
	    <label class="layui-form-label">模板类别:</label>
	    <div class="layui-input-block wd-100px">
	      <select name="email_template_type" lay-filter="aihao" lay-verify="required">
		        <option value="1" >注册</option>
		        <option value="2" >登录</option>
		        <option value="3" >下单</option>
		        <option value="4" >退款</option>
	      </select>
	    </div>
	  </div>
      <div class="layui-form-item">
	    <label class="layui-form-label">模板标题:</label>
	    <div class="layui-input-inline">
	      <input type="text" name="email_template_title" lay-verify="required" placeholder="请输入模板标题" autocomplete="off" class="layui-input">
	    </div>
	  </div> 
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">邮件内容:</label>
	    <div class="layui-input-block wd-500px">
	      <textarea name="email_template_content" lay-verify="required" placeholder="请输入邮件内容" class="layui-textarea"></textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	      <div class="layui-input-block">
	        <button class="layui-btn submit" lay-submit="" lay-filter="demo1">确认添加</button>
	          <a href="${pageContext.request.contextPath}/route?get_type=admin_email_template_list"><span type="reset" class="layui-btn layui-btn-primary">返回</span></a>
	      </div>
	 </div>
   </form>
</div>
<script>
var addGoods;
var uploadInst;
layui.use(['form', 'layedit', 'upload'], function(){
  var $ = layui.jquery,
  upload = layui.upload
  ,form = layui.form;
  	// 监听提交
	 form.on('submit(demo1)', function(data){
	 	console.log(JSON.stringify(data.field));
		is_ok("${pageContext.request.contextPath}/route", data.field, 'addEmailtemplateReturn');
	   	return false;
	 });
  	//自定义验证规则
	form.verify({
	  positiveNumber: function(value){
	    if(value <= 0){
	      return '必须为正数';
	    }
	  }
	});
  
  // 添加商品回调函数
  addEmailtemplateReturn = function addBookReturn(returnData) {
  		if (returnData.code == 200) {
			layer.msg(returnData.msg, {icon: 1}, function () {
				location.reload();
		    });
		} else {
			layer.msg(returnData.msg, {icon: 2}, function () {
				location.reload();
		    });
		}
  }
});
</script>
