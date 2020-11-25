include("shared.lua")

function drawRectOutline(x, y, w, h)

	surface.SetDrawColor( Color(0,0,0,255) )

	-- upper
	surface.DrawLine( x, y, x+w, y )

	-- lower
	surface.DrawLine( x, y+h, x+w, y+h )

	-- left
	surface.DrawLine( x, y, x, y+h )

	-- right
	surface.DrawLine( x+w, y, x+w, y+h )

end

function drawRectInfo(value, x, y, color)

	surface.SetDrawColor( 100, 100, 100, 100 )
	surface.DrawRect( x, y, 500, 30 )

	surface.SetDrawColor( color )
	surface.DrawRect( x, y, value*5, 30 )

	--drawRectOutline(x, y, 500, 30)

end

-- tegn på skærmen
function GM:HUDPaint()

	ply = LocalPlayer()

	playerArmor 	= ply:Armor()
	playerHealth 	= ply:Health()
	playerName		= ply:Name()

	width 	= ScrW()
	height 	= ScrH()

	spacing = 35

	-- background
	surface.SetDrawColor( Color(0,0,0,150) )
	surface.DrawRect( 20, height-spacing*4, 520, 190 )
	-- background outline
	drawRectOutline(20, height-spacing*4, 520, 190)

	-- draw name
	draw.DrawText("name: "..playerName, "Trebuchet24", 30, height-spacing*4, Color(255,	255,255,255), TEXT_ALIGN_LEFT)
	
	-- draw money
	draw.DrawText("$5000", 				"Trebuchet24", 30, height-spacing*3, Color(0,100,0,255), TEXT_ALIGN_LEFT)

	-- draw armor info
	drawRectInfo(playerArmor, 30, height-spacing, Color(0,0,255,100))

	-- draw health info
	drawRectInfo(playerHealth, 30, height-spacing*2, Color(255,0,0,100))


end

-- skjul standard HUD
local function HUDShouldDraw(name)
	if name == "CHudHealth" then
		return false
	end

	if name == "CHudBattery" then
		return false
	end

	if name == "CHudAmmo" then
		return false
	end

	if name == "CHudSecondaryAmmo" then
		return false
	end
end
hook.Add("HUDShouldDraw", "How to: HUD Example HUD hider", HUDShouldDraw)

-- third person
-- function MyCalcView(ply, pos, angles, fov)
--     local view = {}

--     view.origin = pos--(angles:Forward()*100)
--     view.angles = angles
--     view.fov = fov
 
--     return view
-- end
-- hook.Add("CalcView", "MyCalcView", MyCalcView)
 
-- hook.Add("ShouldDrawLocalPlayer", "MyHax ShouldDrawLocalPlayer", function(ply)
--         return false
-- end)


--
function dermaTest()

	local window = vgui.Create( "DFrame" )
	window:SetPos( 50,50 )
	window:SetSize( 1000, 900 )
	window:SetTitle( "Testing Derma Stuff" )
	window:MakePopup()

	local button = vgui.Create( "DButton" )
	button:SetParent( window )
	button:SetText( "knap 1" )
	button:SetPos( 25, 50 )
	button:SetSize( 150, 50 )
	button.DoClick = function ()
		local ply = LocalPlayer()
	    chat.AddText( Color( 100, 100, 255 ), ply, Color( 255, 255, 255 ), ": i am gay" )
	end

	local button2 = vgui.Create( "DButton" )
	button2:SetParent( window )
	button2:SetText( "knap 2" )
	button2:SetPos( 25, 105 )
	button2:SetSize( 150, 50 )
	button2.DoClick = function ()
		local ply = LocalPlayer()
	   chat.AddText( Color( 100, 100, 255 ), ply, Color( 255, 255, 255 ), ": i am gay too" )
	end

	local DermaText = vgui.Create( "DTextEntry" )
	DermaText:SetParent(window)
	DermaText:SetPos( 20,200 )
	DermaText:SetTall( 20 )
	DermaText:SetWide( 450 )
	DermaText:SetEnterAllowed( true )
	DermaText.OnEnter = function()
	    Msg("You entered -"..DermaText:GetValue().."-!" ) -- What happens when you press enter
	    DermaPanel:SetVisible( false )
	end

end
concommand.Add('dermaTest', dermaTest)