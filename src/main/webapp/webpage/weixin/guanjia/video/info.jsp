<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<t:base type="jquery,easyui,tools"></t:base>
<link rel="stylesheet" href="plug-in/uploadify/css/uploadify.css"
	type="text/css">
<script type="text/javascript"
	src="plug-in/uploadify/jquery.uploadify-3.1.js"></script>
</head>
<body style="overflow-y: hidden" scroll="no">
	<t:formvalid formid="messagefrom" dialog="true" usePlugin="password"
		layout="table" action="videoManage.do?doSave">
		<input id="id" name="id" type="hidden" value="${videoInfo.id}">

		<table style="width: 600px;" cellpadding="0" cellspacing="1"
			class="formtable">
			<tr>
				<td align="right"><label class="Validform_label"> 标题: </label>
				</td>
				<td class="value"><input id="title" class="inputxt"
					name="title" value="${videoInfo.title}" datatype="*"
					nullmsg="视频标题不能为空！"> <span class="Validform_checktip">请输入视频标题！</span></td>
			</tr>

			<tr>
				<td align="right"><label class="Validform_label"> 视频地址:
				</label></td>
				<td class="value"><input id="url" class="inputxt" name="url"
					value="${videoInfo.url}" datatype="*" nullmsg="视频地址不能为空！">
					<span class="Validform_checktip">请输入视频地址！</span></td>
			</tr>

			<tr>
				<td align="right"><label class="Validform_label"> 是否收费:
				</label></td>
				<td class="value"><select name="fee" id="fee">
						<option value="1">是</option>
						<option value="0">否</option>
				</select></td>
			</tr>

			<tr>
				<td align="right"><label class="Validform_label"> 收看费用:
				</label></td>
				<td class="value"><input id="price" class="inputxt"
					name="price" value="${videoInfo.price}" datatype="*"></td>
			</tr>

			<tr>
				<td align="right"><label class="Validform_label"> 缩略图:
				</label></td>
				<td class="value"><input id="img_file" type="file"
					class="inputxt" name="img_file" value="${videoInfo.img}"
					datatype="*" /> <input id="img" type="hidden" class="inputxt"
					name="img" value="${videoInfo.img}" datatype="*" /> <img
					src="${videoInfo.img}" id="thumb"
					style="width: 100px; height: 100px; float: left;" /></td>
			</tr>
		</table>
	</t:formvalid>
	<script type="text/javascript">
	$(function() {
	  var fee='${videoInfo.fee}';
	  if(fee!=''){
	     //alert(${videoInfo.fee});
	     if(${videoInfo.fee}==false){
	       $('#fee').val('0');
	      
	     }else if(${videoInfo.fee}==true){
	     $('#fee').val('1');
	     }
	  }
	  
	 $("#img_file").uploadify(
	  {
		height        : 30,
		swf           : '${webRoot}/plug-in/uploadify/uploadify.swf',
		uploader      : '${webRoot}/weixinPhotoAlbumController.do?saveFiles',
		width         : 120,
		buttonText:'请选择图片',
		onUploadSuccess:function(file, data, response) {
          console.log($.parseJSON(data));
          console.log(file);
          console.log(response);
          $('#img').val($.parseJSON(data).attributes.realpath);
          $('thumb').attr('src',$.parseJSON(data).attributes.realpath);
        }
	  });
    });
	
	</script>
</body>