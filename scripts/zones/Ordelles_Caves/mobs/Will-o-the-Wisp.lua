-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Will-o-the-Wisp
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,657,2);
end;