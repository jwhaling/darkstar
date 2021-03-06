-----------------------------------------
-- Spell: Poisonga II
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = EFFECT_POISON;

    local duration = 120;

    local pINT = caster:getStat(MOD_INT);
    local mINT = target:getStat(MOD_INT);

    local dINT = (pINT - mINT);
    local power = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 15 + 1;
    if power > 15 then
        power = 15;
    end

    local params = {};

    params.diff = nil;

    params.attribute = MOD_INT;

    params.skillType = ENFEEBLING_MAGIC_SKILL;

    params.bonus = 0;

    params.effect = effect;

    local resist = applyResistanceEffect(caster, target, spell, params);
    if (resist == 1 or resist == 0.5) then -- effect taken
        duration = duration * resist;

        if (target:addStatusEffect(effect,power,3,duration)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end

    else -- resist entirely.
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end

    return effect;
end;
