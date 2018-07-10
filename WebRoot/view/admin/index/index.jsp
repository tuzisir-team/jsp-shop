<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<jsp:include   page="../common/base.jsp" flush="true"/>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
  	<meta name="renderer" content="webkit|ie-comp|ie-stand">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/logo.png" type="image/x-icon">
  
    <title>超市后台管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin/index/sccl.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/admin/index/skin/blue/skin.css" id="layout-skin"/>
  </head>
  <body>
  <div class="layout-admin">
    <header class="layout-header">
      <span class="header-logo">超市后台管理系统</span> 
      <a class="header-menu-btn" href="javascript:;"><i class="icon-font">&#xe600;</i></a>
      <ul class="header-bar">
        <li class="header-bar-role"><a href="javascript:;">您好:<% out.println((String)session.getAttribute("admin_name")); %></a></li>
        <li class="header-bar-nav">
          <a href="javascript:;"><i class="icon-font" style="margin-left:5px;">&#xe60c;</i></a>
          <ul class="header-dropdown-menu">
            <li><a href="#" class='edit_password'>修改密码</a></li>
            <li><a href="${pageContext.request.contextPath}/route?get_type=admin_unlogin">退出</a></li>
          </ul>
        </li>
		<li class="header-bar-nav"> 
          <a href="javascript:;" title="换肤"><i class="icon-font">&#xe608;</i></a>
          <ul class="header-dropdown-menu right dropdown-skin">
            <li><a href="javascript:;" data-val="qingxin" title="清新">清新</a></li>
            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
            <li><a href="javascript:;" data-val="molv" title="墨绿">墨绿</a></li>
          </ul>
        </li>	
      </ul>
    </header>
    <aside class="layout-side">
      <ul class="side-menu">
        
      </ul>
    </aside>
    
    <div class="layout-side-arrow"><div class="layout-side-arrow-icon"><i class="icon-font">&#xe60d;</i></div></div>
    
    <section class="layout-main">
      <div class="layout-main-tab">
        <button class="tab-btn btn-left"><i class="icon-font">&#xe60e;</i></button> 
                <nav class="tab-nav">
                    <div class="tab-nav-content">
                        <a href="javascript:;" class="content-tab active" data-id="">首页</a>
                    </div>
                </nav>
                <button class="tab-btn btn-right"><i class="icon-font">&#xe60f;</i></button>
      </div>
      <div class="layout-main-body">
        <iframe class="body-iframe" name="iframe0" width="100%" height="99%" src="${pageContext.request.contextPath}/route?get_type=admin_main" frameborder="0" data-id="" seamless></iframe>
      </div>
    </section>
    <div class="layout-footer">2018 &copy; tuzisir</div>
  </div>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sccl.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sccl-util.js"></script>
  </body>
</html>
<input type="hidden" id="functionsJson" value='${requestScope.functionsJson}'/>
<input type="hidden" id="onemenuJson" value='${requestScope.onemenuJson}'/>
<script type="text/javascript">
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
});

  $(function(){
	var functions = JSON.parse($("#functionsJson").val());
	var onemenus = JSON.parse($("#onemenuJson").val());
	var menu1 = '[{"id":"1","name":"首页","parentId":"0","url":"${pageContext.request.contextPath}/view/admin/index/main.jsp","icon":"","order":"1","isHeader":"1","childMenus":[';
  	for (var j=0; j<onemenus.length; j++) {
  		var flag = 0;
 		for (var i=0;i<functions.length;i++)
		{
			if (flag == 0 && onemenus[j]['admin_function_id'] == functions[i]['pid']) {
				menu1 +='{"id":"'+onemenus[j]['admin_function_id']+'","name":"'+onemenus[j]['admin_function_name']+'","parentId":"1","url":"","icon":"&#xe609;","order":"1","isHeader":"0","childMenus":[';
				flag = 1;
			}
			if (flag == 1 && onemenus[j]['admin_function_id'] == functions[i]['pid']) {
				menu1 += '{"id":"'+functions[i]['pid']+'","name":"'+functions[i]['admin_function_name']+'","parentId":"20","url":"${pageContext.request.contextPath}/route?get_type='+functions[i]['admin_function_url']+'","icon":"","order":"1","isHeader":"0","childMenus":""},'
			}
		}
		if (flag == 1) {
			flag = 0;
			menu1 = menu1.substr(0,menu1.length-2);
			menu1 += "}]},";
		}
	} 	
	menu1 = menu1.substr(0,menu1.length-1);
 	menu1 += "]}]";
/*  	console.log(menu1);
 */    var menu = [{"id":"1","name":"首页","parentId":"0","url":"${pageContext.request.contextPath}/view/admin/index/main.jsp","icon":"","order":"1","isHeader":"1","childMenus":[
            {"id":"10","name":"用户管理","parentId":"1","url":"","icon":"&#xe609;","order":"1","isHeader":"0","childMenus":[
            	{"id":"11","name":"用户列表","parentId":"20","url":"${pageContext.request.contextPath}/route?get_type=user_list","icon":"","order":"1","isHeader":"0","childMenus":""},
            ]},
            {"id":"20","name":"商品管理","parentId":"1","url":"","icon":"&#xe609;","order":"1","isHeader":"0","childMenus":[
              {"id":"21","name":"商品类别","parentId":"20","url":"${pageContext.request.contextPath}/route?get_type=admin_goods_category_list","icon":"","order":"1","isHeader":"0","childMenus":""},
              {"id":"22","name":"商品列表","parentId":"20","url":"${pageContext.request.contextPath}/route?get_type=admin_goods_list","icon":"","order":"1","isHeader":"0","childMenus":""},
            ]},
            {"id":"30","name":"订单管理","parentId":"1","url":"","icon":"&#xe609;","order":"1","isHeader":"0","childMenus":[
              {"id":"31","name":"订单列表","parentId":"20","url":"${pageContext.request.contextPath}/route?get_type=admin_orders_list","icon":"","order":"1","isHeader":"0","childMenus":""},
            ]},
            {"id":"40","name":"邮件管理","parentId":"1","url":"","icon":"&#xe609;","order":"1","isHeader":"0","childMenus":[
              {"id":"41","name":"邮件设置","parentId":"40","url":"${pageContext.request.contextPath}/route?get_type=admin_set_email","icon":"","order":"1","isHeader":"0","childMenus":""},
              {"id":"42","name":"邮件模板","parentId":"40","url":"${pageContext.request.contextPath}/route?get_type=admin_email_template_list","icon":"","order":"1","isHeader":"0","childMenus":""},
              {"id":"43","name":"已发邮件","parentId":"40","url":"${pageContext.request.contextPath}/route?get_type=admin_email_list","icon":"","order":"1","isHeader":"0","childMenus":""},
            ]},
            {"id":"50","name":"统计管理","parentId":"1","url":"","icon":"&#xe609;","order":"1","isHeader":"0","childMenus":[
              {"id":"51","name":"订单统计","parentId":"20","url":"${pageContext.request.contextPath}/route?get_type=admin_order_count","icon":"","order":"1","isHeader":"0","childMenus":""},
            ]},
            {"id":"60","name":"权限管理","parentId":"1","url":"","icon":"&#xe609;","order":"1","isHeader":"0","childMenus":[
              {"id":"61","name":"功能列表","parentId":"20","url":"${pageContext.request.contextPath}/route?get_type=admin_function_list","icon":"","order":"1","isHeader":"0","childMenus":""},
              {"id":"62","name":"角色列表","parentId":"20","url":"${pageContext.request.contextPath}/route?get_type=admin_rote_list","icon":"","order":"1","isHeader":"0","childMenus":""},
              {"id":"63","name":"管理员列表","parentId":"20","url":"${pageContext.request.contextPath}/route?get_type=admin_admin_list","icon":"","order":"1","isHeader":"0","childMenus":""},
            ]},
            /* {"id":"70","name":"<div style='display:inline-block;width:80%;height:100%;' class='edit_password'>修改密码</div>","parentId":"1","url":"","icon":"&#xe609;","order":"1","isHeader":"0","childMenus":[
            ]}, */
          ]},
        ] 
     init_menu(JSON.parse(menu1)); // 初始化菜单
      edit_password(); // 修改管理员密码
  });
  
  // 修改管理员密码
  function edit_password(){
  	$(".edit_password").click(function(){
		layer.open({
		  type: 2,
		  title: '修改管理员密码',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['50%', '45%'],
		  content: '${pageContext.request.contextPath}/view/admin/admin/edit_password.jsp'
		});
	});
  }
</script>


