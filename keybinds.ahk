; Write single column data from clipboard
; to application with enter separation
!F1::{
    INSERT_COOLDOWN_MILLIS:= 350

    clipBuf:= A_Clipboard
    text:= Trim(A_Clipboard, "`r`n")
    rows:= StrSplit(text, "`r`n")

    for , row in rows {
        if (row = "")
            continue

        A_Clipboard:= row
        Send "^v{Enter}"
        Sleep INSERT_COOLDOWN_MILLIS
    }

    A_Clipboard:= clipBuf
}
