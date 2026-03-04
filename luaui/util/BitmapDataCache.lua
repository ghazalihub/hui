local BitmapDataCache = { _map = {} }
function BitmapDataCache.get(id) return BitmapDataCache._map[id] end
function BitmapDataCache.set(id, data) BitmapDataCache._map[id] = data end
return BitmapDataCache
