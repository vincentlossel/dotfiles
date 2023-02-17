local tagbar_ok, tagbar = pcall(require, "tagbar")
if not tagbar_ok then
    return
end

tagbar.setup({})
