package com.ytime.util;

/**
 * �����ж�������ҳ���ҳ��ص����úͷ���
 * @author Administrator
 *
 */
public class PageUtil {
	
	//ÿҳ��Ŀ��
	public static final int PAGE_ITEM_COUNT = 5;
	
	/**
	 * ���ݼ�¼�����������ҳ��
	 * @param total
	 * @return
	 */
	public static int getMaxPageNumber(int total){
		return total % PAGE_ITEM_COUNT == 0 ? total / PAGE_ITEM_COUNT : total / PAGE_ITEM_COUNT + 1;
	}

}
