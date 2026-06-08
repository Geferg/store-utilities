; Write single column data from clipboard
; to application with enter separation
!F1::{
    clipBuf := A_Clipboard
    text := Trim(A_Clipboard, "`r`n")
    rows := StrSplit(text, "`r`n")

    for , row in rows {
        if (row = "")
            continue

        Send row
        Send "{Enter}"
    }

    A_Clipboard := clipBuf
}
