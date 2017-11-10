
return function(form, uci)
    local location = uci:get_first("gluon-node-info", "location")
    local text =  translate("gluon-config-mode:zip-help")
    
    local s = form:section(Section, nil, text)

    local o = s:option(Value, "zip", translate("ZIP-Code"), translatef("e.g. %s", "70499"))
    o.default = uci:get("gluon-node-info", location, "zip")
    o.datatype = "uinteger"
    o.optional = true
    function o:write(data)
        uci:set("gluon-node-info", location, "zip", data)
    end
    
    return {'gluon-node-info'}
end