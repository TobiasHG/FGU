--Static Vars
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Money Printer"
ENT.Author = "DarkRP Developers"
ENT.Spawnable = true
ENT.sparking = false
ENT.IsMoneyPrinter = true

function ENT:initVars()
    self.model = "models/props_c17/consolebox01a.mdl"
    self.damage = 100
    self.DisplayName = "Money Printer"
    self.MinTimer = 100
    self.MaxTimer = 350
end

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "price")
    self:NetworkVar("Entity", 0, "owning_ent")
end