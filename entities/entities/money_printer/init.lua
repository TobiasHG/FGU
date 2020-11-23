AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_c17/consolebox01a.mdl")
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )

    -- Init physics only on server, so it doesn't mess up physgun beam
    if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    -- Make prop to fall on spawn
    local phys = self:GetPhysicsObject()
    if ( IsValid( phys ) ) then phys:Wake() end

end

function ENT:OnRemove()
    if self.sound then
        self.sound:Stop()
    end
end
