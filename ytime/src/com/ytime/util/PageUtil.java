package com.ytime.util;

/**
 * 该类中定义了与页面分页相关的设置和方法
 * @author Administrator
 *
 */
public class PageUtil {
	
	//每页条目数
	public static final int PAGE_ITEM_COUNT = 5;
	
	/**
	 * 根据记录总数计算最大页码
	 * @param total
	 * @return
	 */
	public static int getMaxPageNumber(int total){
		return total % PAGE_ITEM_COUNT == 0 ? total / PAGE_ITEM_COUNT : total / PAGE_ITEM_COUNT + 1;
	}

}
