package com.mall.service;

import com.mall.domain.Barrage;

import java.util.List;

public interface BarrageService {
	Barrage addBarrage(Barrage barrage);
	
	List<Barrage> showBarrages(Integer videoId);
}
