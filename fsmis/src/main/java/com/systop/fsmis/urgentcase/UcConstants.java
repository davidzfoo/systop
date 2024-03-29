package com.systop.fsmis.urgentcase;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 应急常量
 * 
 * @author yj
 * 
 */
public final class UcConstants {

	/** 事件状态：未通过 */
	public static final String CASE_STATUS_PASSED = "0";

	/** 事件状态：未派遣 */
	public static final String CASE_STATUS_UNSEND = "1";

	/** 事件状态： 已派遣 */
	public static final String CASE_STATUS_SENDDED = "2";

	/** 事件状态：已处理 */
	public static final String CASE_STATUS_RESOLVEED = "3";

	/** 事件状态：已核实完成 */
	public static final String CASE_STATUS_VERIFYED = "4";

	/** 事件状态：未审核 */
	public static final String CASE_STATUS_UNCHECK = "";
	
	/** 指挥部 */
	public static final String LEADERSHIP = "Leadership";
	
	/** 办公室 */
	public static final String OFFICE = "Office";

	/** 事故调查处理 */
	public static final String ACCIDENT_HANDLE = "AccidentHandle";
	public static final String[] AccidentHandleResult = {"出动人数", "调查报告"};

	/** 善后处理 */
	public static final String AFTER_HANDLE = "AfterHandle";
	public static final String[] AfterHandleResult = {"涉及人员", "安抚进展"};

	/** 警戒保卫 */
	public static final String DEFEND = "Defend";
	public static final String[] DefendResult = {"出警数量", "疏散人数"};

	/** 技术专家 */
	public static final String EXPERT_TECHNOLOGY = "ExpertTechnology";
	public static final String[] ExpertTechnologyResult = {"专家小组", "分析报告"};

	/** 医疗救护 */
	public static final String MEDICAL_RESCUE = "MedicalRescue";
	public static final String[] MedicalRescueResult = {"出动人数", "救护人数","死亡人数", "涉及人数"};

	/** 新闻报道 */
	public static final String NEWS_REPORT = "NewsReport";
	public static final String[] NewsReportResult = {"信息发布数量", "新闻媒体"};

	/** 后勤保障 */
	public static final String REAR_SERVICE = "RearService";
	public static final String[] RearServiceResult = {"出动人数", "划拨物资"};

	/** 接待 */
	public static final String RECEIVE = "Receive";
	public static final String[] ReceiveResult = {"接待事宜", "联络详情"};
	
	public static final String[] PublicResult = {"处理时间", "处理过程", "处理结果"};
	
	
	/** 应急指挥组是否是原始数据 1:是*/
	public static final String GROUP_ORIGINAL_YES = "1";
	/** 前台提交排序时使用*/
	public static final int LENGTH = 2;
	
	/** 应急预案等级 三级*/
	public static final String UC_PLANS_LEVEL_THREE = "III级预案";
	/** 应急预案等级 四级*/
	public static final String UC_PLANS_LEVEL_FOUR = "IV 级预案";
	
	/**
	 * 组类别
	 */
	public static final Map<String, String> GROUP_CATEGORY_MAP = Collections
	    .synchronizedMap(new LinkedHashMap<String, String>());
	static {
		GROUP_CATEGORY_MAP.put(LEADERSHIP, "指挥部");
		GROUP_CATEGORY_MAP.put(OFFICE, "办公室");
		GROUP_CATEGORY_MAP.put(DEFEND, "警戒保卫");
		GROUP_CATEGORY_MAP.put(MEDICAL_RESCUE, "医疗救护");
		GROUP_CATEGORY_MAP.put(AFTER_HANDLE, "善后处理");
		GROUP_CATEGORY_MAP.put(REAR_SERVICE, "后勤保障");
		GROUP_CATEGORY_MAP.put(ACCIDENT_HANDLE, "事故调查处理");
		GROUP_CATEGORY_MAP.put(NEWS_REPORT, "新闻报道");
		GROUP_CATEGORY_MAP.put(EXPERT_TECHNOLOGY, "技术专家");
		GROUP_CATEGORY_MAP.put(RECEIVE, "接待");
	}
	
	/**
	 * 事件状态
	 */
	public static final Map<String, String> UC_STATUS_MAP = Collections
			.synchronizedMap(new LinkedHashMap<String, String>());
	static {
		UC_STATUS_MAP.put(CASE_STATUS_UNCHECK, "<font color='#990099'>未审核</font>");
		UC_STATUS_MAP.put(CASE_STATUS_PASSED, "<font color='red'>未通过</font>");
		UC_STATUS_MAP.put(CASE_STATUS_UNSEND, "<font color='blue'>未派遣</font>");
		UC_STATUS_MAP.put(CASE_STATUS_SENDDED, "<font color='green'>已派遣</font>");
		UC_STATUS_MAP.put(CASE_STATUS_RESOLVEED, "<font color='green'>已处理</font>");
		UC_STATUS_MAP.put(CASE_STATUS_VERIFYED, "<font color='green'>已核实</font>");
	}
}
