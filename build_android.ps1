# Build script for Android

param(
    [string]$NdKPath = $env:ANDROID_NDK_HOME,
    [string]$BuildType = "Release"
)

if (-not $NdKPath) {
    Write-Error "ANDROID_NDK_HOME environment variable is not set. Please provide the NDK path."
    exit 1
}

$CMakePath = "C:\Program Files\Unity\Hub\Editor\6000.3.11f1\Editor\Data\PlaybackEngines\AndroidPlayer\SDK\cmake\3.22.1\bin\cmake.exe"
$NinjaPath = "C:\Program Files\Unity\Hub\Editor\6000.3.11f1\Editor\Data\PlaybackEngines\AndroidPlayer\SDK\cmake\3.22.1\bin\ninja.exe"

Write-Host "Building AprilTag for Android (Build Type: $BuildType)..."
Write-Host "NDK Path: $NdKPath"

if (-not (Test-Path "build_android")) {
    mkdir build_android
}
cd build_android

# Clean previous build attempt just in case
if (Test-Path "CMakeCache.txt") { Remove-Item "CMakeCache.txt" }

& $CMakePath -G "Ninja" "-DCMAKE_MAKE_PROGRAM=$NinjaPath" "-DCMAKE_TOOLCHAIN_FILE=$NdKPath/build/cmake/android.toolchain.cmake" "-DANDROID_ABI=arm64-v8a" "-DANDROID_PLATFORM=android-21" "-DBUILD_PYTHON_WRAPPER=OFF" "-DCMAKE_BUILD_TYPE=$BuildType" ..
& $CMakePath --build .
cd ..
