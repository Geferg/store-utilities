; v1.2
Abort := false

; Write single column data from clipboard
; to application with enter separation
!f1::{
	INSERT_COOLDOWN_MILLIS := 350
	
	clipBuf := A_Clipboard
	text := Trim(A_Clipboard, "`r`n")
	rows := StrSplit(text, "`r`n")
	
	for , row in rows {
		if (row = "") {
			continue
		}
		
		A_Clipboard := row
		Send "^v{Enter}"
		Sleep INSERT_COOLDOWN_MILLIS
	}
	
	A_Clipboard := clipBuf
}

; Write two column data from clipboard
; to application with tab separation
!f2::{
	global Abort := false
	INSERT_COOLDOWN_MILLIS := 660
	CLIPBOARD_COOLDOWN_MILLIS := 660
	
	clipBuf := A_Clipboard
	text := Trim(A_Clipboard, "`r`n")
	rows := StrSplit(text, "`r`n")

	i := 0
	n := rows.Length
	
	while ((i < n) && !Abort) {
		row := rows[i + 1] ; 1-indexed

		if (row = "" || row = "`t") {
			continue
		}
		
		sku := StrSplit(row, A_TAB)[1]
		place := StrSplit(row, A_TAB)[2]
		
		if (StrLower(place) == "*fjern*") {
			place := " "
		}
		
		A_Clipboard := sku
		Sleep CLIPBOARD_COOLDOWN_MILLIS
		Send "^v{Tab}"
		Sleep INSERT_COOLDOWN_MILLIS
		
		A_Clipboard := place
		Sleep CLIPBOARD_COOLDOWN_MILLIS
		Send "^v{Tab}"
		Sleep INSERT_COOLDOWN_MILLIS
		
		i := i + 1
	}

	if Abort
		TrayTip "Aborted the script", "Aborted"
	else
		MsgBox "The script is now completed!", "Completed"

	A_Clipboard := clipBuf
}

!f3::{
	global Abort := true
}
