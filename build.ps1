# Script: build.ps1
# Builds projects and creates local nuget packages.
# License: MIT
# Authors: Premysl Fara 
# (C) 2021
# Requires: "PowerShell", "mono" (on Linux) and "nuget.exe".
# Note: Make sure, that the $toolsPath variable is correctly set.
# Run as "powershell.exe -ExecutionPolicy Unrestricted ./build.ps1 -Configuration Release" in the folder with build.ps1.

param(
	[Parameter(Mandatory=$True)]$Configuration
)

$ErrorActionPreference = 'Stop'

$baseDir = Get-Location

# Temporary place for storing generated nugets.
$outDir = "$baseDir/out"

# The local nugets repository path.
$nugetDir = "$baseDir/nuget"

# Choose or set a path, whith build tools:
#$toolsPath = "~/Devel/bin"   # Linux
$toolsPath = "D:\Devel\bin"   # Windows

# Choose or set a path to the nuget.exe:
$nugetPath = "$toolsPath/nuget/nuget.exe"

# Choose, how is the nuget.exe called:
#$nugetCommand = "mono $nugetPath"   # On Linux you need mono to run it.
$nugetCommand = "$nugetPath"         # On Windows it runs as it is.

. "$baseDir/include.ps1"

Clean
#Build

BuildProject "BaseNuget"
PackProject "BaseNuget"

BuildProject "UsesBaseNuget"
PackProject "UsesBaseNuget"

BuildProject "UsesNugetsApp"
