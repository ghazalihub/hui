local ToolkitAssets = { _instance = nil }
function ToolkitAssets.get_instance()
    if not ToolkitAssets._instance then ToolkitAssets._instance = { assets = {} } end
    return ToolkitAssets._instance
end
return ToolkitAssets
