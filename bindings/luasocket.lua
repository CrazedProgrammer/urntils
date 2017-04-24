local socket = require("socket") or {dns = {}}
local socket_http = require("socket.http") or {}
local socket_ftp = require("socket.ftp") or {}
local socket_smtp = require("socket.smtp") or {}
local socket_url = require("socket.url") or {}
local mime = require("mime") or {}
local ltn12 = require("ltn12") or {filter = {}, pump = {}, sink = {}, source = {}}

return {
	["http/request!"] = socket_http.request,
	
	["ftp/get!"] = socket_ftp.get,
	["ftp/put!"] = socket_ftp.put,

	["smtp/send!"] = socket_smtp.send,
	["smtp/message!"] = socket_smtp.message,

	["url/absolute"] = socket_url.absolute,
	["url/build"] = socket_url.build,
	["url/build-path"] = socket_url.build_path,
	["url/escape"] = socket_url.escape,
	["url/parse"] = socket_url.parse,
	["url/parse-path"] = socket_url.parse_path,
	["url/unescape"] = socket_url.unescape,

	["dns/get-hostname!"] = socket.dns.gethostname,
	["dns/get-addr-info!"] = socket.dns.getaddrinfo,
	["dns/get-name-info!"] = socket.dns.getnameinfo,
	["dns/ip->hostname!"] = socket.dns.tohostname,
	["dns/hostname->ip!"] = socket.dns.toip,

	["bind!"] = socket.bind,
	["connect!"] = socket.connect,
	["-debug"] = socket._DEBUG,
	["newtry"] = socket.newtry,
	["protect"] = socket.protect,
	["select"] = socket.select,
	["sink"] = socket.sink,
	["skip"] = socket.skip,
	["sleep!"] = socket.sleep,
	["source!"] = socket.source,
	["try"] = socket.try,
	["-version"] = socket._VERSION,
	
	["tcp"] = socket.tcp,
	["udp"] = socket.udp,

	["mime/normalize"] = mime.normalize,
	["mime/decode"] = mime.decode,
	["mime/encode"] = mime.encode,
	["mime/stuff"] = mime.stuff,
	["mime/wrap"] = mime.wrap,
	["mime/b64"] = mime.b64,
	["mime/dot"] = mime.dot,
	["mime/eol"] = mime.eol,
	["mime/qp"] = mime.qp,
	["mime/qpwrp"] = mime.qpwrp,
	["mime/unb64"] = mime.unb64,
	["mime/unqp"] = mime.unqp,
	["mime/wrp"] = mime.wrp,

	["ltn12/filter/chain"] = ltn12.filter.chain,
	["ltn12/filter/cycle"] = ltn12.filter.cycle,
	["ltn12/pump/all!"] = ltn12.pump.all,
	["ltn12/pump/step!"] = ltn12.pump.step,
	["ltn12/sink/chain"] = ltn12.sink.chain,
	["ltn12/sink/error"] = ltn12.sink.error,
	["ltn12/sink/file"] = ltn12.sink.file,
	["ltn12/sink/null"] = ltn12.sink.null,
	["ltn12/sink/simplify"] = ltn12.sink.simplify,
	["ltn12/sink/table"] = ltn12.sink.table,
	["ltn12/source/cat"] = ltn12.source.cat,
	["ltn12/source/chain"] = ltn12.source.chain,
	["ltn12/source/empty"] = ltn12.source.empty,
	["ltn12/source/error"] = ltn12.source.error,
	["ltn12/source/file"] = ltn12.source.file,
	["ltn12/source/simplify"] = ltn12.source.simplify,
	["ltn12/source/string"] = ltn12.source.string
}
