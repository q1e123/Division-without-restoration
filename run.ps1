$modelSimPath = "D:\modelsim\modeltech\win32acoem"

Write-Host "`nCompiling divider_data.vhd..." -ForegroundColor Green
& (Join-Path $modelSimPath "vcom.exe") ./src/divider_data.vhd
Write-Host "`nCompiling divider_control.vhd..." -ForegroundColor Green
& (Join-Path $modelSimPath "vcom.exe") ./src/divider_control.vhd
Write-Host "`nCompiling divider.vhd..." -ForegroundColor Green
& (Join-Path $modelSimPath "vcom.exe") ./src/divider.vhd;
Write-Host "`nCompiling divider_test.vhd..." -ForegroundColor Green
& (Join-Path $modelSimPath "vcom.exe") ./src/divider_test.vhd

$simulationCommand = @"
vlib work
vmap work work
vcom ./src/divider.vhd
vcom ./src/divider_control.vhd
vcom ./src/divider_data.vhd
vcom ./src/divider_test.vhd
vsim -gui -onfinish stop -do "wave.do" work.divider_test
"@


Set-Content -Path "run_simulation.tcl" -Value $simulationCommand

Write-Host "`nRunning simulation..." -ForegroundColor Cyan
& (Join-Path $modelSimPath "vsim.exe") -do "do run_simulation.tcl"
