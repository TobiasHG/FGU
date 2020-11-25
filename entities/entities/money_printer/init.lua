AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    model = "models/props_c17/consolebox01a.mdl"
    self:SetModel(model)
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )

    if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    local phys = self:GetPhysicsObject()
    if ( IsValid( phys ) ) then phys:Wake() end

end

function ENT:OnRemove()
    print("remove money printer at pos", self:GetPos())
end
