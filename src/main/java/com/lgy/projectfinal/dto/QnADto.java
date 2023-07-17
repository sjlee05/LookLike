package com.lgy.projectfinal.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnADto {
	private int qna_key;
	private String prod_name;
	private String qna_content;
	private String qna_title;
	private String qna_img;
	private String qna_imgpath;
	private String qna_rate;
	private int qna_hit;
	private String qna_date;
	private String cust_id;
	private String ad_id;
	
	private int qna_ref;
	private int qna_step;
	private int qna_level;
}
