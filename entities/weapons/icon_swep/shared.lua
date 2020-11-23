AddCSLuaFile()

if SERVER then
    --AddCSLuaFile("cl_menu.lua")
end

if CLIENT then
    SWEP.PrintName = "Icons"
    SWEP.Slot = 1
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false

    include("cl_menu.lua")
end

SWEP.Author = ""
SWEP.Instructions = "Left to place icon\nRight to choose icon"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IsDarkRPKeys = true

SWEP.WorldModel = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "rpg"

SWEP.UseHands = true

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "Map Sattelite"
SWEP.Sound = ""

SWEP.Primary.Delay = 0.3
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.Delay = 0.3
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
    self:SetHoldType("normal")
end

function SWEP:Deploy()
    if CLIENT or not IsValid(self:GetOwner()) then return true end
    self:GetOwner():DrawWorldModel(false)
    return true
end

function SWEP:Holster()
    return true
end

function SWEP:PreDrawViewModel()
    return true
end

local data = {}

function SWEP:PrimaryAttack()
    if(CLIENT)then return end

    local ply = self:GetOwner()
    local trace = ply:GetEyeTraceNoCursor()
    
    local v = trace.HitPos

    print("Vector(".. v.x .. "," .. v.y .. "," .. v.z .. "), ")

end

function SWEP:SecondaryAttack()
    print("right")
end

function SWEP:Reload()
end
