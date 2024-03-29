package com.systop.cms.webview.service;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;

import com.systop.cms.CmsConstants;
import com.systop.cms.model.Catalogs;
import com.systop.core.service.BaseGenericsManager;

/**
 * @author lunch
 */
@Service
public class CatalogFreeMarkerManager extends BaseGenericsManager<Catalogs> {

  /***/
  public Catalogs getCatByName(String name) {
    List<Catalogs> list = query("from Catalogs c where c.name=?", name);
    if (list == null || list.isEmpty()) {
      return null;
    }
    return list.get(0);
  }
  /**
   * 得到指定栏目名称的子栏目
   * @param name 栏目名称
   * @return list
   */
  public List<Catalogs> getSubCatsByName(String name) {
    String hql = "from Catalogs c where c.parentCatalog.name=?" 
      + "and showOnParlist=?" 
      + "order by orderId";
    List<Catalogs> list = query(hql, new Object[]{name, CmsConstants.Y});
    return list;
  }
  
  /**
   * 根据开始结束位置获得对应数量的栏目。常在编辑主页列表时使用
   * @param start 开始位置
   * @param end 结束位置
   * @return
   */
  @SuppressWarnings("unchecked")
  public List<Catalogs> getRoot(int start, int end) {
    String hql = "from Catalogs c where c.parentCatalog is null and c.isEnable = ? and c.showOnIndex = ? and c.showOnTop = ?"
        + "order by orderId";
    List<Catalogs> list = query(hql, new Object[]{CmsConstants.Y, CmsConstants.Y, CmsConstants.Y});
    
    if (list == null || list.isEmpty() || (list.size() - 1) < start) {
      return Collections.EMPTY_LIST;
    }
    
    if (list.size() < end) {
      end = list.size();
    }
    return list.subList(start, end);
  }
  
  /**
   * 得到指定栏目的子栏目
   * @param catalogId 栏目ID
   * @return list
   */
  public List<Catalogs> getSubCatsById(int catalogId) {
    String hql = "from Catalogs c where c.parentCatalog.id=?" 
      + "and showOnParlist=?" 
      + "order by orderId";
    List<Catalogs> list = query(hql, new Object[]{catalogId, CmsConstants.Y});
    return list;
  }
  
  /**
   * 判断是否以http://开始
   * @param url
   * @return
   */
  public boolean isStartHttp(String url){
    return url.startsWith("http://");
  }
  
}
