<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<t:datagrid name="videolist" checkbox="true"
	actionUrl="videoManage.do?datagrid" fit="true" fitColumns="true"
	idField="id" queryMode="group">
	<t:dgCol title="标题" field="title" hidden="true"></t:dgCol>
	<t:dgCol title="视频地址" field="url" query="true" width="100"></t:dgCol>
	<t:dgCol title="是否收费" field="fee" width="100" replace="是_true,否_false"></t:dgCol>
	<t:dgCol title="价格" field="price" width="100"></t:dgCol>
	<t:dgCol title="缩略图" field="img" image="true" imageSize="80,80"></t:dgCol>
	<t:dgCol title="上传时间" field="uploadDate"></t:dgCol>
	<t:dgCol title="浏览" field="testURL" funname="openVideo"
		url="video.do?detail&id={id}"></t:dgCol>

	<t:dgCol title="" field="id" hidden="false"></t:dgCol>
	<t:dgToolBar title="添加视频信息" icon="icon-add"
		url="videoManage.do?addorUpdate" funname="add"></t:dgToolBar>
	<t:dgToolBar title="编辑视频信息" icon="icon-edit"
		url="videoManage.do?addorUpdate" funname="update"></t:dgToolBar>
	<t:dgToolBar title="删除" icon="icon-remove"
		url="videoManage.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
</t:datagrid>
<script type="text/javascript">
	var formatBoolean = function(value, rowData, rowIndex) {
		return '是';
	}
	var openVideo = function(title, url) {
		window.open(url);
	}
</script>



