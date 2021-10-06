# Script: build-linux.ps1
# Builds the EFrt solution and creates local nuget packages from all packable EFrt projects.
# License: MIT
# Authors: Premysl Fara 
# (C) 2020 - 2021
# Requires: "PowerShell", "mono" and "nuget.exe".
# Note: Make sure, that the $toolsPath variable is correctly set.
# Run as "powershell.exe -ExecutionPolicy Unrestricted .\build-linux.ps1 -Configuration Release" in the solution folder.

param(
	[Parameter(Mandatory=$True)]$Configuration
)

$ErrorActionPreference = 'Stop'

$baseDir = Get-Location
$outDir = "$baseDir/out"
$nugetDir = "$baseDir/nuget"
#$toolsPath = "~/Devel/bin"
$toolsPath = "D:\Devel\bin"
$nugetPath = "$toolsPath/nuget/nuget.exe"
#$nugetCommand = "mono $nugetPath"
$nugetCommand = "$nugetPath"

. "$baseDir/include.ps1"

Clean
#Build

BuildProject "BaseNuget"
PackProject "BaseNuget"

BuildProject "UsesBaseNuget"
PackProject "UsesBaseNuget"

BuildProject "UsesNugetsApp"
