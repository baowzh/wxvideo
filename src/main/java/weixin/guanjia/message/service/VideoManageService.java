package weixin.guanjia.message.service;

import org.jeecgframework.core.common.service.CommonService;

import weixin.guanjia.message.entity.VideoInfo;

public interface VideoManageService extends CommonService {
	public void saveVideoInfo(VideoInfo videoInfo);
}
