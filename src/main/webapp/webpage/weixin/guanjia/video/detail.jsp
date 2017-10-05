<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<!--网页编码-->
<meta charset="UTF-8">
<!--网页描述-->
<meta name="description" content="${videoInfo.title}">
<!--网页作者-->
<meta name="author" content="wuqing">
<!--网页标题-->
<title>${videoInfo.title}</title>
<t:base type="jquery"></t:base>
<link rel="stylesheet" type="text/css"
	href="${webRoot}/plug-in/style/video.css">
<style>
.p-thumb:hover a {
	background: url(${webRoot}/plug-in/style/play.png) 50% 50% no-repeat;
}
</style>
</head>
<body style="height: 1500px; width: 100%; overflow: hidden;">
	<div class="p-thumb" style="width: 100%;" id="thumb">
		<a href="javascript:playVideo();"></a> <img src="${videoInfo.img}" />
	</div>
	<!-- 
	<iframe id="videoContent" frameborder="no" height="84%"
		style="margin-top: 0px;" scrolling="yes" name="siderbar" width="100%"
		src="${videoInfo.url}">
	 </iframe>
	  -->
</body>
<script language="javascript">
   var playVideo=function(url){
   $('#thumb').hide();
   // 如果需要则显示支付界面
   var iframe=$('<iframe>').attr({id:'videoContent',frameborder:'no',height:'84%',
    scrolling:'yes',name:'siderbar',width:'100%',src:'${videoInfo.url}'
   }).css({'margin-top':'0px'});
   $('body').append(iframe);
   }
  
</script>
</html>




