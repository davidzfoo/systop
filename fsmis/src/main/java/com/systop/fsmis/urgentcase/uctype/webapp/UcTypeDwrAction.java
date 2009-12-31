package com.systop.fsmis.urgentcase.uctype.webapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.systop.core.webapp.dwr.BaseDwrAjaxAction;
import com.systop.fsmis.model.UrgentType;
import com.systop.fsmis.urgentcase.UcConstants;
import com.systop.fsmis.urgentcase.uctype.service.UcTypeManager;

/**
 * 类别排序
 * 
 * @author yj
 * 
 */
@Component
public class UcTypeDwrAction extends BaseDwrAjaxAction {
	@Autowired(required = true)
	private UcTypeManager ucTypeManager;

	/**
	 * 进行排序操作
	 */
	public String sort(List<String> items) {
		if (items != null && !items.isEmpty()) {
			UrgentType ut = null;
			for (String item : items) {
				String[] id_sort = item.split(":");
				if (id_sort.length == UcConstants.LENGTH) {
					ut = ucTypeManager.get(Integer.valueOf(id_sort[0]));
					ut.setSortId(Integer.valueOf(id_sort[1]));
				} else {
					ut = ucTypeManager.get(Integer.valueOf(id_sort[0]));
					ut.setSortId(null);
					logger.warn(item + ",缺少排序号码.");
				}
				ucTypeManager.save(ut);
			}
		}
		return "success";
	}
}
