package com.myncnc.ncnc.helper;

import lombok.Data;

/*
 * 업로드 된 파일의 정보를 저장하기 위한 JavaBeans
 * - 이 클래스의 자체가 업로드 된 파일의 수 만큼 생성되어 List형태로 보관된다.
 * 
 */
@Data
public class UploadItem {
	private String fieldName;
	private String originName;
	private String filePath;
	private String contentType;
	private long fileSize;
	private String thumbnail;
	
}
