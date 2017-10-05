package weixin.guanjia.message.service.impl;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import weixin.guanjia.message.entity.VideoInfo;
import weixin.guanjia.message.service.VideoManageService;
@Service("videoManageService")
@Transactional
public class VideoManageServiceImpl extends CommonServiceImpl implements VideoManageService {

	@Override
	public void saveVideoInfo(VideoInfo videoInfo) {

	}

}
