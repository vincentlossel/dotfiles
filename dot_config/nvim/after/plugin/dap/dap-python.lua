local dap_python_ok, dap_python = pcall(require, "dap-python")
if not dap_python_ok then
    return
end

dap_python.setup()

dap_python.test_runner = "pytest"
