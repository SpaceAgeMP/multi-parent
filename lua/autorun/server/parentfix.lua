local ENT = FindMetaTable("Entity")

local PARENT_CONSTRAINT = "sb_ent_parent"

duplicator.RegisterEntityModifier(PARENT_CONSTRAINT, function (ply, ent, data)
    print("PP", ent, data.parent)
end)

if not ENT.RealSetParent then
    ENT.RealSetParent = ENT.SetParent
end

function ENT:SetParent(other)
    if self:IsVehicle() then
        return
    end
    duplicator.StoreEntityModifier(self, PARENT_CONSTRAINT, { parent = other })
    self:RealSetParent(other)
end
