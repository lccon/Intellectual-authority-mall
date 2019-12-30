package com.mall.controller;

import com.mall.component.ThreadVariable;
import com.mall.domain.Barrage;
import com.mall.domain.Session;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.impl.BarrageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping ("/barrage")
public class BarrageController {
	@Autowired
	private BarrageServiceImpl barrageService;

	@RequestMapping ("/findId")
	@ResponseBody
	public List<Barrage> showBarrages(@RequestParam ("id") Integer videoId) {
		return barrageService.showBarrages(videoId);
	}

	@RequestMapping ("/add")
	@ResponseBody
	public Barrage addBarrage(Barrage barrage, String token) {
		Session session = ThreadVariable.getSession();
		if(session == null) {
			throw new BusinessValidationException("请重新登录!");
		}
		barrage.setUserId(session.getUserId());
		return barrageService.addBarrage(barrage);
	}
	
}
