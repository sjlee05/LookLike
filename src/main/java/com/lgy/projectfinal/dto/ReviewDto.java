package com.lgy.projectfinal.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDto {
	private int rev_key;
	private String prod_name;
	private String rev_content;
	private String rev_title;
	private String cust_id;
	private String ad_id;
	private String rev_img;
	private String rev_imgpath;
	private String rev_rate;
	private String rev_date;
	
	private int rev_ref;
	private int rev_step;
	private int rev_level;
}
