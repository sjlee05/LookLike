package com.lgy.projectfinal.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaJoinProduct {
	private int qna_key;
	private String prod_name;
	private int cust_id;
	private int ad_id;
	private String qna_title;
	private Timestamp qna_date;
	private String qna_content;
	private String qna_img;
	private String qna_imgPath;
	private int qna_hit;
	private int qna_ref;
	private int qna_step;
	private int qna_level;
}
