include("shared.lua")

-- tegn på skærmen


function GM:HUDPaint()
	draw.DrawText("Hello World", "Trebuchet24", 50, 20, Color(255,255,255,255), TEXT_ALIGN_LEFT)

	surface.SetDrawColor( 255, 0, 0, 255 )
	surface.DrawLine( 0, 0, 500, 100 )
end


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
concommand.Add('store_patter', dermaTest)