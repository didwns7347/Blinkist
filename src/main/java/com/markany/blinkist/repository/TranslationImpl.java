package com.markany.blinkist.repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import javax.net.ssl.HttpsURLConnection;
import com.markany.blinkist.dao.Translation;


public class TranslationImpl implements Translation{

	
	@Override//영어로번역
	public String getEnglish(String content) {
		
		String korean = content;
		String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
		String text;
		String result = "";
		String line = "";
		HttpsURLConnection con ;
		try {
			text = URLEncoder.encode(korean, "UTF-8");
			String param = "source=ko&target=en&text=" + text;
			URL url = new URL(apiURL);
			con = (HttpsURLConnection) url.openConnection();
			con.setRequestProperty("X-Naver-Client-Id", "sQj5V2sA1pC88vcyUHV2");
			con.setRequestProperty("X-Naver-Client-Secret", "fhfAb5f4xB");
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setUseCaches(false);
  		    con.setDefaultUseCaches(false);

			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream());
			osw.write(param);
			osw.flush();

			int responseCode = con.getResponseCode();

            // 200코드가 아니면 오류인데 무엇이 오류 인지 디버깅 
			if (responseCode != 200) {
				Map<String, List<String>> map = con.getRequestProperties();
				result += "Printing Response Header...\n";
				for (Map.Entry<String, List<String>> entry : map.entrySet()) {
					if (entry.getKey().equals("apikey")) {
						result += "";
					} else {
						result += "Key : " + entry.getKey() + " ,Value : " + entry.getValue();
					}
				}
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            // 여긴 출력 
			while ((line = br.readLine()) != null) {
				result += line + "\n";
			}
			br.close();

		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("인코딩 실패", e);
		} catch (IOException e) {
			result = e.getMessage();
		} 

		return result;
	}
	
	
	@Override//한국어로번역
	public String getKorean(String content) {
		
		String english = content;
		String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
		String text;
		String result = "";
		String line = "";
		HttpsURLConnection con ;
		try {
			text = URLEncoder.encode(english, "UTF-8");
			String param = "source=en&target=ko&text=" + text;
			URL url = new URL(apiURL);
			con = (HttpsURLConnection) url.openConnection();
			con.setRequestProperty("X-Naver-Client-Id", "sQj5V2sA1pC88vcyUHV2");
			con.setRequestProperty("X-Naver-Client-Secret", "fhfAb5f4xB");
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setUseCaches(false);
  		    con.setDefaultUseCaches(false);

			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream());
			osw.write(param);
			osw.flush();

			int responseCode = con.getResponseCode();

            // 200코드가 아니면 오류인데 무엇이 오류 인지 디버깅 
			if (responseCode != 200) {
				Map<String, List<String>> map = con.getRequestProperties();
				result += "Printing Response Header...\n";
				for (Map.Entry<String, List<String>> entry : map.entrySet()) {
					if (entry.getKey().equals("apikey")) {
						result += "";
					} else {
						result += "Key : " + entry.getKey() + " ,Value : " + entry.getValue();
					}
				}
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            // 여긴 출력 
			while ((line = br.readLine()) != null) {
				result += line + "\n";
			}
			br.close();

		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("인코딩 실패", e);
		} catch (IOException e) {
			result = e.getMessage();
		} 

		return result;
	}
}