global Abort := false

; Check 2 column sku shelf clipboard for duplicates
!F2::{
    global Abort

    Abort := false

    text := Trim(A_Clipboard, "`r`n")
    rows := StrSplit(text, "`r`n")
    delayMs := 200

    skus := []
    shelfs := []

    for , row in rows {
        if (row = "" || row = "`t")
            continue

        columns := StrSplit(row, A_Tab)

        if (columns.Length <= 1) {
            MsgBox "Current row has only one column", "Error"
            Abort := true
            break
        }

        sku := columns[1]

        if HasVal(skus, sku) != 0 {
            MsgBox "Duplicate entry of " . sku . " please fix!", "Error"
            Abort := true
            break
        }

        shelf := columns[2]

        if (StrLower(shelf) == "*fjern*" || StrLower(shelf) == "!fjern!")
            shelf := " "

        skus.Push(sku)
        shelfs.Push(shelf)
    }

    for index, sku in skus {
        if Abort {
            TrayTip "Aborted the script", "Aborted"
            break
        }

        shelf := shelfs[index]

        ; wake up sluggish input fields
        Sleep delayMs
        Send "{Backspace}"

        Send sku
        Send "{Tab}"
        Sleep delayMs
        Send shelf
        Send "{Enter}"
    }
}

!F3::{
    global Abort

    Abort := true
}
