package model;

public class weatherBean {

	private String cityStr;
	private String countryStr;
	private String cloudsStr;
	private String temp;

	
	//konstruktor
	
	public weatherBean() {}
	
	public weatherBean(String cityStr, String countryStr) {

		this.cityStr = cityStr;
		this.countryStr = countryStr;
		
	}
	
	//getters & Setters
	public String getCityStr() {
		return cityStr;
	}
	
	public void setCityStr(String city) {
		this.cityStr = city;
	}

	public String getCountryStr() {
		return countryStr;
	}
	
	public void setCountryStr(String code) {
		this.countryStr = code;
	}

	public String getCloudsStr() {
		return cloudsStr;
	}

	public void setCloudsStr(String cloudsStr) {
		this.cloudsStr = cloudsStr;
	}
		
	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		float kelvin = Float.parseFloat(temp);
		
		int celsius = Math.round(kelvin) - 273;
		//System.out.println(celsius);
		
		this.temp = String.valueOf(celsius);
		
	}
		
	
}