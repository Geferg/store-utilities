; v2.1
Abort := false

HasVal(haystack, needle) {
	if !(IsObject(haystack)) || (haystack.Length = 0)
		return 0
	for index, value in haystack
		if (value = needle)
			return index
	return 0
}

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

; Check 2 column sku shelf clipboard for duplicates
!f2::{
	global Abort := false
	
	text := Trim(A_Clipboard, "`r`n")
	rows := StrSplit(text, "`r`n")
	delayMs := 200
	
	skus := []
	shelfs := []	

	for row in rows {
		if (row = "" || row = "`t") {
			continue
		}
		
		if (StrSplit(row, A_TAB).Length <= 1) {
			MsgBox "Current row has only one column", "Error"
			Abort := true
			break
		}
		
		sku := StrSplit(row, A_TAB)[1]
		if HasVal(skus, sku) != 0 {
			MsgBox "Duplicate entry of" . sku . " please fix!", "Error"
			Abort := true
			break
		}
		
		shelf := StrSplit(row, A_TAB)[2]
		if (StrLower(shelf) == "*fjern*" || StrLower(shelf) == "!fjern!") {
			shelf := " "
		}
		
		skus.push(sku)
		shelfs.push(shelf)
	}

	for index, sku in skus {
		if Abort {
			TrayTip "Aborted the script", "Aborted"
			break
		}
		shelf := shelfs[index]	

		; wake up sluggish input fields
		sleep delayMs
		Send "{Backspace}"
		
		Send sku
		Send "{Tab}"
		sleep delayMs
		Send shelf 
		Send "{Enter}"
	}

	if Abort{
		return
	}
}


!f3::{
	global Abort := true
}
