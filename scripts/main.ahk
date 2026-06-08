#Requires AutoHotkey v2.0
#SingleInstance Force

global AppName := "Store Utilities"
global AppVersion := "2.1"

TrayTip AppName, "Running version " AppVersion

#Include "lib\array.ahk"
#Include "hotkeys\clipboard-entry.ahk"
#Include "hotkeys\sku-shelf-entry.ahk"
