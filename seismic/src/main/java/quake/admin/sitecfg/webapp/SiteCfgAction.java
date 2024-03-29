package quake.admin.sitecfg.webapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import quake.admin.catalog.model.QuakeCatalog;
import quake.admin.catalog.service.QuakeCatalogManager;
import quake.admin.sitecfg.SiteConstants;
import quake.admin.sitecfg.model.SiteCfg;
import quake.admin.sitecfg.service.SiteCfgManager;

import com.systop.core.webapp.struts2.action.DefaultCrudAction;


/**
 * 网站配置管理action
 * @author DU
 */
@SuppressWarnings("serial")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class SiteCfgAction extends DefaultCrudAction<SiteCfg, SiteCfgManager> {
  @Autowired(required = true)
  private QuakeCatalogManager czCatalogManager;
  @Override
  public String index() {
    setModel(getManager().getCmsConfig());
    return SUCCESS;
  }

  public String save(){
    try{
      getManager().getDao().clear();
      getManager().save(getModel());
      SiteConstants.changeValue(getModel());
      addActionMessage("站点基本信息已成功修改。");
      return SUCCESS;
    }catch(Exception e){
      addActionError(e.getMessage());
      return INPUT;
    }
  }
  /**
   * 得到所有地震目录
   * @return
   */
  public List<QuakeCatalog> getAllCzCat() {
    return czCatalogManager.get();
  }
}
