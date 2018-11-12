package com.tje.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.Type;
import java.util.*;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.tje.model.*;

@Controller
public class JSONController_1 {

	// @ResponseBody 이 적용된 메소드는 해당 메소드의 리턴 문자열이 클라이언트에게 즉시 전달됩니다.
	// (JSP 이동 X)
	@ResponseBody
	@RequestMapping("/viewJson_1")
	public String viewJson_1() {
		// JSON : 인터넷 상에서 데이터를 주고받기 위한 표준 양식
		// 모든 객체를 표현할 수 있는 형태를 가짐
		// 각 객체는 {} 로 표현
		// 각 객체는 멤버를 가질 수 있으며, {} 내부에 멤버를 선언
		// {멤버 1: 멤버1의 값, 멤버2 : 멤버2의 값, ... , 멤버N : 멤버N의 값}
		String jsonData = "{id : \"111\", name : \"AAA\", age : 11}";
		
		return jsonData;
	}

	@ResponseBody
	@RequestMapping("/viewJson_2")
	public String viewJson_2() {
		Gson gson = new Gson();
		
		Member member = new Member();
		member.setId("memberId01");
		member.setPw("12345");
		member.setName("AAA");
		
		// Gson 클래스의 toJson 메소드를 사용하여
		// 객체의 정보를 JSON으로 변환하는 예제
		String jsonData = gson.toJson(member);
		return jsonData;
	}
	
	@ResponseBody
	@RequestMapping("/viewJson_3")
	public String viewJson_3() {
		Gson gson = new Gson();
		String jsonData = "{\"id\":\"AAA\",\"pw\":\"12345\",\"name\":\"BBB\"}";
	
		// Gson 클래스의  fromJson 메소드를 사용하여
		// JSON데이터로부터 객체를 생성하는 예제
		Member member = gson.fromJson(jsonData, Member.class);
		System.out.println(member.getId());
		System.out.println(member.getPw());
		System.out.println(member.getName());
		
		return jsonData;
	}

	@ResponseBody
	@RequestMapping("/viewJson_4")
	public String viewJson_4() {
		Gson gson = new Gson();
		
		ArrayList<Member> list = new ArrayList<>();
		
		for(int i = 1 ; i <= 3 ; i++) {
			Random random = new Random();
			
			Member member = new Member();
			member.setId("id_" + random.nextInt(5000));
			member.setPw("pw_" + random.nextInt(5000));
			member.setName("name_" + random.nextInt(5000));
			
			list.add(member);
		}
		
		String jsonData = gson.toJson(list);
		return jsonData;
	}

	@ResponseBody
	@RequestMapping("/viewJson_5")
	public String viewJson_5() {
		Gson gson = new Gson();
		String jsonData = "[{\"id\":\"id_4867\",\"pw\":\"pw_1948\",\"name\":\"name_687\"},{\"id\":\"id_101\",\"pw\":\"pw_2631\",\"name\":\"name_1126\"},{\"id\":\"id_935\",\"pw\":\"pw_661\",\"name\":\"name_4339\"}]";
		 
		Type type = new TypeToken<ArrayList<Member>>() {}.getType();
		
		ArrayList<Member> list = gson.fromJson(jsonData, type);
		
		for(int i = 0 ; i < 3 ; i++) {
			
			Member member = list.get(i);
			System.out.println(member.getId());
			System.out.println(member.getPw());
			System.out.println(member.getName());
		
		}
		
		return jsonData;
	}
	
}
