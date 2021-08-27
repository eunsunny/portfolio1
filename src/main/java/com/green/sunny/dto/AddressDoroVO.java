package com.green.sunny.dto;

public class AddressDoroVO {
	private String zip_num;
	private String sido;
	private String gugun;
	private String doro;
	private String bunji;
	
	public String getZip_num() {
		return zip_num;
	}
	public void setZip_num(String zip_num) {
		this.zip_num = zip_num;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDoro() {
		return doro;
	}
	public void setDoro(String doro) {
		this.doro = doro;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	
	@Override
	public String toString() {
		return "AddressDoroVO [zip_num=" + zip_num + ", sido=" + sido + ", gugun=" + gugun + ", doro=" + doro
				+ ", bunji=" + bunji + "]";
	}
	
	
}
