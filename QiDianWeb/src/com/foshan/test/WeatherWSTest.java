package com.foshan.test;

import com.foshan.weatherWS.ArrayOfString;
import com.foshan.weatherWS.WeatherWS;
import com.foshan.weatherWS.WeatherWSSoap;

public class WeatherWSTest {
	public static void main(String[] args) {
		WeatherWS weatherWS=new WeatherWS();
		WeatherWSSoap weatherWSSoap=weatherWS.getWeatherWSSoap();
		ArrayOfString datas=weatherWSSoap.getWeather("佛山", null);
		System.out.println(datas.getString());
	}
}
