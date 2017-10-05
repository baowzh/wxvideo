package weixin.guanjia.message.controller;

import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import weixin.guanjia.message.entity.VideoInfo;
import weixin.guanjia.message.service.VideoManageService;

/**
 * 视频消息管理
 * 
 * @author bao_w
 *
 */
@Controller
@RequestMapping("videoManage")
public class VideoManageController {
	private ResourceBundle bundler = ResourceBundle.getBundle("sysConfig");

	private Logger logger = Logger.getLogger(VideoManageController.class);

	@Autowired
	private VideoManageService videoManageService;

	/**
	 * 打开视频消息列表
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list() {
		return new ModelAndView("weixin/guanjia/video/list");
	}

	/**
	 * 加载数据
	 * 
	 * @param videoInfo
	 * @param request
	 * @param response
	 * @param dataGrid
	 */
	@RequestMapping(params = "datagrid")
	@ResponseBody
	public void datagrid(VideoInfo videoInfo, HttpServletRequest request, HttpServletResponse response,
			DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(VideoInfo.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, videoInfo);
		this.videoManageService.getDataGridReturn(cq, true);
		dataGrid.getResults();
		String domian = bundler.getString("domain");
		for (int i = 0; i < dataGrid.getResults().size(); i++) {
			VideoInfo videoInfoi = (VideoInfo) dataGrid.getResults().get(i);
			videoInfoi.setTestURL(domian + "/video.do?detail&id=" + videoInfoi.getId());
		}
		TagUtil.datagrid(response, dataGrid);
	}

	@RequestMapping(params = "addorUpdate")
	public ModelAndView addorUpdate(String id, ModelMap map) {
		if (!StringUtils.isEmpty(id)) {
			VideoInfo videoInfo = this.videoManageService.get(VideoInfo.class, id);
			map.put("videoInfo", videoInfo);
		}
		return new ModelAndView("weixin/guanjia/video/info", map);
	}

	@RequestMapping(params = "doSave")
	@ResponseBody
	public AjaxJson doSave(VideoInfo videoInfo) {
		AjaxJson j = new AjaxJson();
		if (StringUtils.isEmpty(videoInfo.getId())) {
			this.videoManageService.save(videoInfo);
		} else {
			this.videoManageService.updateEntitie(videoInfo);
		}

		j.setMsg("保存数据成功");
		j.setSuccess(true);
		return j;
	}

	@RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids) {
		AjaxJson j = new AjaxJson();
		try {
			String idArray[] = ids.split(",");
			for (String id : idArray) {
				this.videoManageService.deleteEntityById(VideoInfo.class, id);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			logger.error("occurs Exception:{}", ex);
		}
		j.setMsg("删除数据成功");
		j.setSuccess(true);
		return j;
	}
}
