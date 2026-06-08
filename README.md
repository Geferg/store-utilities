# Store Utilities

Miscellaneous utility scripts for store-related workflows.

This package includes a bundled AutoHotkey runtime for convenience, plus utility scripts maintained in this repository.

## What is included

```txt
store-utilities/
  AutoHotkey/
    AutoHotkey64.exe
    AutoHotkey64.ahk
    LICENSE.txt
    SOURCE.txt

  scripts/
    main.ahk
    ...
```

The `AutoHotkey/` folder contains an unmodified AutoHotkey runtime, except for `AutoHotkey64.ahk`, which is a small launcher script used by this package.

When `AutoHotkey64.exe` is started directly, AutoHotkey automatically runs the adjacent `AutoHotkey64.ahk` file. That launcher loads:

```txt
../scripts/main.ahk
```

## Starting the utility

Run:

```txt
AutoHotkey/AutoHotkey64.exe
```

On launch, a tray notification shows the currently running version.

## AutoHotkey attribution

This package includes AutoHotkey for convenience.

AutoHotkey is developed by the AutoHotkey project:

https://www.autohotkey.com/

The bundled AutoHotkey runtime is included unmodified. See `AutoHotkey/license.txt` and `AutoHotkey/SOURCE.txt` for license and source information.

You may alternatively install AutoHotkey yourself from the official website and run the scripts manually.

## Keybinds

### Alt + F1

Takes a single column of data from the clipboard and pastes each row one by one with Enter separation.

### Alt + F2

Takes two columns of data from the clipboard and pastes each row column-by-column, left to right, with Tab separation.

To denote an empty shelf, use either:

```txt
*fjern*
```

or:

```txt
!fjern!
```

`!fjern!` is preferred to avoid issues with internal tools.

### Alt + F3

Aborts long-running tasks.

## License

This repository is licensed under the GNU General Public License v2.0.

AutoHotkey is included as a third-party runtime dependency and remains licensed under its own upstream license.
