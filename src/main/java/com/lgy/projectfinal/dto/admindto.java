package com.lgy.projectfinal.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class admindto {
	private int ad_key;
	private String ad_id;
	private String ad_pwd;
	private String ad_name;
	private int ad_auth;
}
