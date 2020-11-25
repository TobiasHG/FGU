include("shared.lua")

function ENT:Initialize()
    
end

function ENT:Draw()
    self:DrawModel()

    local Pos = self:GetPos()
    local Ang = self:GetAngles()


    surface.SetFont("Trebuchet24")
    local text = "Money Printer"
    local TextWidth = surface.GetTextSize(text)

    Ang:RotateAroundAxis(Ang:Up(), 90)

    cam.Start3D2D(Pos + Ang:Up() * 11.5, Ang, 0.11)
        draw.WordBox(2, -TextWidth * 0.5, -30, text, "Trebuchet24", Color(0, 0, 0, 100), Color(255, 255, 255, 255))
    cam.End3D2D()
end

function ENT:Think()
end
