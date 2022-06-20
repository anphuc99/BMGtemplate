local class = require "modules.class.class"
local entity_model_event = require "modules.Model.Event.entity_model_event"

local model = require "modules.Model.model"

local entity_model = class()

--- @class entity_model_event
local event = entity_model_event:new({
    ENTITY_ENTER = "onEnter",
    ENTITY_TOUCH_PART_BEGIN = "onTouchPartBegin",
    ENTITY_TOUCH_PART_END = "onTouchPartEnd",
    ENTITY_LEAVE = "onLeave",
    ENTITY_BUFF_ADD = "onBuffAdd",
    ENTITY_BUFF_REMOVE = "onBuffRemove",
    ENTITY_HIT_CAST_SKILL = "onHitCastSkill",
    ENTITY_TOUCH = "onTouch",
    ENTITY_CLICK = "onClikc",
    ENTITY_BUY_COMMODITY = "onBuyCommodity",
    ENTITY_DO_ATTACK = "onDoAttack",
    ENTITY_DAMAGE = "onDamage",
    ENTITY_DODAMAGE = "onDoDamage",
    ENTITY_CAN_REBIRTH = "onCanRebirth",
    ENTITY_REBIRTH = "onRebirth",
    ENTITY_BUY_APPSTOP = "onBuyAppStop",
    ENTITY_BUY_RESULT = "onBuyResult",
    ENTITY_TOUCH_ALL = "onTouchAll",
    ENTITY_VP_EMPTY = "onVpEmpty",
    ENTITY_VP_FORBID_SPRINT = "onVpForbidSprint",
    ENTITY_VP_RECOVERY_HP = "onVpRecoveryHp",
    ENTITY_APART = "onApart",
    ENTITY_DIE = "onDie",
    ENTITY_DROP_ITEM = "onDropItem",
    ENTITY_PRE_DAMAGE = "onPreDamage",
    ENTITY_RIDE_OFF = "onRideOff",
    ENTITY_RIDE_ON = "onRideOn",
    ENTITY_TELEPORT = "onTeleport",
    ENTITY_SAVE = "onSave",
    ENTITY_LEVELUP = "onLevelUp",
    ENTITY_STATUS_CHANGE = "onStatusChange",
    ENTITY_GET_PRIVILEGE = "onGetPrivilege",
    ENTITY_SENDSETTLEMENT = "onSendSettLement",
    ENTITY_DEAD_SUMMARY = "onDeadSummary",
    ENTITY_GAMEOVER = "onGameOver",
    ENTITY_RECONNECT = "onReconnect",
    ENTITY_HITTED = "onHitted",
    ENTITY_SECOND_TIMER = "onSecondTimer",
    ENTITY_TOUCHDOWN = "onTouchDown",
    ENTITY_HITTED_BY_RAY = "onHittedByRay",
    ENTITY_START_TOUCH = "onStartTouch",
    ENTITY_STOP_TOUCH = "onStopTouch",
    ENTITY_USE_ITEM = "onUserItem"
})


entity_model:create("entity_model", function()
    ---@class entity_model : model
    local this, super = model:extend()

    function this:__constructor(obj, cfg)
        this.cfg = cfg
        this.objID = obj.objID
        this.Object = obj
        event:add(this)
        event:registerCfg(cfg)
        super:__constructor()
    end

    function this:__destructor()
        event:delete(this)
        this = nil
    end

    function this:onBuyCommodity()
    end

    function this:onApart()
    end

    function this:onBuffRemove()
    end

    function this:onTeleport()
    end

    function this:onEnter()
    end

    function this:onDamage()
    end

    function this:onTouchPartBegin()
    end

    function this:onRebirth()
    end

    function this:onDoAttack()
    end

    function this:onGameOver()
    end

    function this:onBuffAdd()
    end

    function this:onLeave()
    end

    function this:onTouchPartEnd()
    end

    function this:onDie()
    end

    function this:onUserItem()
    end

    function this:onTouch()
    end

    function this:onStatusChange()
    end

    function this:onVpEmpty()
    end

    function this:onStartTouch()
    end

    function this:onRideOn()
    end

    function this:onTouchDown()
    end

    function this:onSecondTimer()
    end

    function this:onTouchAll()
    end

    function this:onCanRebirth()
    end

    function this:onHitted()
    end

    function this:onLevelUp()
    end

    function this:onReconnect()
    end

    function this:onSendSettLement()
    end

    function this:onGetPrivilege()
    end

    function this:onDeadSummary()
    end

    function this:onSave()
    end

    function this:onHittedByRay()
    end

    function this:onDropItem()
    end

    function this:onVpForbidSprint()
    end

    function this:onBuyResult()
    end

    function this:onRideOff()
    end

    function this:onPreDamage()
    end

    function this:onDoDamage()
    end

    function this:onVpRecoveryHp()
    end

    function this:onClikc()
    end

    function this:onBuyAppStop()
    end

    function this:onStopTouch()
    end

    function this:onHitCastSkill()
    end

    return this
end)

return entity_model
