package weixin.guanjia.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import weixin.guanjia.message.entity.VideoInfo;
import weixin.guanjia.message.service.VideoManageService;

@Controller
@RequestMapping("video")
public class VideoController {
	@Autowired
	private VideoManageService videoManageService;

	@RequestMapping(params = "detail")
	public ModelAndView detail(String id, ModelMap map) {
		VideoInfo videoInfo = videoManageService.get(VideoInfo.class, id);
		map.put("videoInfo", videoInfo);
		return new ModelAndView("weixin/guanjia/video/detail", map);
	}
}
