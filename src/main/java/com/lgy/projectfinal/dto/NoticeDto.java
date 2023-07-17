package com.lgy.projectfinal.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDto {
	private int not_key;
	private String ad_id;
	private String not_type;
	private String not_title;
	private String not_img;
	private String not_imgpath;
	private int not_hit;
	private  String not_date;
	private String not_content;
}
