package com.systop.fsmis;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.ResourceBundle;

import com.systop.core.util.ResourceBundleUtil;

/**
 * 食品管理常量类
 */
public final class FsConstants {

  /** 私有构造器 */
  private FsConstants() {
  }

  /** 资源文件 */
  private static final String BUNDLE_KEY = "application";

  /** 资源绑定对象 */
  private static final ResourceBundle RESOURCE_BUNDLE = ResourceBundle.getBundle(BUNDLE_KEY);

  /** 性别常量，M-男性 */
  public static final String GENT = "M";

  /** 性别常量，F-女性 */
  public static final String LADY = "F";

  /** 性别常量Map */
  public static final Map<String, String> SEX_MAP = Collections
      .synchronizedMap(new LinkedHashMap<String, String>());
  static {
    SEX_MAP.put(GENT, "男");
    SEX_MAP.put(LADY, "女");
  }

  /** Y-是 */
  public static final String Y = "1";

  /** N-否 */
  public static final String N = "0";

  /** 是否状态Map */
  public static final Map<String, String> YN_MAP = Collections
      .synchronizedMap(new LinkedHashMap<String, String>());
  static {
    YN_MAP.put(Y, "是");
    YN_MAP.put(N, "否");
  }
  
  /** 是否状态Map 带颜色 */
  public static final Map<String, String> YN_COLOR_MAP = Collections
      .synchronizedMap(new LinkedHashMap<String, String>());
  static {
    YN_MAP.put(Y, "<font color='green'>是</font>");
    YN_MAP.put(N, "<font color='red'>否</font>");
  }

  /** 管理员角色 */
  public static final String ROLE_ADMIN = "ROLE_ADMIN";
  
  /** 多体任务附件上传路径 */
  public static final String MULTI_TASL_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
      "multi_task_file_path", "/uploadFiles/multi_task/");
  
  /** 多体任务明细上传路径 */
  public static final String MT_DETAIL_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
      "mt_detail_file_path", "/uploadFiles/mt_detail/");
  
  /** 联合执法任务附件上传路径 */
  public static final String ALLY_TASL_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
      "ally_task_file_path", "/uploadFiles/ally_task/");
  
  /** 联合执法任务明细上传路径 */
  public static final String AL_DETAIL_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
      "al_detail_file_path", "/uploadFiles/al_detail/");
  
  /** 风险评估上传路径 */
  public static final String ASSESSMENT_ATT_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
      "assessment_att_path", "/uploadFiles/assessment/att/");
  
  /** 联合整治任务附件路径 */
  public static final String JOINT_TASK_ATT_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
      "joint_task_att_path", "/uploadFiles/jointtask/att/"); 
  
  /** 联合整治任务明细附件路径 */
  public static final String JOINT_TASK_DETAIL_ATT_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
      "joint_task_detail_att_path", "/uploadFiles/jointtask/detail/att/"); 
  
  /** 任务附件路径 */
  public static final String TASK_ATT_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
      "fscase_task_att_path", "/uploadFiles/task/att/");
  
  /** 通知附件路径 */
  public static final String NOTICE_ATT_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
      "notice_att_path", "/uploadFiles/notice/att/");
  /** 信息员照片上传路径 */
  public static final String SUPERVISOR_PHOTOS_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
      "supervisor_photos_file_path", "/uploadFiles/supervisor/");
  /** 
	 * 企业照片上传路径
	 */
  public static final String COMPANY_PHOTOS_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
      "corp_photos_file_path", "/uploadFiles/corp/");
  
  /** 专家照片上传路径 */
  public static final String EXPERT_PHOTOS_FOLDER = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
	  "expert_photos_file_path", "/uploadFiles/expert/");
  
  /** 专家照片上传路径 */
  public static final String REGION_DEPT_IDS = ResourceBundleUtil.getString(RESOURCE_BUNDLE,
	  "region_dept_ids", "");
  
  /** 禁止上传文件格式 */
	public static final String NOT_ALLOW_UPLOAD = ResourceBundleUtil.getString(
			RESOURCE_BUNDLE, "not_allow_upload", "");

}