#!/usr/bin/env python
<##>

$__Author__="Force.Charlie"
$__Date__="2015.06.03"
$InvokeDir=Split-Path -Parent $MyInvocation.MyCommand.Definition

Function Start-Build
{
}


Function Clear-Build
{
    Write-Host "Make script clear build file."
    cd $InvokeDir
    Remove-Item -Force  -Rescure *.obj *.exe *.pdb *.res
}


