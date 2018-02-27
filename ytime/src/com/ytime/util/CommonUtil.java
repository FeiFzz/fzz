package com.ytime.util;

import java.io.File;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * �����ж����˹���������ϴ��ļ��Ĺ��߷���
 * @author Administrator
 *
 */
public class CommonUtil {

	private static final char[] HEX = { '0', '1', '2', '3', '4', '5', '6', '7',
			'8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

	/**
	 * ���ַ�������MD5����,��������
	 * @param s
	 * @return
	 */
	public final static String MD5(String s) {
		try {
			byte[] btInput = s.getBytes();
			// ���MD5ժҪ�㷨�� MessageDigest ����
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			// ʹ��ָ�����ֽڸ���ժҪ
			mdInst.update(btInput);
			// �������
			byte[] md = mdInst.digest();
			// ������ת����ʮ�����Ƶ��ַ�����ʽ
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = HEX[byte0 >>> 4 & 0xf];
				str[k++] = HEX[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * �����ϴ��ļ������ش������ļ���
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public final static List<String> getUploadFiles(HttpServletRequest request, String childFolder)
			throws Exception {
		// �����ļ����ֵ
		List<String> list = new ArrayList<String>();
		// ����һ��ͨ�õĶಿ�ֽ�����
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// �ж� request �Ƿ����ļ��ϴ�,���ಿ������
		if (multipartResolver.isMultipart(request)) {
			// ת���ɶಿ��request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// ȡ��request�е������ļ���
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// ȡ���ϴ��ļ�
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// ȡ�õ�ǰ�ϴ��ļ����ļ�����
					String oldName = file.getOriginalFilename();

					// ������Ʋ�Ϊ"",˵�����ļ����ڣ�����˵�����ļ�������
					if (oldName.trim() != "") {
						// ȡ�õ�ǰ�ϴ��ļ�����չ��(��.)
						String extName = oldName.substring(oldName
								.lastIndexOf("."));
						// �������ϴ�����ļ���,��ʱ������������򲻻�����
						String newName = System.currentTimeMillis() + extName;

						// ��ͼƬ�ϴ���������tomcat�еĹ��̵�images�ļ�����childFolderָ������Ŀ¼
						String path = request.getRealPath(CommonValues.DEFAULT_UPLOAD_PATH) + CommonValues.DEFAULT_SEP + childFolder + CommonValues.DEFAULT_SEP;
						// �����ϴ�·��
						File p = new File(path);
						if(!p.exists()){
							p.mkdirs();
						}
						File localFile = new File(p,newName);
						file.transferTo(localFile);

						list.add(newName);

					}
				}

			}
		}
		return list;
	}
	/**
	 * �����ϴ��ļ������ش������ļ���
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public final static List<String> getUploadFiles(HttpServletRequest request)
			throws Exception {
		// �����ļ����ֵ
		List<String> list = new ArrayList<String>();
		// ����һ��ͨ�õĶಿ�ֽ�����
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// �ж� request �Ƿ����ļ��ϴ�,���ಿ������
		if (multipartResolver.isMultipart(request)) {
			// ת���ɶಿ��request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// ȡ��request�е������ļ���
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// ȡ���ϴ��ļ�
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// ȡ�õ�ǰ�ϴ��ļ����ļ�����
					String oldName = file.getOriginalFilename();

					// ������Ʋ�Ϊ"",˵�����ļ����ڣ�����˵�����ļ�������
					if (oldName.trim() != "") {
						// ȡ�õ�ǰ�ϴ��ļ�����չ��(��.)
						String extName = oldName.substring(oldName
								.lastIndexOf("."));
						// �������ϴ�����ļ���,��ʱ������������򲻻�����
						String newName = System.currentTimeMillis() + extName;

						// ��ͼƬ�ϴ���������tomcat�еĹ��̵�images�ļ�����childFolderָ������Ŀ¼
						String path = request.getRealPath(CommonValues.DEFAULT_UPLOAD_PATH) + CommonValues.DEFAULT_SEP + CommonValues.DEFAULT_SEP;
						// �����ϴ�·��
						File p = new File(path);
						if(!p.exists()){
							p.mkdirs();
						}
						File localFile = new File(p,newName);
						file.transferTo(localFile);

						list.add(newName);

					}
				}

			}
		}
		return list;
	}
	// public static void main(String[] args) {
	// System.out.println(MD5("123"));
	// }

}
