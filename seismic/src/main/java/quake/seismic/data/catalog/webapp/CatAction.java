package quake.seismic.data.catalog.webapp;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import quake.ProvinceLatlng;
import quake.admin.catalog.model.QuakeCatalog;
import quake.admin.catalog.service.QuakeCatalogManager;
import quake.admin.ds.service.DataSourceManager;
import quake.base.webapp.AbstractQueryAction;
import quake.base.webapp.NumberFormatUtil;
import quake.seismic.SeismicConstants;
import quake.seismic.data.catalog.dao.impl.ExportCatDao;
import quake.seismic.data.catalog.dao.impl.GridCatDao;
import quake.seismic.data.catalog.model.Criteria;
import quake.seismic.data.seed.dao.impl.SeedDao;

import com.systop.core.dao.support.Page;
import com.systop.core.util.DateUtil;

/**
 * 地震目录查询类，提供两种方式的地址目录查询类，包括按矩形和圆形区域查询
 * 震中分布图在Google map地图中显示
 * 地震目录相关数据下载，基本目录格式、完全目录格式、WKF和EQT
 * 震相相关数据下载，观测报告
 * @author DU
 *
 */
@SuppressWarnings({"serial","unchecked"})
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CatAction extends AbstractQueryAction<Criteria> {
  
  private Criteria model = new Criteria();

  /**
   * 用于表格查询的测震DAO
   */
  @Autowired(required = true)
  @Qualifier("gridCatDao")
  private GridCatDao gridCatDao;
  /**
   * 用于表格导出的测震DAO
   */
  @Autowired(required = true)
  @Qualifier("exportCatDao")
  private ExportCatDao exportCatDao;
  
  /**
   * 用于获取Schema
   */
  @Autowired(required = true)
  private DataSourceManager dataSourceManager;

  @Autowired(required = true)
  private QuakeCatalogManager czCatalogManager;
  
  @Autowired
  private ProvinceLatlng provinceLatlng;
  
  @Autowired(required=true)
  private SeedDao seedDao;

  private List<Map> cats = new ArrayList<Map>();
  
  /**
   * 进入地震目录查询页面
   * 根据后台配置的地震目录表名，查询该表中的地震目录数据
   * @return 
   */
  public String index() {
    if (StringUtils.isNotBlank(model.getTableName())) {
      QuakeCatalog czCat = czCatalogManager.queryByCltName(model.getTableName());
      if (czCat == null) {
        addActionError("您选择的地震目录在本系统中不存在.");
      } else {
        model.setTableName(czCat.getCltName());
        model.setMagTname(czCat.getMagTname());
        model.setPhaseTname(czCat.getPhaseTname());
        model.setClcName(czCat.getClcName());
        model.setClDescn(czCat.getClDescn());
        model.setDisType(czCat.getDisType());
      }
    } else {
      addActionError("请选择要查询的地震目录，进行数据查询.");
    }
    return "index";
  }
  /**
   * 显示GIS信息
   * 根据所选查询条件，在Google map上显示震中分布图
   * 将经纬度保留小数点后两位
   * @return
   */
  public String showGis(){
    if (StringUtils.isNotBlank(model.getTableName())) {
      try {
        model.setPage(getPage());
        //测震SCHEMA
        model.setSchema(dataSourceManager.getSeismicSchema());
        model.setSortProperty(getSortProperty());
        model.setSortDir(getSortDir());
        if (model.getStartDate() != null) {
          Date startDate = DateUtil.firstSecondOfDate(model.getStartDate());
          model.setStartDate(startDate);
        }
        if (model.getEndDate() != null) {
          Date endDate = DateUtil.lastSecondOfDate(model.getEndDate());
          model.setEndDate(endDate);
        }
        //地震目录查询_不分页
        List<Map> list = gridCatDao.queryForGis(model);
        logger.debug("显示GIS信息时查询地震目录条数：{}",list.size());
        for(Map map : list) {
          map.put("EPI_LON", NumberFormatUtil.format(map.get("EPI_LON"), 2));
          map.put("EPI_LAT", NumberFormatUtil.format(map.get("EPI_LAT"), 2));
        }
        getRequest().setAttribute("items", list);
      } catch (Exception e) {
        logger.error("数据查询错误{}", e.getMessage());
        e.printStackTrace();
        clean();
      }
    }
    //查找当前省份
    getRequest().setAttribute("currentProvince", provinceLatlng.getCurrentProvince());
    return "quake";
  }
  
  /**
   * 地震目录查询(按圆形区域)
   */
  public String indexRound() {
    //设定按圆形区域查询条件
    model.setIsRoundQuery(SeismicConstants.ROUND_QUERY_YES);
    index();
    return "indexRound";
  }
  
  /**
   * 地震目录查询结果(按圆形区域)
   * @return
   */
  public String listRound() {
    //设定按圆形区域查询条件
    model.setIsRoundQuery(SeismicConstants.ROUND_QUERY_YES);
    list();
    return "listRound";
  }
  
  /**
   * 进入震相查询页面，实际是有震相数据的地震目录查询页
   * 没有EQT与WKF数据下载功能
   * @return
   */
  public String indexPhase() {
    //执行查询，与地震目录完全一样，只是返回的页面不同
    index();
    return "indexPhase";
  }
  
  /**
   * 地震目录查询返回结果
   * @return
   */
  public String listPhase() {
    //执行查询，与地震目录相同
    list();
    return "listPhase";
  }
  
  /**
   * 进入Seed查询页面
   */
  public String indexSeed(){
    index();
    return "indexSeed";
  }

  /**
   * 地震目录查询返回结果集
   * @return
   */
  public String listSeed(){
    list();
    seedDao.seedExists(cats);
    getRequest().setAttribute("items", cats);
    return "listSeed";
  }
  /**
   * 地震目录查询返回结果
   * 按照所选条件分页查询地震目录数据
   * @return
   */
  public String list() {
    if (StringUtils.isNotBlank(model.getTableName())) {
      try {
        model.setPage(getPage());
        //测震SCHEMA
        model.setSchema(dataSourceManager.getSeismicSchema());
        model.setSortProperty(getSortProperty());
        model.setSortDir(getSortDir());
        //limit查询，设定start和size
        int start = Page.start(getPageNo(), getPageSize());
        model.setStart(start);
        model.setSize(getPageSize());
        logger.debug("list方法，开始记录:{},pageSize:{}", start, getPageSize());
        if (model.getStartDate() != null) {
          Date startDate = DateUtil.firstSecondOfDate(model.getStartDate());
          model.setStartDate(startDate);
        }
        if (model.getEndDate() != null) {
          Date endDate = DateUtil.lastSecondOfDate(model.getEndDate());
          model.setEndDate(endDate);
        }
        //查询地震目录
        Page page = gridCatDao.query(model);
        logger.debug("查询出的记录数：{}",page.getData().size());
        getRequest().setAttribute("items", page.getData());
        cats = page.getData(); //供震相、Seed使用的数据
        restorePageData(page.getRows(), getPageSize());
      } catch (Exception e) {
        logger.error("数据查询错误{}", e.getMessage());
        e.printStackTrace();
        clean();
      }
    }
    return "list";
  }

  /**
   * 导出WKF格式数据
   * @return
   */
  public String exportWkf() {
    model.setExpType("WKF");
    String data = exportData();
    String fileName = "attachment;filename=\"WKF_" + getCurrentDate() + ".txt\"";
    getResponse().addHeader("Content-Disposition", fileName);
    render(getResponse(), data, "text/html");
    return null;
  }

  /**
   * 导出EQT格式数据
   * @return
   */
  public String exportEqt() {
    model.setExpType("EQT");
    String data = exportData();
    String fileName = "attachment;filename=\"EQT_" + getCurrentDate() + ".txt\"";
    getResponse().addHeader("Content-Disposition", fileName);
    render(getResponse(), data, "text/html");
    return null;
  }

  /**
   * 导出Q01格式数据
   * @return
   */
  public String exportQ01() {
    model.setExpType("Q01");
    String data = exportData();
    String fileName = "attachment;filename=\"Q01_" + getCurrentDate() + ".txt\"";
    getResponse().addHeader("Content-Disposition", fileName);
    render(getResponse(), data, "text/html");
    return null;
  }
  
  /**
   * 导出BASIC_VLM(基本目录格式)数据
   * @return
   */
  public String exportBasicVlm() {
    //导出数据格式
    model.setExpType(SeismicConstants.Catalog_basic);
    String data = exportVlmData();
    //logger.debug("基本目录格式导出的数据：{}", data);
    String fileName = "attachment;filename=\"BASIC_VLM_" + getCurrentDate() + ".txt\"";
    getResponse().addHeader("Content-Disposition", fileName);
    render(getResponse(), data, "text/html");
    return null;
  }
  
  /**
   * 导出FULL_VLM(完全目录格式)数据
   * @return
   */
  public String exportFullVlm() {
    model.setExpType(SeismicConstants.Catalog_full);
    String data = exportVlmData();
    //logger.debug("完全目录格式导出的数据：{}", data);
    String fileName = "attachment;filename=\"FULL_VLM_" + getCurrentDate() + ".txt\"";
    getResponse().addHeader("Content-Disposition", fileName);
    render(getResponse(), data, "text/html");
    return null;
  }
  
  /**
   * 导出Bulletin_VLM(观测报告)数据
   * @return
   */
  public String exportBulletin() {
    model.setExpType(SeismicConstants.Bulletin_full);
    String data = exportVlmData();
    //logger.debug("观测报告导出的数据：{}", data);
    String fileName = "attachment;filename=\"Bulletin_VLM_" + getCurrentDate() + ".txt\"";
    getResponse().addHeader("Content-Disposition", fileName);
    render(getResponse(), data, "text/html");
    return null;
  }
  
  /**
   * 导出单个震相数据的观测报告
   * @return
   */
  public String exportSingleBulletin() {
    logger.debug("导出单个震相数据时地震目录ID:{}", model.getQcId());
    model.setExpType(SeismicConstants.Bulletin_full);
    String data = "";
    logger.debug("地震目录表名：{}", model.getTableName());
    if (StringUtils.isNotBlank(model.getTableName())) {
      //测震SCHEMA
      model.setSchema(dataSourceManager.getSeismicSchema());
      data = exportCatDao.queryForSingleBulletin(model); 
    }
    //logger.debug("观测报告导出的数据：{}", data);
    String fileName = "attachment;filename=\"SINGLE_Bulletin_VLM_" + model.getQcId() + ".txt\"";
    getResponse().addHeader("Content-Disposition", fileName);
    render(getResponse(), data, "text/html");
    return null;
  }
  
  /**
   * 根据数据格式(WKF和EQT)，导出相应数据
   * @return
   */
  private String exportData() {
    if (StringUtils.isNotBlank(model.getTableName())) {
      //测震SCHEMA
      model.setSchema(dataSourceManager.getSeismicSchema());
      if (model.getStartDate() != null) {
        Date startDate = DateUtil.firstSecondOfDate(model.getStartDate());
        model.setStartDate(startDate);
      }
      if (model.getEndDate() != null) {
        Date endDate = DateUtil.lastSecondOfDate(model.getEndDate());
        model.setEndDate(endDate);
      }
      StringBuffer buf = exportCatDao.query(model);
      return buf.toString();
    } else {
      return null;
    }
  }
  
  /**
   * 根据数据格式(BASIC_VLM,FULL_VLM,Bulletin_VLM)，导出相应数据
   * @return
   */
  private String exportVlmData() {
    if (StringUtils.isNotBlank(model.getTableName())) {
      //测震SCHEMA
      model.setSchema(dataSourceManager.getSeismicSchema());
      if (model.getStartDate() != null) {
        Date startDate = DateUtil.firstSecondOfDate(model.getStartDate());
        model.setStartDate(startDate);
      }
      if (model.getEndDate() != null) {
        Date endDate = DateUtil.lastSecondOfDate(model.getEndDate());
        model.setEndDate(endDate);
      }
      StringBuffer buf = exportCatDao.queryForVlm(model);
      return buf.toString();
    } else {
      return "无数据或检查配置本省台网代码！";
    }
  }

  /**
   * 地震类型
   */
  public Map<String, String> getEqTypesMap() {
    return SeismicConstants.QUERY_EQ_TYPE;
  }
  /**
   * 震相类型
   */
  public Map<String, String> getPhaseTypeMap() {
    return SeismicConstants.PHASE_TYPE_MAP;
  }
  /**
   * 台网代码名称Map
   */
  public Map<String, String> getNetworkInfoMap() {
    return SeismicConstants.NETWORK_INFO;
  }

  /**
   * 返回Network_info表中台网代码名称对应Map，用于页面查询条件的显示。
   */
  public Map<String, String> getNetCodes() {
    Criteria criteria = new Criteria();
    criteria.setSchema(dataSourceManager.getStationSchema());
    
    List<Map> list = gridCatDao.queryNetwordInfo(criteria);
    Map map = new LinkedHashMap();
    for (Map network : list) {
      String netCode = (String) network.get("Net_code");
      logger.debug("取得Network_info表中的台网代码：{}", netCode);
      if (StringUtils.isNotBlank(netCode) 
          && SeismicConstants.NETWORK_INFO.containsKey(netCode)) {
        map.put(netCode, SeismicConstants.NETWORK_INFO.get(netCode));
      }
    }
    return map;
  }
  
  private String getCurrentDate() {
    return DateUtil.getDateTime("yyyyMMddHHmmss", new Date());
  }
  
  @Override
  public Criteria getModel() {
    return model;
  }

  public void setModel(Criteria model) {
    this.model = model;
  }
  
}
