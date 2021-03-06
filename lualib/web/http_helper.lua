-- Http 请求 get post
--
local skynet    = require "skynet"
local json      = require "cjson"
local sname     = require "sname"
require "bash"

local M = {}
function M.get(url, get, no_reply)
    --skynet.error("http get:", url, json.encode(get))
    if no_reply then
        return skynet.send(sname.WEB, "lua", "request", url, get, nil, no_reply)
    else
        return skynet.call(sname.WEB, "lua", "request", url, get, nil, no_reply)
    end
end

function M.post(url, post, no_reply)
    --skynet.error("http post:", url, post)
    if no_reply then
        return skynet.send(sname.WEB, "lua", "request", url, nil, post, no_reply)
    else
        return skynet.call(sname.WEB, "lua", "request", url, nil, post, no_reply)
    end
end

function M.url_encoding(tbl)
    local data = {}
    for k, v in pairs(tbl) do
        table.insert(data, string.format("%s=%s", k, v))
    end
    return table.concat(data, "&")
end

return M
