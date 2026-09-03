<div align="center">

# pixnip

**A screenshot tool for macOS.**

Press a shortcut, the screen freezes, drag — the image, or the text inside it,
is already on your clipboard.

macOS 14+ · Apple Silicon & Intel · light & dark · 10 languages

**English** · [한국어](README.ko.md)

</div>

## Install

```bash
brew tap 132262b/pixnip && brew trust --cask 132262b/pixnip/pixnip && brew install --cask pixnip
```

One line — paste it and you are done. The `brew trust` in the middle is the confirmation
Homebrew asks for on third-party taps.

<img src="images/editor.png" alt="The pixnip editor, marking up a screenshot with an arrow, a highlighter and a blur" width="880">

## Catch the moment

The screen freezes the instant you press the shortcut. A video mid-frame, an open menu, a
tooltip that disappears the moment you look away — what you saw is what gets cut.

|                     |                                                                                  |
| ------------------- | -------------------------------------------------------------------------------- |
| **Area**            | Drag exactly what you want. `Space` moves the selection, arrow keys nudge it 1 px |
| **Full screen**     | The whole display under the cursor                                               |
| **Window**          | Hover and the border snaps to the window; click to take it                       |
| **Color picker**    | Magnify down to the pixel and copy its `#RRGGBB`                                  |
| **Text extraction** | Read the text inside a dragged area straight into the clipboard                  |

## Text you can't select

Drag over any text on screen and it arrives on your clipboard as text — a screenshot a
colleague sent you, an error dialog that won't let you copy, a scanned PDF, a paused frame
of a video.

<img src="images/ocr.png" alt="Dragging over a block of text in the pixnip settings window to extract it" width="700">

That drag put exactly this on the clipboard:

```
Area capture
Drag to crop exactly what you want.
Full screen capture
Captures the entire display under the cursor.
Window capture
Hover to snap to a window, click to capture it.
Color picker
Picks a pixel color and copies its #RRGGBB code.
Text extraction
Reads the text in a dragged area into the clipboard.
```

Line breaks are kept in reading order. It runs on the same recognizer macOS uses for Live
Text, so there is no model to download and nothing leaves your Mac. Korean and English are
recognized out of the box, and other languages are detected automatically.

## Pick a color from anywhere

Magnify down to the pixel and the `#RRGGBB` lands on your clipboard. The magnifier follows
the cursor across every display.

<img src="images/picker.png" alt="The color picker magnifier showing a pixel grid and the hex code 0B84FF" width="350">

## One shortcut for all of them

Tap `⌘⇧⌥S` and the wheel opens where your cursor is. Aim, let go, it runs.

<img src="images/quickslot.png" alt="The quickslot wheel with five capture modes" width="380">

## From capture to markup, without a break

Every capture lands on the clipboard first, so you can paste it immediately. Click the
preview in the bottom-right corner and it opens straight into the editor.

Pen, highlighter, shapes, arrows, text, mosaic, blur and crop — each one key away.
`⌘S` saves to your folder, `⌘C` copies. The ✨ button wraps the shot in a gradient
background with rounded corners and a shadow, ready to share.

| Tool      | Key | Tool      | Key |
| --------- | --- | --------- | --- |
| Select    | V   | Text      | T   |
| Crop      | C   | Mosaic    | M   |
| Rectangle | R   | Blur      | B   |
| Ellipse   | O   | Highlight | H   |
| Arrow     | A   | Pen       | P   |

## Make it yours

<img src="images/shortcuts.png" alt="The Shortcuts tab in pixnip settings" width="700">

Every shortcut is yours to change, and you can switch them off one by one or all at once
from the menu bar — handy when another app wants the same combination. The defaults stay
clear of the built-in macOS screenshot keys (`⌘⇧3/4/5`).

<img src="images/settings.png" alt="The General tab in pixnip settings" width="700">

Save as PNG, JPEG or WebP with a quality slider, pick where files land, decide whether the
preview appears and how long it stays, open at login, and update from inside the app.
Right-click any image in Finder → **Open With → pixnip** to edit it on the spot.

| Action           | Default |
| ---------------- | ------- |
| Area capture     | ⌘⇧⌥A    |
| Full screen      | ⌘⇧⌥F    |
| Window capture   | ⌘⇧⌥W    |
| Color picker     | ⌘⇧⌥C    |
| Text extraction  | ⌘⇧⌥T    |
| Quickslot wheel  | ⌘⇧⌥S    |

## Update and uninstall

```bash
brew update && brew upgrade --cask pixnip     # or press Update in Settings
brew uninstall --cask pixnip
```

## About the install

pixnip is not notarized by Apple, so the cask removes the Gatekeeper quarantine attribute
after installing — without it macOS refuses to open the app at all. That also means it
cannot go into the official homebrew-cask. Everything the install does is right there in
[Casks/pixnip.rb](Casks/pixnip.rb), in plain sight.

This repository holds the cask and the release builds. The source lives in a private
repository.
