$CMakePath = "cmake"
if (-not (Get-Command "cmake" -ErrorAction SilentlyContinue)) {
    $CMakePath = "C:\Program Files\Unity\Hub\Editor\6000.3.11f1\Editor\Data\PlaybackEngines\AndroidPlayer\SDK\cmake\3.22.1\bin\cmake.exe"
}

Write-Host "Building AprilTag DLL for Windows..."
if (-not (Test-Path "build_windows")) {
    mkdir build_windows
}
cd build_windows

if (Test-Path "CMakeCache.txt") { Remove-Item "CMakeCache.txt" -Force }

Write-Host "Running CMake configure..."
& $CMakePath -DBUILD_PYTHON_WRAPPER=OFF -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON ..

if ($LASTEXITCODE -ne 0) {
    Write-Host "
WARNING: It seems the default build tools are not in your PATH." -ForegroundColor Yellow
    Write-Host "Please ensure you have 'Desktop development with C++' installed in Visual Studio." -ForegroundColor Yellow
    Write-Host "Then, open the 'x64 Native Tools Command Prompt for VS', search for \"x64 Native\" in Start menu, navigate here, and run this script again." -ForegroundColor Yellow
    cd ..
    exit 1
}

Write-Host "Running CMake build..."
& $CMakePath --build . --config Release

cd ..
Write-Host "Done! The DLL is located at 'build_windows/Release/apriltag.dll'"
