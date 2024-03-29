package datashare.seismic.station.dao;

import datashare.DataType;
import datashare.base.dao.AbstractDataShareDao;

/**
 * {@link StationDao}的抽象实现类。
 * TODO:继续补充文档...
 * @author DU
 *
 * @param <T> 查询结果的数据类型
 */
@SuppressWarnings("unchecked")
public abstract class AbstractStationDao <T> extends AbstractDataShareDao {

  /**
   * 测震台站查询在IBatis中的statementName
   */
  protected static final String SQL_ID = "cz.queryStation";
  
  /**
   * 测震地震计查询在IBatis中的statementName
   */
  public static final String SQL_INSTR_ID_MYSQL = "cz.queryInstrumentMySQL";
  public static final String SQL_INSTR_ID_ORACLE = "cz.queryInstrumentOracle";
  
  @Override
  protected DataType getDataType() {
    return DataType.SEISMIC;
  }
}
