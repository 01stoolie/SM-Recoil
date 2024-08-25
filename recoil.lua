local recoils = {
	[453432689] = 2.3, -- PISTOL
	[-1075685676] = 2.3, -- PISTOL MK2
	[1593441988] = 2.2, -- COMBAT PISTOL
	[584646201] = 4.0, -- AP PISTOL
	[-1716589765] = 3.0, -- PISTOL .50
	[727643628] = 1.0, -- CERAMIC PISTOL
	[324215364] = 3.0, -- MICRO SMG
	[736523883] = 3.0, -- SMG
	[2024373456] = 3.0, -- SMG MK2
	[-270015777] = 3.0, -- ASSAULT SMG
	[-1074790547] = 2.5, -- ASSAULT RIFLE
	[-86904375] = 2.2, -- ASSAULT RIFLE MK2
	[-2084633992] = 2.15, -- CARBINE RIFLE
	[4208062921] = 2.1, -- CARBINE RIFLE MK2
	[-1357824103] = 2.1, -- ADVANCED RIFLE
	[-1660422300] = 2.1, -- MG
	[2144741730] = 2.1, -- COMBAT MG
	[-608341376] = 2.1, -- COMBAT MG MK2
	[487013001] = 1.4, -- PUMP SHOTGUN
	[1432025498] = 1.35, -- PUMP SHOTGUN MK2
	[2017895192] = 1.7, -- SAWNOFF SHOTGUN
	[-494615257] = 5.2, -- ASSAULT SHOTGUN
	[-1654528753] = 5.2, -- BULLPUP SHOTGUN
	[911657153] = 0.1, -- STUN GUN
	[100416529] = 2.5, -- SNIPER RIFLE
	[205991906] = 6.0, -- HEAVY SNIPER
	[177293209] = 6.0, -- HEAVY SNIPER MK2
	[856002082] = 1.2, -- REMOTE SNIPER
	[2726580491] = 1.0, -- GRENADE LAUNCHER
	[1305664598] = 1.0, -- GRENADE LAUNCHER SMOKE
	[-1312131151] = 5.0, -- RPG
	[1752584910] = 0.0, -- STINGER
	[1119849093] = 2.0, -- MINIGUN
	[-1076751822] = 0.5, -- SNS PISTOL
	[-2009644972] = 0.5, -- SNS PISTOL MK2
	[1627465347] = 2.0, -- GUSENBERG
	[-1063057011] = 2.2, -- SPECIAL CARBINE
	[-1768145561] = 2.15, -- SPECIAL CARBINE MK2
	[-1768145561] = 2.15, -- MILITARY RIFLE
	[-771403250] = 3.0, -- HEAVY PISTOL
	[2132975508] = 5.2, -- BULLPUP RIFLE
	[-2066285827] = 5.15, -- BULLPUP RIFLE MK2
	[137902532] = 5.4, -- VINTAGE PISTOL
	[-1466123874] = 5.7, -- MUSKET
	[984333226] = 2.2, -- HEAVY SHOTGUN
	[-952879014] = 2.3, -- MARKSMAN RIFLE
	[1785463520] = 2.25, -- MARKSMAN RIFLE MK2
	[1672152130] = 0, -- HOMING LAUNCHER
	[1198879012] = 0.9, -- FLARE GUN
	[171789620] = 2.2, -- COMBAT PDW
	[-598887786] = 5.0, -- MARKSMAN PISTOL
	[1834241177] = 2.4, -- RAILGUN
	[-619010992] = 4.0, -- MACHINE PISTOL
	[-1045183535] = 6.6, -- REVOLVER
	[-879347409] = 6.6, -- REVOLVER MK2
	[-1746263880] = 3.0, -- DOUBLE ACTION REVOLVER
	[-1853920116] = 4.0, -- NAVY REVOLVER
	[-1853920116] = 4.0, -- PERICO PISTOL
	[-275439685] = 5.0, -- DOUBLE BARREL SHOTGUN
	[1649403952] = 5.3, -- COMPACT RIFLE
	[317205821] = 6.2, -- AUTO SHOTGUN
	[125959754] = 0.5, -- COMPACT LAUNCHER
	[-1121678507] = 3.0, -- MINI SMG		
}



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
			local _,wep = GetCurrentPedWeapon(PlayerPedId())
			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
			if recoils[wep] and recoils[wep] ~= 0 then
				tv = 0
				if GetFollowPedCamViewMode() ~= 4 then
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						SetGameplayCamRelativePitch(p+0.1, 0.2)
						tv = tv+0.1
					until tv >= recoils[wep]
				else
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						if recoils[wep] > 0.1 then
							SetGameplayCamRelativePitch(p+0.6, 1.2)
							tv = tv+0.6
						else
							SetGameplayCamRelativePitch(p+0.016, 0.333)
							tv = tv+0.1
						end
					until tv >= recoils[wep]
				end
			end
		end
	end
end)
