package com.systop.fsmis.fscase.fscase;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import com.systop.core.test.BaseTransactionalTestCase;
import com.systop.fsmis.fscase.service.FsCaseManager;
import com.systop.fsmis.model.CaseType;
import com.systop.fsmis.model.FsCase;

/**
 * 事件管理测试类
 * @author shaozhiyuan
 *
 */

@ContextConfiguration(locations = { "classpath*:spring/applicationContext-*.xml" })
public class FsCaseManagerTest extends BaseTransactionalTestCase {

	//注入事件manager
	@Autowired
	private FsCaseManager fsCaseManager;
	
	/**
	 * 测试保存事件方法
	 */
	public void testSaveFsCase() {
		//新增类别记录
		FsCase fscase = new FsCase();
		CaseType casetype = new CaseType();
		casetype.setName("测试类型");
		casetype.setDescn("类型描述");
		//新增案件记录
		fscase.setTitle("测试事件");
		fscase.setAddress("测试地址");
		fscase.setBeginDate(new Date());
		fscase.setCaseTime(new Date());
		fscase.setCode("00203005");
		fscase.setDescn("测试描述");
		fscase.setStatus("0");
		fscase.setEndDate(new Date());
		fscase.setClosedTime(new Date());
		fscase.setInformer("测试发布人");
		fscase.setInformerPhone("13685245126");
		fsCaseManager.getDao().save(casetype);
		fscase.setCaseType(casetype);
		fsCaseManager.save(fscase);
		
		assertEquals("测试事件",fsCaseManager.get(fscase.getId()).getTitle());
		
		
		
	}

}
