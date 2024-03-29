package datashare.admin.czcatalog.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import datashare.DataType;
import datashare.GlobalConstants;
import datashare.admin.ds.service.DataSourceManager;

/**
 * 验证表名称是否存在Dao
 * @author wbb
 */

@Repository
public class ExistTableNameDao {
  /**
   * 用于得到DataSource
   */
  @Autowired(required = true)
  private DataSourceManager dataSourceManager;

  /**
   * @param dataType   数据源类型,取值为{@link GlobalConstants#DATA_CZ}或{@link GlobalConstants#DATA_QZ}
   * @param tableName  判断的表名
   * @return 存在=true
   */
  public boolean exists(DataType dataType, String tableName) {
    DataSource dsi = dataSourceManager.get(dataType);
    if (dsi == null || !dataSourceManager.isDefined()) {
      throw new IllegalStateException("测震和前兆数据源未定义.");
    }
    JdbcTemplate jt = new JdbcTemplate();
    jt.setDataSource(dsi);
    String schema = null;
    if (DataType.SEISMIC.equals(dataType)) {
      schema = dataSourceManager.getCzSchema();
    } else {
      schema = dataSourceManager.getQzSchema();
    }
    StringBuffer sql = new StringBuffer("select * from ")
      .append(schema)
      .append(".")
      .append(tableName).append(" where 1=0");
    try {
      jt.queryForList(sql.toString());
    } catch (DataAccessException e) {
      return false;
    }
    return true;
  }
}
