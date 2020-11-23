include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- en liste med player models
local PlayerModels = {

	"models/player/mossman.mdl",
	"models/player/alyx.mdl",
	"models/player/Barney.mdl",
	"models/player/breen.mdl",
	"models/player/Eli.mdl",
	"models/player/Kleiner.mdl",
	"models/player/monk.mdl"

}

function GM:PlayerHurt( player, attacker, hpLeft, damage ) 
     player:ChatPrint( "You are being attacked by: " .. attacker:GetName() )

     print(player)
     print(attacker)
     print("hpLeft "..hpLeft)
     print("damage "..damage)

     player:Kill()
end 

-- alle funktioner som starter med "function GM" 
-- bliver automatisk køre, ved en hændelse.
--
-- en hændelse kan være når spilleren tager skade.

-- funktion køre når spilleren spawner
function GM:PlayerSpawn( ply )

	-- finder tilfældig player model
	local PlayerModel = PlayerModels[ math.random( #PlayerModels ) ]

	-- sætter player model
	ply:SetModel(PlayerModel)

	-- slår hænder til
	ply:SetupHands()

	-- gir default våben
    ply:Give('gmod_camera')
    ply:Give('gmod_tool')
    ply:Give('weapon_physcannon')
    ply:Give('weapon_physgun')

    -- vælger våben til spilleren
    ply:SelectWeapon('weapon_physgun')

    -- sætter om spilleren kan bruge lommelygte eller ej.
    ply:AllowFlashlight( true )
end

-- tilføjer hænder til spilleren.
-- den her funktion skal vi ikke bekymre os om,
-- den skal bare være her..
function GM:PlayerSetHandsModel( ply, ent )

	-- finder navnet på de hænder som passer til spillerens model
	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )

	-- henter hånd data fra den givne model
	local data = player_manager.TranslatePlayerHands( simplemodel )

	-- hvis den har fundet noget data
	if ( data ) then

		-- sætter den rigtige hånd model
		ent:SetModel( data.model )

		-- sætter skin på hænder
		ent:SetSkin( data.skin )

		-- sætter hvilke body group det er
		ent:SetBodyGroups( data.body )
	end 
end
