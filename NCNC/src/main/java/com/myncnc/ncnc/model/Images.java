package com.myncnc.ncnc.model;

import lombok.Data;

@Data

public class Images {

	/* 이미지 일련번호(PK키) */
	private int id;

	/* 이미지 파일 원본이름 */
	private String origin_name;

	/* 이미지 저장경로 */
	private String file_path;

	/* 이미지 파일형식 */
	private String content_type;

	/* 이미지 파일 용량 */
	private int file_size;

	/* 이미지 타입 */
	private String img_type;

	/* 등록일시 */
	private String reg_date;

	/* 최종변경일시 */
	private String edit_date;

}
