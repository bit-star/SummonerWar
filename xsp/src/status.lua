statusBuilder={};

statusBuilder.dogFood=function(status)
  status.statusList.defeat.statusList.noResurgence={status=false};
  status.statusList.defeat.statusList.again={status=false};
  status.statusList.victory.statusList.again={status=false};
  status.statusList.victory.statusList.sale={status=false};
  status.statusList.saleFiveStarRune={status=false};
end;

statusBuilder.awake=function(status)
  status.statusList.gear.statusList.FinalBossFight={status=false};
  status.statusList.gear.statusList.notBossFight={status=false};
  status.statusList.noResurgence={status=false};
  status.statusList.defeat.statusList.again={status=false};
  status.statusList.victory.statusList.again={status=false};
end;

statusBuilder.runes=function(status)
  status.statusList.gear.statusList.FinalBossFight={status=false};
  status.statusList.gear.statusList.littleBossFight={status=false};
  status.statusList.noResurgence={status=false};
  status.statusList.gear.statusList.notBossFight={status=false};
  status.statusList.defeat.statusList.again={status=false};
  status.statusList.victory.statusList.again={status=false};
  status.statusList.victory.statusList.keepRune={status=false};
  
end;

statusBuilder.tower=function(status)
  status.statusList.gear.statusList.FinalBossFight={status=false};
  status.statusList.gear.statusList.notBossFight={status=false};
  status.statusList.victory.statusList.nextLevel={status=false};
end;

statusBuilder.otherWorld=function(status)
  status.statusList.otherWorldStart={status=false};
  status.statusList.otherWorldVictory={status=false};
  status.statusList.otherWorldComfirmStart={status=false};
  status.statusList.otherWorldGetStone={status=false};
  status.statusList.otherWorldAgain={status=false};
  status.statusList.otherWorldFailed={status=false};
  status.statusList.confirm={status=false};
end;

statusBuilder.threeStarChip=function(status,isBuyEnergy)
  status.statusList={};
  status.statusList.gear={status=false,statusList={}};	
  status.statusList.startFight={status=false};
  if isBuyEnergy then
    status.statusList.notEnoughEnergyBuy={status=false};
  else
    status.statusList.notEnoughEnergyNotBuy={status=false};
  end;
  status.statusList.resendFightInfo={status=false};
  status.statusList.resendFightResult={status=false};
  status.statusList.gear.statusList={autoFight={status=false}};	
  status.statusList.rgbThreeStar={status=false};
  status.statusList.confirm={status=false};
  status.statusList.again={status=false};
end;

initStatus=function(oper,isBuyEnergy)
  local status={};
  --	status.startFight={status=false};
  status.statusList={};
  if oper~="otherWorld" then
    status.statusList.victory={status=false,statusList={}};
    status.statusList.gear={status=false,statusList={}};	
    status.statusList.defeat={status=false,statusList={}};
    status.statusList.startFight={status=false};
    status.statusList.defeat.statusList={rgb={status=false}};
    status.statusList.victory.statusList={rgb={status=false},confirm={status=false}};
    status.statusList.gear.statusList={autoFight={status=false}};	
  end;
  
  if isBuyEnergy then
    status.statusList.notEnoughEnergyBuy={status=false};
  else
    status.statusList.notEnoughEnergyNotBuy={status=false};
  end;
      status.statusList.resendFightInfo={status=false};
  status.statusList.resendFightResult={status=false};
  statusBuilder[oper](status,isBuyEnergy);
  
  return status;
end

getTrueStatus=function(statusList,trueStatusList)
  for k,v in pairs(statusList) do
    if v.status==true then
      trueStatusList[k]=0;
      if v.statusList~=nil then
        getTrueStatus(v.statusList,trueStatusList);
      end;
    end;
  end;
end;