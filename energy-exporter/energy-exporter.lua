local component = require("component")
local serialization = require("serialization")

local values = {}
while true do
    values["hostname"] = os.getenv("HOSTNAME")
    values["maxEU"] = component.gt_machine.getEUMaxStored()
    values["currentEU"] = component.gt_machine.getEUStored()
    local serialized = serialization.serialize(values)
    print(serialized)
    component.modem.broadcast(1234, serialized)
    os.sleep(5)
end
