AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    -- Physics stuff
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )

    -- Init physics only on server, so it doesn't mess up physgun beam
    if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    -- Make prop to fall on spawn
    local phys = self:GetPhysicsObject()
    if ( IsValid( phys ) ) then phys:Wake() end

    self.item = nil
end

function ENT:Use(activator, caller)

    activator.nextItemPickup = activator.nextItemPickup or SysTime()-1

    if(activator.nextItemPickup > SysTime())  then print("pickup denied", activator.nextItemPickup, SysTime()) return end

    activator.nextItemPickup = SysTime()+0.5
    local inventoryItem = inventory.getItem(self.item)
    activator:AddItem(inventoryItem.name)
    self:Remove()
end