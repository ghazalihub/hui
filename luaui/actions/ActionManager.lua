local ActionManager = { _instance = nil }
function ActionManager.get_instance()
    if not ActionManager._instance then ActionManager._instance = { _registeredInputs = {} } end
    return ActionManager._instance
end
return ActionManager
