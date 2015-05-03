-- Lua RedCombat
-- Author: Gedemon
-- DateCreated: 7/20/2011 5:21:31 AM
--------------------------------------------------------------


print("Loading Red Combat functions...")
print("-------------------------------------")

--------------------------------------------------------------
-- Globals
--------------------------------------------------------------
g_DebugCombat = true
g_StartNum = 0
g_EndNum = 0
g_NavalCounterAttack = {}
g_ArtilleryCounterFire = {}
g_OffensiveFirstStrike = {}
g_DefensiveFirstStrike = {}

function SetStartCombatNum()
	local savedData = Modding.OpenSaveData()
	g_StartNum = savedData.GetValue("StartCombatNum") or 0
	g_StartNum = g_StartNum + 1
	savedData.SetValue("StartCombatNum", g_StartNum)
end
function SetEndCombatNum()
	local savedData = Modding.OpenSaveData()
	g_EndNum = savedData.GetValue("EndCombatNum") or 0
	g_EndNum = g_EndNum + 1
	savedData.SetValue("EndCombatNum", g_EndNum)
end


function ResetCombatTracking()
	g_NavalCounterAttack = {}
	g_ArtilleryCounterFire = {}
	g_OffensiveFirstStrike = {}
	g_DefensiveFirstStrike = {}
end

--------------------------------------------------------------
-- Combat Results
--------------------------------------------------------------

function CombatResult (iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP, iInterceptingPlayer, iInterceptingUnit, interceptorDamage, plotX, plotY)

	local pAttackingPlayer = Players[ iAttackingPlayer ]
	if pAttackingPlayer then -- In case the combat was aborted...
		
		SetStartCombatNum()
		local turn = Game.GetGameTurn()
		Dprint("")
		Dprint("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", g_DebugCombat)
		Dprint("COMBAT Started #".. tostring(g_StartNum), g_DebugCombat)
		Dprint("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", g_DebugCombat)

		local pAttackingUnit = pAttackingPlayer:GetUnitByID( iAttackingUnit );		
		Dprint ("Attacking from plot at " .. pAttackingUnit:GetPlot():GetX() .. "," ..pAttackingUnit:GetPlot():GetY(), g_DebugCombat)
		Dprint ("Attacker is " .. tostring(pAttackingUnit:GetName()) .. ", Current Damage = " .. tostring(pAttackingUnit:GetDamage()), g_DebugCombat)

		local pDefendedPlot = GetPlot(plotX, plotY)
		local pDefendingCity
		local defendingPlotKey
		if pDefendedPlot then
			Dprint ("Defending plot at " .. pDefendedPlot:GetX() .. "," ..pDefendedPlot:GetY(), g_DebugCombat)
			pDefendingCity = pDefendedPlot:GetPlotCity()
			defendingPlotKey = GetPlotKey(pDefendedPlot)
		end

		local attackingPlayerName = pAttackingPlayer:GetCivilizationShortDescription()
		local attackingUnitName = pAttackingUnit:GetName() or iAttackingUnit	

		local pDefendingPlayer = Players[iDefendingPlayer]
		local pDefendingUnit = pDefendingPlayer:GetUnitByID( iDefendingUnit )

		local defendingPlayerName = pDefendingPlayer:GetCivilizationShortDescription()
		local defendingUnitName

		local defenderHealth = defenderMaxHP - defenderFinalDamage

		if pDefendingUnit then
			defendingUnitName = pDefendingUnit:GetName() or iDefendingUnit
			Dprint ("Defender is unit : " .. tostring(defendingUnitName).. ", Current Damage = " .. tostring(pDefendingUnit:GetDamage()), g_DebugCombat)

		elseif pDefendingCity then
			defendingUnitName = pDefendingCity:GetName()
			Dprint ("Defender is city of " .. tostring(defendingUnitName), g_DebugCombat)

			-- Check if units need to escape the city
			local bEscapeCity = false
			if defenderHealth <= MIN_HP_LEFT_BEFORE_ESCAPING_CITY and not pAttackingUnit:IsRanged() then
				bEscapeCity = true
			end
			local unitCount = pDefendedPlot:GetNumUnits()
			if unitCount > 0 then 
				Dprint ("List of units in the city : ", bDebug)
			end
			for i = 0, unitCount - 1, 1 do	
    			local testUnit = pDefendedPlot:GetUnit(i)
				if testUnit then
					Dprint("   - unit num" .. i+1 .. " : " .. testUnit:GetName(), bDebug)
				end
			end
			if bEscapeCity then
				EscapeUnitsFromPlot(pDefendedPlot, true, 0, iAttackingPlayer)
			end
		end
		
		local pInterceptingPlayer = Players[iInterceptingPlayer]
		local pInterceptingUnit 
		local interceptingUnitName

		if pInterceptingPlayer then
			Dprint ("Found intercepting player: ".. tostring(pInterceptingPlayer:GetName()), g_DebugCombat)
			pInterceptingUnit = pInterceptingPlayer:GetUnitByID( iInterceptingUnit )
			if pInterceptingUnit then
				interceptingUnitName = pInterceptingUnit:GetName() or pInterceptingUnit:GetID()
				Dprint ("Selected Interceptor is ".. tostring(interceptingUnitName), g_DebugCombat)
			end
		end

		-- determine combat type

		local combatType = MELEE -- default type

		if pAttackingUnit:GetDomainType() == DomainTypes.DOMAIN_AIR then
			if pDefendingUnit and pDefendingUnit:GetDomainType() == DomainTypes.DOMAIN_AIR then -- dogfight !
				Dprint ("Attack type : Dogfight", g_DebugCombat)
				combatType = DOGFIGHT
			elseif pInterceptingUnit then
				if pInterceptingUnit:GetDomainType() == DomainTypes.DOMAIN_AIR then
					combatType = INTERCEPT
				else
					combatType = GRDINTERCEPT
				end
			elseif pDefendingCity then
				combatType = CITYBOMB			
			else			
				combatType = AIRBOMB
			end

		elseif pAttackingUnit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_SUBMARINE.ID ) then
			Dprint ("Attack type : From Submarine", g_DebugCombat)
			combatType = SUBATTACK

		elseif pDefendingUnit and pDefendingUnit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_SUBMARINE.ID ) then
			Dprint ("Attack type : Hunting Submarine", g_DebugCombat)
			combatType = SUBHUNT

		elseif pAttackingUnit:IsRanged() and (pAttackingUnit:GetDomainType() ~= DomainTypes.DOMAIN_AIR) and not (pAttackingUnit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_SUBMARINE.ID )) then		
			Dprint ("Attack type : Ranged", g_DebugCombat)
			combatType = RANGED
		end
		
		-- value for combat logging		
		local AttackerUniqueID, DefenderUniqueID, InterceptorUniqueID, AttackerToDefender, AttackerToInterceptor, DefenderToAttacker, InterceptorToAttacker, AttackerXP, DefenderXP, InterceptorXP
		local AttackerPlayerID, DefenderPlayerID, InterceptorPlayerID, AttackerCivType, DefenderCivType, InterceptorCivType, AttackerUnitType, DefenderUnitType, InterceptorUnitType

		local bCity = ( pDefendingCity ~= nil )
		
		AttackerUnitKey = GetUnitKey(pAttackingUnit)
		AttackerUniqueID = MapModData.RED.UnitData[AttackerUnitKey].UniqueID
		AttackerPlayerID = iAttackingPlayer
		AttackerCivType = GetCivTypeFromPlayerID(iAttackingPlayer)
		AttackerUnitType = GameInfo.Units[pAttackingUnit:GetUnitType()].Type
		
		DefenderPlayerID = iDefendingPlayer
		DefenderCivType = GetCivTypeFromPlayerID(iDefendingPlayer)
		
		if pDefendingUnit then
			DefenderUnitKey = GetUnitKey(pDefendingUnit)
			DefenderUniqueID = MapModData.RED.UnitData[DefenderUnitKey].UniqueID
			DefenderUnitType = GameInfo.Units[pDefendingUnit:GetUnitType()].Type
		end

		if pInterceptingUnit then
			InterceptorUnitKey = GetUnitKey(pInterceptingUnit)
			InterceptorUniqueID = MapModData.RED.UnitData[InterceptorUnitKey].UniqueID
			InterceptorPlayerID = iInterceptingPlayer
			InterceptorCivType = GetCivTypeFromPlayerID(InterceptorPlayerID)
			InterceptorUnitType = GameInfo.Units[pInterceptingUnit:GetUnitType()].Type
			InterceptorToAttacker = interceptorDamage
		end
		
		AttackerToDefender = defenderDamage
		DefenderToAttacker = attackerDamage
		
		-- display combat result
		Dprint("---------------------------------------------------------------------------------------------------------------", g_DebugCombat)
		Dprint ("Combat Started:		" .. Locale.ToUpper(attackingPlayerName) .."		attack			".. Locale.ToUpper(defendingPlayerName), g_DebugCombat);
		Dprint("---------------------------------------------------------------------------------------------------------------", g_DebugCombat)
		Dprint ("Attacking Unit:		" .. attackingUnitName, g_DebugCombat);
		Dprint ("Defending Unit:							".. defendingUnitName, g_DebugCombat);
		-- if interception was made
		if pInterceptingUnit then
			Dprint ("Intercepting Unit:						".. interceptingUnitName, g_DebugCombat);
			Dprint ("From Interceptor:		".. interceptorDamage, g_DebugCombat);
			Dprint ("From Opponent:		".. attackerDamage .."					".. defenderDamage, g_DebugCombat);
		else	
			Dprint ("Receveid Damage:		".. attackerDamage .."					".. defenderDamage, g_DebugCombat);
		end
		Dprint ("Final Damage:		".. attackerFinalDamage .."					"..  defenderFinalDamage, g_DebugCombat);
		if pAttackingUnit:IsRanged() and pAttackingUnit:GetDomainType() ~= DomainTypes.DOMAIN_AIR then -- fix bad leftHP calculation for ranged unit
			Dprint ("HitPoints left:		".. attackerMaxHP - pAttackingUnit:GetDamage() .."					"..  defenderHealth, g_DebugCombat);
		else
			Dprint ("HitPoints left:		".. attackerMaxHP - attackerFinalDamage .."					"..  defenderHealth, g_DebugCombat);
		end
		-- retreat ?
		local bRetreat = false
		local diffDamage = defenderDamage - attackerDamage;
		-- note : aren't ranged units able to do melee attack ? we should test something else...
		if not pAttackingUnit:IsRanged() then
			Dprint("-----------------", g_DebugCombat)

			Dprint (pAttackingUnit:GetName().. " has ".. pAttackingUnit:MovesLeft() .. " moves left.", g_DebugCombat)

			Dprint  ("diffDamage: " .. diffDamage, g_DebugCombat);
			if diffDamage > 0 then				
				local ratioHitPoint = defenderHealth / diffDamage;
				Dprint  ("ratioHitPoint: " .. ratioHitPoint, g_DebugCombat);
				if ratioHitPoint < 5 and defenderHealth > 0 then				
					if pDefendingUnit then -- cities can't retreat...
						if not IsNeverRetreating(pDefendingUnit:GetUnitType()) then
							Dprint ("RETREAT !!!", g_DebugCombat);
							bRetreat = Retreat (iAttackingPlayer, iAttackingUnit, iDefendingPlayer, iDefendingUnit, defenderDamage, 0);
						else
							Dprint ("Retreat ? defender unit says : NEVER !!!", g_DebugCombat);
						end
					end
				end
				if IsLanding(pAttackingUnit) and pDefendingUnit then
					Dprint  ("Attacking unit is landing and push the attack, RETREAT !!!", g_DebugCombat);
					bRetreat = Retreat (iAttackingPlayer, iAttackingUnit, iDefendingPlayer, iDefendingUnit, 0, attackerDamage);
				end
			end
		end

		-- give XP to interceptor
		if pInterceptingUnit and interceptorDamage > 0 then
			Dprint ("-----------------", g_DebugCombat)
			Dprint ("Give XP to " .. interceptingUnitName .. " for intercepting and dealed damage to " .. pAttackingUnit:GetName(), g_DebugCombat);
			pInterceptingUnit:ChangeExperience(EXPERIENCE_INTERCEPTING_UNIT_AIR)
			-- to do: add damage to interceptor ?
		end

		-- update damage in unit table
		MapModData.RED.UnitData[AttackerUnitKey].Damage = attackerFinalDamage

		if pDefendingUnit then
			MapModData.RED.UnitData[DefenderUnitKey].Damage = defenderFinalDamage
		end

		--if pInterceptingUnit then
		--	MapModData.RED.UnitData[InterceptorUnitKey].Damage = attackerFinalDamage
		--end
	
		-- update combatXP for involved units
		AttackerXP = UpdateCombatXP(pAttackingUnit)
		if pDefendingUnit then DefenderXP = UpdateCombatXP(pDefendingUnit) end
		if pInterceptingUnit then InterceptorXP = UpdateCombatXP(pInterceptingUnit) end
		
		Dprint ("-----------------", g_DebugCombat)
		Dprint ("Updating Combat Log...", g_DebugCombat);
		table.insert(MapModData.RED.CombatsLog, {
			Turn = Game.GetGameTurn(), 
			PlotKey = defendingPlotKey,
			CombatType = combatType,
			DefenderIsCity = bCity,
			AttackerUniqueID = AttackerUniqueID,			-- uniqueID from MapModData.RED.UnitData
			DefenderUniqueID = DefenderUniqueID,
			InterceptorUniqueID = InterceptorUniqueID,
			AttackerToDefender = AttackerToDefender,
			AttackerToInterceptor = AttackerToInterceptor,
			DefenderToAttacker = DefenderToAttacker,
			InterceptorToAttacker = InterceptorToAttacker,
			AttackerXP = AttackerXP,
			DefenderXP = DefenderXP,
			InterceptorXP = InterceptorXP,
			AttackerPlayerID = AttackerPlayerID,
			DefenderPlayerID = DefenderPlayerID,
			InterceptorPlayerID = InterceptorPlayerID,
			AttackerCivType = AttackerCivType,			-- string
			DefenderCivType = DefenderCivType,
			InterceptorCivType = InterceptorCivType,
			AttackerUnitType = AttackerUnitType,			-- string
			DefenderUnitType = DefenderUnitType,
			InterceptorUnitType = InterceptorUnitType,
			Retreat = bRetreat,
		})

		local cityMaxDamage = math.floor(defenderMaxHP * MAX_CITY_BOMBARD_DAMAGE / 100)
		if pAttackingUnit:GetDomainType() == DomainTypes.DOMAIN_AIR and pDefendingCity and (defenderFinalDamage > cityMaxDamage) then -- Air attack on city dealing more damage than city max.
			Dprint ("-----------------", g_DebugCombat)
			Dprint ("Damage (" .. defenderFinalDamage ..") dealed to  " .. pDefendingCity:GetName() .. " are superior to  " .. cityMaxDamage .." (".. MAX_CITY_BOMBARD_DAMAGE .. "% of " .. defenderMaxHP .." HP max for city)", g_DebugCombat)
			local diff = defenderFinalDamage - cityMaxDamage -- difference between the max damage allowed to the city via air bombing, and the actual total damage
			local extraDamage = math.min( defenderDamage, diff) -- return the extra damage done by the air bombing from the maximum allowed
			pDefendingCity:ChangeDamage( - extraDamage ) --- restore the extra damage to the city HP
			TransfertDamage( pDefendingCity, extraDamage)
		end

		-- Combat message

		-- Player is attacking ?
		if iAttackingPlayer == Game:GetActivePlayer() then
			Dprint ("- Active player is attacking...", g_DebugCombat)
			Dprint ("- combatType = " ..combatType, g_DebugCombat)

			if combatType == AIRBOMB and pDefendingUnit then
				Dprint ("- Alert text for AIR BOMB...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ATTACK_BY_AIR", pAttackingUnit:GetNameKey(), pDefendingUnit:GetNameKey(), attackerDamage, defenderDamage))
			
			elseif combatType == CITYBOMB then
				Dprint ("- Alert text for AIR BOMB on city...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ATTACK_CITY_BY_AIR", pAttackingUnit:GetNameKey(), pDefendingCity:GetName(), attackerDamage, defenderDamage))
			
			elseif (combatType == INTERCEPT or combatType == GRDINTERCEPT) and pDefendingUnit then
				Dprint ("- Alert text for INTERCEPT...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ATTACK_BY_AIR", pAttackingUnit:GetNameKey(), pDefendingUnit:GetNameKey(), attackerDamage, defenderDamage))
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_AIR_UNIT_HURT", pAttackingUnit:GetNameKey(), pInterceptingUnit:GetNameKey(), interceptorDamage))
			
			elseif (combatType == INTERCEPT or combatType == GRDINTERCEPT) and bCity  then
				Dprint ("- Alert text for INTERCEPT on city attack...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ATTACK_CITY_BY_AIR", pAttackingUnit:GetNameKey(), pDefendingCity:GetName(), attackerDamage, defenderDamage))
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_AIR_UNIT_HURT", pAttackingUnit:GetNameKey(), pInterceptingUnit:GetNameKey(), interceptorDamage))
			
			elseif combatType == RANGED and pDefendingUnit then
				Dprint ("- Alert text for RANGED...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ATTACK_BY_RANGED", pAttackingUnit:GetNameKey(), pDefendingUnit:GetNameKey(), defenderDamage))
			
			elseif combatType == RANGED and not pDefendingUnit and not pDefendingCity  then
				Dprint ("- Alert text for RANGED on unknown city...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ATTACK_UNKNOWN_CITY_BY_RANGED", pAttackingUnit:GetNameKey(), defenderDamage))
						
			elseif combatType == RANGED and pDefendingCity  then
				Dprint ("- Alert text for RANGED on city...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ATTACK_CITY_BY_RANGED", pAttackingUnit:GetNameKey(), pDefendingCity:GetName(), defenderDamage))
			
			elseif bRetreat then
				Dprint ("- Alert text for RETREAT...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ATTACK_RETREAT", pAttackingUnit:GetNameKey(), pDefendingUnit:GetNameKey()))
				--Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ATTACK_RETREAT_FULL", pAttackingUnit:GetNameKey(), defenderDamage, pDefendingUnit:GetNameNoDesc(), attackerDamage))
			end
		end
		-- Player is defending ?
		if iDefendingPlayer == Game:GetActivePlayer() then
			Dprint ("- Active player is defending...", g_DebugCombat)
			Dprint ("- combatType = " ..combatType, g_DebugCombat)

			if combatType == AIRBOMB and pDefendingUnit then
				Dprint ("- Alert text for AIR BOMB...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ARE_ATTACKED_BY_AIR", pAttackingUnit:GetNameKey(), pDefendingUnit:GetNameKey(), attackerDamage, defenderDamage))
			
			elseif combatType == CITYBOMB then
				Dprint ("- Alert text for AIR BOMB on city...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOUR_CITY_ATTACKED_BY_AIR", pAttackingUnit:GetNameKey(), pDefendingCity:GetName(), attackerDamage, defenderDamage))
			

			elseif (combatType == INTERCEPT or combatType == GRDINTERCEPT) and pDefendingUnit  then
				Dprint ("- Alert text for INTERCEPT...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ARE_ATTACKED_BY_AIR", pAttackingUnit:GetNameKey(), pDefendingUnit:GetNameKey(), attackerDamage, defenderDamage))
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_HURT_ENEMY_AIR", pAttackingUnit:GetNameKey(), pInterceptingUnit:GetNameKey(), interceptorDamage))
			
			elseif (combatType == INTERCEPT or combatType == GRDINTERCEPT) and pDefendingCity  then
				Dprint ("- Alert text for INTERCEPT on city attack...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOUR_CITY_ATTACKED_BY_AIR", pAttackingUnit:GetNameKey(), pDefendingCity:GetName(), attackerDamage, defenderDamage))
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_HURT_ENEMY_AIR", pAttackingUnit:GetNameKey(), pInterceptingUnit:GetNameKey(), interceptorDamage))
			
			elseif combatType == RANGED and pDefendingUnit then
				Dprint ("- Alert text for RANGED...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_ARE_ATTACKED_BY_RANGED", pAttackingUnit:GetNameKey(), pDefendingUnit:GetNameKey(), defenderDamage))
			
			elseif combatType == RANGED and not pDefendingUnit and not pDefendingCity then
				Dprint ("- Alert text for RANGED on unknown city...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOUR_UNKNOWN_CITY_ATTACKED_BY_RANGED", pAttackingUnit:GetNameKey(), defenderDamage))
						
			elseif combatType == RANGED and pDefendingCity then
				Dprint ("- Alert text for RANGED on city...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOUR_CITY_ATTACKED_BY_RANGED", pAttackingUnit:GetNameKey(), pDefendingCity:GetName(), defenderDamage))
			
			elseif bRetreat then
				Dprint ("- Alert text for RETREAT...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_RETREAT", pAttackingUnit:GetNameKey(), pDefendingUnit:GetNameKey()))
				--Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_RETREAT_FULL", pAttackingUnit:GetNameKey(), defenderDamage, pDefendingUnit:GetNameNoDesc(), attackerDamage))
			end
		end
	end

	Dprint("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", g_DebugCombat)

end
--GameEvents.CombatResult.Add( CombatResult )

function CombatEnded (iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP, iInterceptingPlayer, iInterceptingUnit, interceptorDamage, plotX, plotY)
	
	local bDebugEndCombat = false

	local pAttackingPlayer = Players[ iAttackingPlayer ]
	if pAttackingPlayer then -- In case the combat was aborted...
		
		SetEndCombatNum()
		local turn = Game.GetGameTurn()

		Dprint("")
		Dprint("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", g_DebugCombat)
		Dprint("COMBAT Ended #".. tostring(g_EndNum), g_DebugCombat)
		Dprint("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", g_DebugCombat)
		
		

		local pAttackingUnit = pAttackingPlayer:GetUnitByID( iAttackingUnit );		
		Dprint ("Attacking from plot at " .. pAttackingUnit:GetPlot():GetX() .. "," ..pAttackingUnit:GetPlot():GetY(), g_DebugCombat)
		Dprint ("Attacker is " .. tostring(pAttackingUnit:GetName()) .. ", Current Damage = " .. tostring(pAttackingUnit:GetDamage()), g_DebugCombat)

		local pDefendedPlot = GetPlot(plotX, plotY)
		local pDefendingCity
		local defendingPlotKey
		if pDefendedPlot then
			Dprint ("Defending plot at " .. pDefendedPlot:GetX() .. "," ..pDefendedPlot:GetY(), g_DebugCombat)
			pDefendingCity = pDefendedPlot:GetPlotCity()
			defendingPlotKey = GetPlotKey(pDefendedPlot)
		end

		local attackingPlayerName = pAttackingPlayer:GetCivilizationShortDescription()
		local attackingUnitName = pAttackingUnit:GetName() or iAttackingUnit	

		local pDefendingPlayer = Players[iDefendingPlayer]
		local pDefendingUnit = pDefendingPlayer:GetUnitByID( iDefendingUnit )

		local defendingPlayerName = pDefendingPlayer:GetCivilizationShortDescription()
		local defendingUnitName

		local defenderHealth = defenderMaxHP - defenderFinalDamage

		if pDefendingUnit then
			defendingUnitName = pDefendingUnit:GetName() or iDefendingUnit
			Dprint ("Defender is unit : " .. tostring(defendingUnitName).. ", Current Damage = " .. tostring(pDefendingUnit:GetDamage()), g_DebugCombat)

		elseif pDefendingCity then
			defendingUnitName = pDefendingCity:GetName()
			Dprint ("Defender is city of " .. tostring(defendingUnitName), g_DebugCombat)
		end
		
		local pInterceptingPlayer = Players[iInterceptingPlayer]
		local pInterceptingUnit 
		local interceptingUnitName

		if pInterceptingPlayer then
			Dprint ("Found intercepting player: ".. tostring(pInterceptingPlayer:GetName()), g_DebugCombat)
			pInterceptingUnit = pInterceptingPlayer:GetUnitByID( iInterceptingUnit )
			if pInterceptingUnit then
				interceptingUnitName = pInterceptingUnit:GetName() or pInterceptingUnit:GetID()
				Dprint ("Selected Interceptor is ".. tostring(interceptingUnitName), g_DebugCombat)
			end
		end

		-- determine combat type

		local combatType = MELEE -- default type

		if pAttackingUnit:GetDomainType() == DomainTypes.DOMAIN_AIR then
			if pDefendingUnit and pDefendingUnit:GetDomainType() == DomainTypes.DOMAIN_AIR then -- dogfight !
				Dprint ("Attack type : Dogfight", g_DebugCombat)
				combatType = DOGFIGHT
			elseif pInterceptingUnit then
				combatType = INTERCEPT
			elseif pDefendingCity then
				combatType = CITYBOMB			
			else			
				combatType = AIRBOMB
			end

		elseif pAttackingUnit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_SUBMARINE.ID ) then
			Dprint ("Attack type : From Submarine", g_DebugCombat)
			combatType = SUBATTACK

		elseif pDefendingUnit and pDefendingUnit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_SUBMARINE.ID ) then
			Dprint ("Attack type : Hunting Submarine", g_DebugCombat)
			combatType = SUBHUNT

		elseif pAttackingUnit:IsRanged() and (pAttackingUnit:GetDomainType() ~= DomainTypes.DOMAIN_AIR) and not (pAttackingUnit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_SUBMARINE.ID )) then		
			Dprint ("Attack type : Ranged", g_DebugCombat)
			combatType = RANGED
		end
		
		-- value for combat logging		
		local AttackerUniqueID, DefenderUniqueID, InterceptorUniqueID, AttackerToDefender, AttackerToInterceptor, DefenderToAttacker, InterceptorToAttacker, AttackerXP, DefenderXP, InterceptorXP
		local AttackerPlayerID, DefenderPlayerID, InterceptorPlayerID, AttackerCivType, DefenderCivType, InterceptorCivType, AttackerUnitType, DefenderUnitType, InterceptorUnitType

		local bCity = ( pDefendingCity ~= nil )
		
		AttackerUnitKey = GetUnitKey(pAttackingUnit)
		AttackerUniqueID = MapModData.RED.UnitData[AttackerUnitKey].UniqueID
		AttackerPlayerID = iAttackingPlayer
		AttackerCivType = GetCivTypeFromPlayerID(iAttackingPlayer)
		AttackerUnitType = GameInfo.Units[pAttackingUnit:GetUnitType()].Type
		
		DefenderPlayerID = iDefendingPlayer
		DefenderCivType = GetCivTypeFromPlayerID(iDefendingPlayer)

		if pDefendingUnit then
			DefenderUnitKey = GetUnitKey(pDefendingUnit)
			DefenderUniqueID = MapModData.RED.UnitData[DefenderUnitKey].UniqueID
			DefenderUnitType = GameInfo.Units[pDefendingUnit:GetUnitType()].Type
		end

		if pInterceptingUnit then
			InterceptorUnitKey = GetUnitKey(pInterceptingUnit)
			InterceptorUniqueID = MapModData.RED.UnitData[InterceptorUnitKey].UniqueID
			InterceptorPlayerID = iInterceptingPlayer
			InterceptorCivType = GetCivTypeFromPlayerID(InterceptorPlayerID)
			InterceptorUnitType = GameInfo.Units[pInterceptingUnit:GetUnitType()].Type
			InterceptorToAttacker = interceptorDamage
		end

		AttackerToDefender = defenderDamage
		DefenderToAttacker = attackerDamage

		-- display combat result
		Dprint("---------------------------------------------------------------------------------------------------------------", bDebugEndCombat)
		Dprint ("Combat Ended:		" .. Locale.ToUpper(attackingPlayerName) .."		attack			".. Locale.ToUpper(defendingPlayerName), bDebugEndCombat);
		Dprint("---------------------------------------------------------------------------------------------------------------", bDebugEndCombat)
		Dprint ("Attacking Unit:		" .. attackingUnitName, bDebugEndCombat);
		Dprint ("Defending Unit:							".. defendingUnitName, bDebugEndCombat);
		-- if interception was made
		if pInterceptingUnit then
			Dprint ("Intercepting Unit:						".. interceptingUnitName, bDebugEndCombat);
			Dprint ("From Interceptor:		".. interceptorDamage, bDebugEndCombat);
			Dprint ("From Opponent:		".. attackerDamage .."					".. defenderDamage, bDebugEndCombat);
		else	
			Dprint ("Receveid Damage:		".. attackerDamage .."					".. defenderDamage, bDebugEndCombat);
		end
		Dprint ("Final Damage:		".. attackerFinalDamage .."					"..  defenderFinalDamage, bDebugEndCombat);
		if pAttackingUnit:IsRanged() and pAttackingUnit:GetDomainType() ~= DomainTypes.DOMAIN_AIR then -- fix bad leftHP calculation for ranged unit
			Dprint ("HitPoints left:		".. attackerMaxHP - pAttackingUnit:GetDamage() .."					"..  defenderHealth, bDebugEndCombat);
		else
			Dprint ("HitPoints left:		".. attackerMaxHP - attackerFinalDamage .."					"..  defenderHealth, bDebugEndCombat);
		end

		-- call OnCityAttacked functions
		if pDefendingCity then

			Dprint("City owner	= " .. pDefendingCity:GetOwner(), g_DebugCombat)
			Dprint("Final damage= " .. defenderFinalDamage, g_DebugCombat)
			Dprint("Attacker ID = " .. iAttackingPlayer, g_DebugCombat)

			Dprint("City has been attacked, calling LuaEvents.OnCityAttacked ...", g_DebugCombat)
			LuaEvents.OnCityAttacked(iAttackingUnit, defendingPlotKey, iAttackingPlayer, iDefendingPlayer)
			
			if defenderFinalDamage >= defenderMaxHP then --pDefendingCity:GetGameTurnAcquired() == turn or  then -- little hack, see if defenderFinalDamage can be used here.
				Dprint("City has been captured, calling LuaEvents.OnCityCaptured ...", g_DebugCombat)
				LuaEvents.OnCityCaptured(iAttackingUnit, defendingPlotKey, iAttackingPlayer, iDefendingPlayer)
			end
		end
	end
	

	Dprint("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", g_DebugCombat)

end
--GameEvents.CombatEnded.Add( CombatEnded )


--------------------------------------------------------------
-- Retreat
--------------------------------------------------------------

function IsLanding (unit)
	-- should be enough now, may have to check unit:LastMissionPlot() if embarked units can attack another sea unit
	return unit:IsEmbarked()
end

function SetDirection (unit, attackDirection)
	local direction_types = {
			DirectionTypes.DIRECTION_NORTHEAST,
			DirectionTypes.DIRECTION_EAST,
			DirectionTypes.DIRECTION_SOUTHEAST,
			DirectionTypes.DIRECTION_SOUTHWEST,
			DirectionTypes.DIRECTION_WEST,
			DirectionTypes.DIRECTION_NORTHWEST
	}
	for loop, direction in ipairs(direction_types) do
	-- compte direction clock, si inf 3 tourne cloc sinon counter
		if unit:GetFacingDirection() == attackDirection then
			return
		else
			unit:RotateFacingDirectionClockwise(1);
		end
	end
end

function GetAttackDirection (attackingPlot, defendingPlot)
	local direction_types = {
			DirectionTypes.DIRECTION_NORTHEAST,
			DirectionTypes.DIRECTION_EAST,
			DirectionTypes.DIRECTION_SOUTHEAST,
			DirectionTypes.DIRECTION_SOUTHWEST,
			DirectionTypes.DIRECTION_WEST,
			DirectionTypes.DIRECTION_NORTHWEST
	}
	local attackX = attackingPlot:GetX();
	local attackY = attackingPlot:GetY();
	--local defendX = defendingPlot:GetX();
	--local defendY = defendingPlot:GetY();
	-- loop through adjacent plots.
	local prevDir = direction_types[6]
	local nextDir = 0 
	for loop, direction in ipairs(direction_types) do
		local adjPlot = Map.PlotDirection(attackX, attackY, direction)
		if adjPlot == defendingPlot then -- bug here : sometimes there's no adjPlot to defending plot...
			nextDir = direction_types[loop+1] or direction_types[1]
			Dprint ("attack direction = " .. direction ..", next = ".. nextDir ..", prev = ".. prevDir, g_DebugCombat);
			return direction, prevDir, nextDir
		end
		prevDir = direction_types[loop]
	end
	Dprint ("WARNING: can find defending plot adjacent to attacker, returning previous direction only: " .. prevDir);
	return prevDir, prevDir, prevDir -- bad bugfix
end

function CanRetreat(unit, retreatPlot)
	if  retreatPlot == nil then
		Dprint ("can't retreat, nil plot", g_DebugCombat);
		return false
	end
	if CanSharePlot(unit, retreatPlot)
	 and unit:MovesLeft() > 0
	 and not retreatPlot:IsImpassable()
	 and not retreatPlot:IsWater()
	 and not retreatPlot:IsCity()
	 --and (unit:CanEnterTerritory() or retreatPlot:GetOwner() == unit:GetOwner()) -- CanEnterTerritory is false for CS units on their own territory ???
	 and AreSameSide( retreatPlot:GetOwner(), unit:GetOwner())
	 then
		return true
	else
		if not CanSharePlot(unit, retreatPlot) then Dprint ("can't retreat, another unit of same type on plot", g_DebugCombat); end
		if unit:MovesLeft() <= 0 then Dprint ("can't retreat, no moves left", g_DebugCombat); end
		if retreatPlot:IsImpassable() then Dprint ("can't retreat, impassable plot", g_DebugCombat); end
		if retreatPlot:IsWater() then Dprint ("can't retreat, water plot", g_DebugCombat); end
		if retreatPlot:IsCity() then Dprint ("can't retreat, city plot", g_DebugCombat); end
		if not unit:CanEnterTerritory() then Dprint ("can't retreat, unit doesn't have right of passage here", g_DebugCombat); end
		return false
	end
end

function Retreat (iAttackingPlayer, iAttackingUnit, iDefendingPlayer, iDefendingUnit, retreatDamageBase, attackerDamageBase)
	local pAttackingUnit = Players[ iAttackingPlayer ]:GetUnitByID( iAttackingUnit );
	local pDefendingUnit = Players[ iDefendingPlayer ]:GetUnitByID( iDefendingUnit );
	-- attackdirection may be wrong. should test from attackingplot and defensiveplot, require a new function ?
	--local attackDirection = pAttackingUnit:GetFacingDirection();
	local attackingPlot = pAttackingUnit:GetPlot();	
	local defendingPlot = pDefendingUnit:GetPlot();
	local firstDirection, secondDirection, thirdDirection = GetAttackDirection (attackingPlot, defendingPlot);
	Dprint ("possible retreat direction = " .. firstDirection ..", ".. secondDirection ..", ".. thirdDirection, g_DebugCombat);
	local defendingX = defendingPlot:GetX();
	local defendingY = defendingPlot:GetY();
	local findPlotToRetreat = false;
	local nextPlot, prevPlot = nil, nil
	local attackDirection, prevDirection, nextDirection = 0, 0, 0
	local firstPlot = Map.PlotDirection(defendingX, defendingY, firstDirection);
	local rand = math.random( 1, 2 )
	if rand == 1 then
		nextPlot = Map.PlotDirection(defendingX, defendingY, secondDirection)
		nextDirection = secondDirection
		prevPlot = Map.PlotDirection(defendingX, defendingY, thirdDirection)
		prevDirection = thirdDirection
	else	
		nextPlot = Map.PlotDirection(defendingX, defendingY, thirdDirection)
		nextDirection = thirdDirection
		prevPlot = Map.PlotDirection(defendingX, defendingY, secondDirection)
		prevDirection = secondDirection
	end
	local retreatPlot = nil
	-- can we retreat here ?
	if CanRetreat(pDefendingUnit, firstPlot) then
		retreatPlot = firstPlot
		findPlotToRetreat = true;
		attackDirection = firstDirection
	elseif CanRetreat(pDefendingUnit, nextPlot) then
		retreatPlot = nextPlot
		findPlotToRetreat = true;
		attackDirection = nextDirection
	elseif CanRetreat(pDefendingUnit, prevPlot) then
		retreatPlot = prevPlot
		findPlotToRetreat = true;
		attackDirection = prevDirection
	end
	if findPlotToRetreat then
		Dprint ("retreating to new plot, attack direction is : ".. attackDirection, g_DebugCombat);
		local retreatX = retreatPlot:GetX();
		local retreatY = retreatPlot:GetY();

		pDefendingUnit:SetXY(retreatX,retreatY);
		pDefendingUnit:SetMoves(pDefendingUnit:MovesLeft() - (MOVE_DENOMINATOR)) -- 1 moves removed

		SetDirection (pDefendingUnit, attackDirection);
		
		pAttackingUnit:SetMoves(pAttackingUnit:MovesLeft() + MOVE_DENOMINATOR) -- allow at least one move
		pAttackingUnit:PopMission()
		pAttackingUnit:PushMission(MissionTypes.MISSION_MOVE_TO, defendingX, defendingY, 0, 0, 1, MissionTypes.MISSION_MOVE_TO, defendingPlot, pDefendingUnit)
		pAttackingUnit:SetMoves(pAttackingUnit:MovesLeft() - MOVE_DENOMINATOR) -- remove free move from above

		return true
	end
	-- if we can't retreat, give extra damage
	if findPlotToRetreat == false then	

		Dprint ("can't retreat !", g_DebugCombat)
		local retreatDamage = Round(retreatDamageBase / 2)
		pDefendingUnit:SetMoves(pDefendingUnit:MovesLeft() - (MOVE_DENOMINATOR)) -- 1 moves removed anyway
		local currentDamage = pDefendingUnit:GetDamage()
		local currentHP = pDefendingUnit:GetCurrHitPoints()
		retreatDamage = math.min(retreatDamage, currentHP-1)
		Dprint ("currentdamage :" .. currentDamage, g_DebugCombat)
		Dprint ("extradamage :" .. retreatDamage, g_DebugCombat)
		pDefendingUnit:SetDamage( currentDamage + retreatDamage)
		if iDefendingPlayer == Game:GetActivePlayer() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_YOU_UNIT_EXTRA_DAMAGE_NO_RETREAT", pDefendingUnit:GetNameKey(), retreatDamage))
		end		
		if iAttackingPlayer == Game:GetActivePlayer() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_YOU_GIVE_EXTRA_DAMAGE_NO_RETREAT", pDefendingUnit:GetNameKey(), retreatDamage))
		end
	elseif attackerDamageBase > 0 then -- the defending unit is retreating, and the attacking unit is marked to take extra damage (example: forcing a retreat when landing)
		Dprint ("Attacker get extra damage from heavy offensive !", g_DebugCombat)
		local attackerDamage = Round(attackerDamageBase * 2)
		local currentDamage = pAttackingUnit:GetDamage()
		local currentHP = pAttackingUnit:GetCurrHitPoints()
		attackerDamage = math.min(attackerDamage, currentHP-1)
		Dprint ("currentdamage :" .. currentDamage, g_DebugCombat)
		Dprint ("extradamage :" .. attackerDamage, g_DebugCombat)
		pAttackingUnit:SetDamage( currentDamage + attackerDamage)
		if iDefendingPlayer == Game:GetActivePlayer() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_YOU_UNIT_GIVE_EXTRA_DAMAGE_FORCED_RETREAT", pDefendingUnit:GetNameKey(), attackerDamage))
		end		
		if iAttackingPlayer == Game:GetActivePlayer() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_YOU_TAKE_EXTRA_DAMAGE_FORCING_RETREAT", pDefendingUnit:GetNameKey(), attackerDamage))
		end

	end

	return false
end 

--------------------------------------------------------------
-- Naval Counter-attack mod by Mylon (edited)
--------------------------------------------------------------

function NavalCounterAttack(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, iAttackingUnitMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, iDefendingUnitMaxHP)

	-- First, let's make sure we're looking at a naval vs naval engagement
	if iAttackingUnit > 0 and iDefendingUnit > 0 then
	
		local AttackingUnit = Players[iAttackingPlayer]:GetUnitByID( iAttackingUnit )
		local DefendingUnit = Players[iDefendingPlayer]:GetUnitByID( iDefendingUnit )

		if (AttackingUnit:GetDomainType() == DomainTypes.DOMAIN_SEA and DefendingUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
			if (AttackingUnit:GetBaseRangedCombatStrength() > 0 
				and DefendingUnit:GetBaseRangedCombatStrength() > 0
				and defenderFinalDamage < iDefendingUnitMaxHP -- defender must be alive to ripost !
				and not AttackingUnit:IsHasPromotion(GameInfo.UnitPromotions.PROMOTION_SUBMARINE.ID) -- submarine does surprise attacks, don't counter
				and not DefendingUnit:IsHasPromotion(GameInfo.UnitPromotions.PROMOTION_SUBMARINE.ID) -- Submarines does not counter-attack, they try to escape
				) then
			
				--We're in business.  Let's launch a counter-attack.
				Dprint("--------------------------", g_DebugCombat)
				Dprint("Counter-attack", g_DebugCombat)
				Dprint("Attacker : " .. AttackingUnit:GetName() , g_DebugCombat)
				Dprint("Defender : " .. DefendingUnit:GetName() , g_DebugCombat)
				-- if not Players[iDefendingPlayer]:IsTurnActive() then -- The defending unit couldn't belong to active turn player, if it is, then we're most likely catching the attacker receiving the counter-attack fire
				if not g_NavalCounterAttack[DefendingUnit] then -- The defending unit couldn't have already attacked
					Dprint("- defender had " .. DefendingUnit:MovesLeft() .. " moves left.", g_DebugCombat)
					local movesLeft = DefendingUnit:MovesLeft() -- save defending unit moves
					g_NavalCounterAttack[AttackingUnit] = true -- mark the attacking unit so it can't counter-attack
					DefendingUnit:SetHasPromotion(GameInfo.UnitPromotions.PROMOTION_RANGED_PENALTY_20.ID, true)
					DefendingUnit:RangeStrike( AttackingUnit:GetX(), AttackingUnit:GetY() )
					--Now that the attack has been made, let's reset the defender's attack flag so it may defend from another attack.
					DefendingUnit:SetMadeAttack(false)
					DefendingUnit:SetHasPromotion(GameInfo.UnitPromotions.PROMOTION_RANGED_PENALTY_20.ID, false)
					DefendingUnit:SetMoves(movesLeft) -- restore defending unit moves

					g_NavalCounterAttack[DefendingUnit] = false -- mark the defending unit so it it may defend from another attack.
				else
					-- Dprint(DefendingUnit:GetName() .. " is in active turn, unable to counter-attack.", g_DebugCombat)
					Dprint("- defender unit " .. DefendingUnit:GetName() .. " had already attacked.", g_DebugCombat)
				end				
				Dprint("--------------------------", g_DebugCombat)			
			end
		end
	end
end
--GameEvents.CombatResult.Add( NavalCounterAttack )


--------------------------------------------------------------
-- Counter-Fire
--------------------------------------------------------------

function CounterFire(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, iAttackingUnitMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, iDefendingUnitMaxHP,  iInterceptingPlayer, iInterceptingUnit, interceptorDamage, plotX, plotY)

	-- First, let's make sure we're looking at a land ranged attack
	if iAttackingUnit > 0 then
		local AttackingUnit = Players[iAttackingPlayer]:GetUnitByID( iAttackingUnit )
		local DefendingUnit = Players[iDefendingPlayer]:GetUnitByID( iDefendingUnit ) -- defending unit can be nil (city), but that shouldn't be a problem for the rest of the function...

		if (AttackingUnit:GetDomainType() == DomainTypes.DOMAIN_LAND and AttackingUnit:IsRanged()) then
			
			local attackerPlot = AttackingUnit:GetPlot()	
			local attX = attackerPlot:GetX()
			local attY = attackerPlot:GetY()

			local plot = GetPlot(plotX, plotY)
			if attackerPlot:IsCity() then -- no counter attack on city...
				return
			end
			local counterFireUnit = GetCounterFireUnit(plot, AttackingUnit)
			if counterFireUnit and ((counterFireUnit ~= DefendingUnit) or (defenderFinalDamage < iDefendingUnitMaxHP)) then -- defender must be alive to ripost !
				--We're in business.  Let's launch a counter-fire.
				Dprint("--------------------------", g_DebugCombat)
				Dprint("Counter-fire", g_DebugCombat)
				Dprint("Attacker : " .. AttackingUnit:GetName() , g_DebugCombat)
				Dprint("Defender : " .. counterFireUnit:GetName() , g_DebugCombat)

				if not g_ArtilleryCounterFire[counterFireUnit] then -- We catch the attacking unit here if it tries to counter-fire against counter-fire...
					Dprint("- Attacker unit had " .. AttackingUnit:MovesLeft() .. " moves left.", g_DebugCombat)
					Dprint("- Defender unit had " .. counterFireUnit:MovesLeft() .. " moves left.", g_DebugCombat)
					local defMovesLeft = counterFireUnit:MovesLeft()	-- save defending unit moves

					-- Send alert messages for human player
					if iAttackingPlayer == Game:GetActivePlayer() then
						Dprint ("- Active player is attacking...", g_DebugCombat)
						Dprint ("- Alert text for Counter Fire...", g_DebugCombat)
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_RECEIVE_COUNTER_FIRE", AttackingUnit:GetNameKey(), counterFireUnit:GetNameKey()))
					end
					if iDefendingPlayer == Game:GetActivePlayer() then
						Dprint ("- Active player is defending...", g_DebugCombat)
						Dprint ("- Alert text for Counter Fire...", g_DebugCombat)
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_USE_COUNTER_FIRE", counterFireUnit:GetNameKey(), AttackingUnit:GetNameKey()))
					end
										
					g_ArtilleryCounterFire[AttackingUnit] = true	-- mark the attacking unit so it can't counter-fire against the counter-fire...
					counterFireUnit:SetMadeAttack(false)			-- Make sure the defender can defend...
					SetTemporaryBestDefender(AttackingUnit)			-- lower all combat value of units on the attacker plot except the attacking unit so it will be the one selected to defend against the counter-fire...										
					counterFireUnit:RangeStrike( attX, attY )		-- Counter-Fire !!!					
					RemoveTemporaryBestDefender(AttackingUnit)		-- restore the normal combat value of all unit on the attacker plot					
					counterFireUnit:SetMadeAttack(false)			-- Now that the attack has been made, let's reset the defender's attack flag so it may defend from another attack.
					counterFireUnit:SetMoves(defMovesLeft)			-- restore defending unit moves
					g_ArtilleryCounterFire[counterFireUnit] = false -- unmark the defending unit so it it may defend from another attack.					
					g_ArtilleryCounterFire[AttackingUnit] = false	-- unmark the attacking unit so it can counter-fire against supporting fire
				else

					Dprint("- ABORT Counter-Fire : defending unit " .. DefendingUnit:GetName() .. " is the initial attacker...", g_DebugCombat)
				end				
				Dprint("--------------------------", g_DebugCombat)			
			end
		end
	end
end
--GameEvents.CombatResult.Add( CounterFire )

function GetCounterFireUnit(plot, AttackingUnit)
	local unitCount = plot:GetNumUnits()
	local counterFireUnit = nil
	for i = 0, unitCount - 1, 1 do	
    	local testUnit = plot:GetUnit(i)
		if testUnit and IsCounterFire(testUnit, AttackingUnit) then
			counterFireUnit = testUnit
		end
	end
	return counterFireUnit
end

function IsCounterFire(unit, AttackingUnit)
	if not unit:IsRanged() then 
		return false
	end
	if unit:IsHasPromotion(PROMOTION_ARTILLERY) or unit:IsHasPromotion(PROMOTION_FORTIFIED_GUN) then
		if unit:CanRangeStrikeAt( AttackingUnit:GetX(), AttackingUnit:GetY() ) then
			return true
		end
	end
	if unit:IsHasPromotion(PROMOTION_FIELD_GUN) and AttackingUnit:IsHasPromotion(PROMOTION_FIELD_GUN) then
		if unit:CanRangeStrikeAt( AttackingUnit:GetX(), AttackingUnit:GetY() ) then
			return true
		end
	end
end

--------------------------------------------------------------
-- First Strike
--------------------------------------------------------------

function TacticalAILaunchUnitAttack(iPlayer, iUnit, x, y)
	local bDebug = true
	local player = Players[iPlayer]
	if not player then
		return
	end
	local unit = player:GetUnitByID(iUnit)
	if unit then
		Dprint ("TacticalAILaunchUnitAttack for " .. tostring(unit:GetName()) .. " of player " .. tostring(player:GetName()) .. " at " .. tostring(x) .. "," .. tostring(y), bDebug)
		FirstStrike(iPlayer, iUnit, x, y)
	end
end
--GameEvents.TacticalAILaunchUnitAttack.Add(TacticalAILaunchUnitAttack)

function PushingMissionTo(iPlayer, iUnit, x, y, iMission)
	local bDebug = true
	-- Don't lose time if it's not a mission that can lead to combat...
	if not (iMission == MissionTypes.MISSION_MOVE_TO or iMission == MissionTypes.MISSION_RANGE_ATTACK or iMission == MissionTypes.MISSION_AIRSTRIKE) then
		return
	end
	local player = Players[iPlayer]
	if not player then
		return
	end
	local unit = player:GetUnitByID(iUnit)
	if unit then
		Dprint ("Pushing Mission (type=".. iMission ..") for " .. tostring(unit:GetName()) .. " of player " .. tostring(player:GetName()) .. " to " .. tostring(x) .. "," .. tostring(y), bDebug)
		local plot = GetPlot(x,y)
		if plot:IsVisibleEnemyDefender(unit) or plot:IsEnemyCity(unit) then
			FirstStrike(iPlayer, iUnit, x, y)
		end
	end
end
--GameEvents.PushingMissionTo.Add(PushingMissionTo)

function FirstStrike(iPlayer, iUnit, x, y, iMission)
	local bDebug = true
	local player = Players[iPlayer]
	local attackingUnit = player:GetUnitByID(iUnit)
	local attackerPlot = attackingUnit:GetPlot()	
	local attX = attackerPlot:GetX()
	local attY = attackerPlot:GetY()
	local defenderPlot = GetPlot(x,y)	

	Dprint ("Check for First Strike before attack of " .. tostring(attackingUnit:GetName()) .. " of player " .. tostring(player:GetName()) .. " against " .. tostring(x) .. "," .. tostring(y), bDebug)

	local offensiveFirstStrikeUnit = nil
	local DefensiveFirstStrikeUnit = nil
	if not attackingUnit:IsRanged() and attackingUnit:GetDomainType() == DomainTypes.DOMAIN_LAND then -- this is a land melee attack
		-- Offensive strike
		offensiveFirstStrikeUnit = GetOffensiveFirstStrikeUnit(attackerPlot)
		if offensiveFirstStrikeUnit and not g_OffensiveFirstStrike[offensiveFirstStrikeUnit] then -- Support one attack per turn
		
			Dprint("--------------------------", g_DebugCombat)
			Dprint("Offensive Support Fire", g_DebugCombat)
			Dprint("Support unit : " .. offensiveFirstStrikeUnit:GetName() , g_DebugCombat)
			Dprint("- Support unit had " .. offensiveFirstStrikeUnit:MovesLeft() .. " moves left.", g_DebugCombat)		
			
			local bestDefender = GetBestDefender(defenderPlot, attackingUnit)	-- try to find which unit the melee unit is attacking

			-- Send alert messages for human player
			if iPlayer == Game:GetActivePlayer() then
				Dprint ("- Active player is attacking...", g_DebugCombat)
				Dprint ("- Alert text for Offensive Support Fire...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_GET_OFFENSIVE_SUPPORT", offensiveFirstStrikeUnit:GetNameKey(), attackingUnit:GetNameKey()))
			end
			if (bestDefender and bestDefender:GetOwner() == Game:GetActivePlayer()) or (defenderPlot:IsCity() and defenderPlot:GetOwner() == Game:GetActivePlayer()) then
				Dprint ("- Active player is defending...", g_DebugCombat)
				Dprint ("- Alert text for Offensive Support Fire...", g_DebugCombat)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_ENEMY_GET_OFFENSIVE_SUPPORT", offensiveFirstStrikeUnit:GetNameKey(), attackingUnit:GetNameKey()))
			end

			local movesLeft = offensiveFirstStrikeUnit:MovesLeft()				-- save unit moves
			local bAttackLeft = not offensiveFirstStrikeUnit:IsOutOfAttacks()	-- save attack state
			offensiveFirstStrikeUnit:SetMoves(MOVE_DENOMINATOR)					-- give one free move for attack
			offensiveFirstStrikeUnit:SetMadeAttack(false)						-- give free attack
			if bestDefender then SetTemporaryBestDefender(bestDefender)	end		-- lower all combat value of units on the attacked plot except the attacked unit (bestDefender) so it will be the one selected to defend against the support-fire...
			offensiveFirstStrikeUnit:RangeStrike( x, y )						-- Supporting Fire !!!			
			if bestDefender then RemoveTemporaryBestDefender(bestDefender)	end	-- restore the normal combat value of all unit on the defended plot
			offensiveFirstStrikeUnit:SetMoves(movesLeft)						-- restore unit moves			
			offensiveFirstStrikeUnit:SetMadeAttack(not bAttackLeft)				-- restore attack state
			g_OffensiveFirstStrike[offensiveFirstStrikeUnit] = true				-- mark this unit to not attack again. To Do : set this in unit global table, use a number, allow multiple support per turn...
			g_ArtilleryCounterFire[offensiveFirstStrikeUnit] = true				-- mark this unit so it can't counter-fire if the defender use counterpreparation (defensive support)...
			
		end

		-- Defensive strike		
		if not attackerPlot:IsCity() then -- no defensive strike against city...

			DefensiveFirstStrikeUnit = GetDefensiveFirstStrikeUnit(defenderPlot, attackingUnit)
			if DefensiveFirstStrikeUnit and not g_DefensiveFirstStrike[DefensiveFirstStrikeUnit] then -- Support one defense per turn
	
				Dprint("--------------------------", g_DebugCombat)
				Dprint("Defensive Support Fire", g_DebugCombat)
				Dprint("Support unit : " .. DefensiveFirstStrikeUnit:GetName() , g_DebugCombat)				
				Dprint("- Support unit had " .. DefensiveFirstStrikeUnit:MovesLeft() .. " moves left.", g_DebugCombat)

				-- Send alert messages for human player
				if iPlayer == Game:GetActivePlayer() then
					Dprint ("- Active player is attacking...", g_DebugCombat)
					Dprint ("- Alert text for Defensive Support Fire...", g_DebugCombat)
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_ENEMY_GET_DEFENSIVE_SUPPORT", DefensiveFirstStrikeUnit:GetNameKey(), attackingUnit:GetNameKey()))
				end
				if DefensiveFirstStrikeUnit:GetOwner() == Game:GetActivePlayer() then
					Dprint ("- Active player is defending...", g_DebugCombat)
					Dprint ("- Alert text for Defensive Support Fire...", g_DebugCombat)
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MISC_YOU_GET_DEFENSIVE_SUPPORT", DefensiveFirstStrikeUnit:GetNameKey(), attackingUnit:GetNameKey()))
				end
			
				local movesLeft = DefensiveFirstStrikeUnit:MovesLeft()				-- save unit moves
				local bNoAttackLeft = DefensiveFirstStrikeUnit:IsOutOfAttacks()		-- save attack status
				DefensiveFirstStrikeUnit:SetHasPromotion(RANGE_BONUS, true)			-- give temporary promotion so that units can strike even when attacking from further away...
				DefensiveFirstStrikeUnit:SetMoves(MOVE_DENOMINATOR)					-- Give one free move for attack
				DefensiveFirstStrikeUnit:SetMadeAttack(false)						-- Make sure it can attack
				SetTemporaryBestDefender(attackingUnit)								-- mark the attacking unit so it will be the one selected to defend against the support-fire...
				DefensiveFirstStrikeUnit:RangeStrike(attX, attY)					-- Supporting-Fire !!!
				RemoveTemporaryBestDefender(attackingUnit)							-- remove the "forced best defender" mark on the attacking unit
				DefensiveFirstStrikeUnit:SetHasPromotion(RANGE_BONUS, false)		-- remove temporary promotion
				DefensiveFirstStrikeUnit:SetMoves(movesLeft)						-- restore unit moves			
				DefensiveFirstStrikeUnit:SetMadeAttack(bNoAttackLeft)				-- restore attack status	

				-- illimited defensive support ?
				--g_DefensiveFirstStrike[DefensiveFirstStrikeUnit] = true -- mark this unit to not attack again. To Do : set this in unit global table, use a number, allow multiple support per turn...
			end
		end
		if offensiveFirstStrikeUnit then
			g_ArtilleryCounterFire[offensiveFirstStrikeUnit] = true	-- unmark this unit so it can counter-fire in next battles...
		end
	end
end

function GetOffensiveFirstStrikeUnit(plot)
	local unitCount = plot:GetNumUnits()
	local firstStrikeUnit = nil
	for i = 0, unitCount - 1, 1 do	
    	local testUnit = plot:GetUnit(i)
		if testUnit and IsOffensiveFirstStrike(testUnit) then
			firstStrikeUnit = testUnit
		end
	end
	return firstStrikeUnit
end

function IsOffensiveFirstStrike(unit)
	if unit:IsMustSetUpToRangedAttack() and not unit:IsSetUpForRangedAttack() then
		return false
	end
	if unit:IsHasPromotion(PROMOTION_ARTILLERY) or unit:IsHasPromotion(PROMOTION_FIELD_GUN) then
		return true
	end
	return false
end

function GetDefensiveFirstStrikeUnit(plot, attackingUnit)
	local unitCount = plot:GetNumUnits()
	local firstStrikeUnit = nil
	for i = 0, unitCount - 1, 1 do	
    	local testUnit = plot:GetUnit(i)
		if testUnit and IsDefensiveFirstStrike(testUnit, attackingUnit) then
			firstStrikeUnit = testUnit
		end
	end
	return firstStrikeUnit
end

function IsDefensiveFirstStrike(unit, attackingUnit)

	Dprint("Testing IsDefensiveFirstStrike for " .. unit:GetName(), g_DebugCombat)
	if unit:IsMustSetUpToRangedAttack() and not unit:IsSetUpForRangedAttack() then
		Dprint("- Not set up for ranged attack !", g_DebugCombat)
		return false
	end
	if unit:IsHasPromotion(PROMOTION_ARTILLERY) or unit:IsHasPromotion(PROMOTION_FIELD_GUN) or unit:IsHasPromotion(PROMOTION_FORTIFIED_GUN) then
		return true
	end
	Dprint("- No promotion detected !", g_DebugCombat)
	if (IsTankDestroyer(unit)) and (GameInfo.UnitCombatInfos[attackingUnit:GetUnitCombatType()].Type == "UNITCOMBAT_ARMOR") then
		return true
	end	
	Dprint("- Not a tank destroyer vs tank !", g_DebugCombat)
	return false
end

--------------------------------------------------------------
-- Notes
--------------------------------------------------------------

-- GameEvents.UnitKilledInCombat.Add (function(iPlayer, iKilledPlayer) end))
