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
 * 该类中定义了关于密码和上传文件的工具方法
 * @author Administrator
 *
 */
public class CommonUtil {

	private static final char[] HEX = { '0', '1', '2', '3', '4', '5', '6', '7',
			'8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

	/**
	 * 对字符串进行MD5加密,返回密文
	 * @param s
	 * @return
	 */
	public final static String MD5(String s) {
		try {
			byte[] btInput = s.getBytes();
			// 获得MD5摘要算法的 MessageDigest 对象
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			// 使用指定的字节更新摘要
			mdInst.update(btInput);
			// 获得密文
			byte[] md = mdInst.digest();
			// 把密文转换成十六进制的字符串形式
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
	 * 处理上传文件，返回处理后的文件名
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public final static List<String> getUploadFiles(HttpServletRequest request, String childFolder)
			throws Exception {
		// 接收文件域的值
		List<String> list = new ArrayList<String>();
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// 取得当前上传文件的文件名称
					String oldName = file.getOriginalFilename();

					// 如果名称不为"",说明该文件存在，否则说明该文件不存在
					if (oldName.trim() != "") {
						// 取得当前上传文件的扩展名(带.)
						String extName = oldName.substring(oldName
								.lastIndexOf("."));
						// 重命名上传后的文件名,以时间毫秒数命名则不会重名
						String newName = System.currentTimeMillis() + extName;

						// 将图片上传至部署在tomcat中的工程的images文件夹中childFolder指定的子目录
						String path = request.getRealPath(CommonValues.DEFAULT_UPLOAD_PATH) + CommonValues.DEFAULT_SEP + childFolder + CommonValues.DEFAULT_SEP;
						// 定义上传路径
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
	 * 处理上传文件，返回处理后的文件名
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public final static List<String> getUploadFiles(HttpServletRequest request)
			throws Exception {
		// 接收文件域的值
		List<String> list = new ArrayList<String>();
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// 取得当前上传文件的文件名称
					String oldName = file.getOriginalFilename();

					// 如果名称不为"",说明该文件存在，否则说明该文件不存在
					if (oldName.trim() != "") {
						// 取得当前上传文件的扩展名(带.)
						String extName = oldName.substring(oldName
								.lastIndexOf("."));
						// 重命名上传后的文件名,以时间毫秒数命名则不会重名
						String newName = System.currentTimeMillis() + extName;

						// 将图片上传至部署在tomcat中的工程的images文件夹中childFolder指定的子目录
						String path = request.getRealPath(CommonValues.DEFAULT_UPLOAD_PATH) + CommonValues.DEFAULT_SEP + CommonValues.DEFAULT_SEP;
						// 定义上传路径
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
