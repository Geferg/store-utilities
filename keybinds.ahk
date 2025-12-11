; Write single column data from clipboard
; to application with enter separation
!F1::{
    INSERT_COOLDOWN_MILLIS:= 350

    clipBuf:= A_Clipboard
    text:= Trim(A_Clipboard, "`r`n")
    rows:= StrSplit(text, "`r`n")

    for , row in rows {
        if (row = "" || row = "`t")
            continue

        A_Clipboard:= row
        Send "^v{Enter}"
        Sleep INSERT_COOLDOWN_MILLIS
    }

    A_Clipboard:= clipBuf
}

; Write two column data from clipboard
; to application with tab separation
!F2::{
    INSERT_COOLDOWN_MILLIS:= 350
    CLIPBOARD_COOLDOWN_MILLIS:= 350

    clipBuf:= A_Clipboard
    text:= Trim(A_Clipboard, "`r`n")
    rows:= StrSplit(text, "`r`n")

    for , row in rows {
        if (row = "")
            continue

        sku:= StrSplit(row, A_TAB)[1]
        place:= StrSplit(row, A_TAB)[2]

        A_Clipboard:= sku
        Sleep CLIPBOARD_COOLDOWN_MILLIS
        Send "^v{Tab}"
        Sleep INSERT_COOLDOWN_MILLIS

        A_Clipboard:= place
        Sleep CLIPBOARD_COOLDOWN_MILLIS
        Send "^v{Tab}"
        Sleep INSERT_COOLDOWN_MILLIS
    }

    A_Clipboard:= clipBuf
}
