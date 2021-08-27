package com.green.sunny.dto;

public class Com_codVO {
    private String cod_grp_id;
	private String cod;
	private String cod_nm;
	
	public String getCod_grp_id() {
		return cod_grp_id;
	}
	public void setCod_grp_id(String cod_grp_id) {
		this.cod_grp_id = cod_grp_id;
	}
	public String getCod() {
		return cod;
	}
	public void setCod(String cod) {
		this.cod = cod;
	}
	public String getCod_nm() {
		return cod_nm;
	}
	public void setCod_nm(String cod_nm) {
		this.cod_nm = cod_nm;
	}
	@Override
	public String toString() {
		return "Com_codVO [cod_grp_id=" + cod_grp_id + ", cod=" + cod + ", cod_nm=" + cod_nm + "]";
	}
	
	
}
