; v2.0
Abort := false

; Write single column data from clipboard
; to application with enter separation
!f1::{
	clipBuf := A_Clipboard
	text := Trim(A_Clipboard, "`r`n")
	rows := StrSplit(text, "`r`n")
	
	for , row in rows {
		if (row = "") {
			continue
		}
		
		Send row
		Send "{Enter}"
	}
	
	A_Clipboard := clipBuf
}

; Write two column data from clipboard
; to application with tab separation
!f2::{
	global Abort := false
	
	clipBuf := A_Clipboard
	text := Trim(A_Clipboard, "`r`n")
	rows := StrSplit(text, "`r`n")

	i := 0
	n := rows.Length
	
	while ((i < n) && !Abort) {
		row := rows[i + 1] ; 1-indexed

		if (row = "" || row = "`t") {
			i := i + 1
			continue
		}
		
		if (StrSplit(row, A_TAB).Length <= 1) {
			MsgBox "Current row has only one column", "Error"
			i := i + 1
			continue
		}
		
		sku := StrSplit(row, A_TAB)[1]
		place := StrSplit(row, A_TAB)[2]
		
		if (StrLower(place) == "*fjern*") {
			place := " "
		}
		
		Send sku
		Send "{Tab}"
		;Sleep ARRAY_COOLDOWN_MILLIS
		Send place 
		Send "{Tab}"
		;Sleep ARRAY_COOLDOWN_MILLIS
		
		
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
