local err, lfs = pcall(require, "lfs")
if not err then lfs = {} end

return {
	["attributes!"] = lfs.attributes,
	["ch-dir!"] = lfs.chdir,
	["lock-dir!"] = lfs.lock_dir,
	["current-dir!"] = lfs.currentdir,
	["dir!"] = lfs.dir,
	["lock!"] = lfs.lock,
	["link!"] = lfs.link,
	["mk-dir!"] = lfs.mkdir,
	["rm-dir!"] = lfs.rmdir,
	["set-mode!"] = lfs.setmode,
	["symlink-attributes!"] = lfs.symlinkattributes,
	["touch!"] = lfs.touch,
	["unlock!"] = lfs.unlock
}
