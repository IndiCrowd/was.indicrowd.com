package com.indicrowd.band;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.indicrowd.user.model.UserInfo;

@Service
public class BandService {
	
	@Transactional
	public BandInfo generateNewBand(UserInfo userInfo, BandInfo bandInfo){
		bandInfo.persist();
		BandMember bandMember = new BandMember();
		bandMember.setUserInfo(userInfo);
		bandMember.setBandInfo(bandInfo);
		bandMember.setBandRoleType(BandRoleType.findBandRoleType(BandRoleType.BAND_ADMIN));
		bandMember.merge();
		
		List<BandInfo> bandInfoList = userInfo.getUserBand();
		if(bandInfoList == null){
			bandInfoList = new ArrayList<BandInfo>();
		}
		bandInfoList.add(bandInfo);
		
		return bandInfo;
	}
}
