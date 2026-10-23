//
//  launchers.swift
//  karabinerer
//
//  Created by 4 on '25.8.22.
//



let launchers: [(String, Bool, String)] = [
    ("q", false, getToText(app: "com.microsoft.Word")), // TODO make endel playpause boi
//    ("q", true, getToText(app: "com.endel.endel")),
    ("w", false, getToText(app: "com.microsoft.Excel")),
    ("e", false, getToText(app: "md.obsidian")),
    ("r", false, getToText(app: "com.microsoft.Outlook")),
    ("r", true, getToText(app: "com.edisonmail.edisonmail")),
    ("t", false, getToText(app: "com.microsoft.teams2")),
    ("y", false, getToText(app: "com.rstudio.desktop")),
//    ("u", false, getToText(app: "dev.warp.Warp-Stable")),
    ("i", false, getToText(app: "org.pqrs.Karabiner-Elements.Settings")),
    ("i", true, getToText(app: "org.pqrs.Karabiner-EventViewer")),
//    ("o", false, getToText(app: "org.zotero.zotero")),
    ("p", false, getToText(app: "com.apple.Photos")),
    
    ("tab", false, getToText(app: "com.apple.systempreferences")),
    ("a", false, getToText(app: "net.imput.helium")),
    ("s", false, getToText(app: "com.TickTick.task.mac")),
    ("d", false, getToText(app: "com.automattic.beeper.desktop")),
    ("g", false, getToText(app: "org.zotero.zotero")),
    ("h", false, getToText(app: "com.microsoft.VSCode")),
    ("j", false, getToText(app: "com.apple.dt.Xcode")),
    ("k", false, getToText(app: "org.whispersystems.signal-desktop")),
    ("l", false, getToText(app: "com.apple.MobileSMS")),
    ("delete_or_backspace", false, getToText(app: "net.whatsapp.WhatsApp")),
    
    ("z", false, getToText(app: "training.solve.solve-training")),
    ("x", false, getToText(app: "com.apple.Safari.WebApp.1715C222-FD66-4B76-935F-C4C83AE31FF5")),
//    ("x", true, getToText(app: "com.apple.Safari.WebApp.C60C7963-C77D-4FD6-A50E-60B6B705E412")),
    ("c", true, getToText(app: "chris.ticker")),
    ("v", false, getToText(app: "com.apple.finder")),
    ("n", false, getToText(app: "com.apple.ScreenContinuity")),
    ("m", false, getToText(app: "org.strawberrymusicplayer.strawberry")),
    ("comma", false, getToText(app: "com.mitchellh.ghostty")),
    ("period", false, getToText(app: "com.runningwithcrayons.Alfred-Preferences")),
    
    ("spacebar", false, getToText(key: "a", mods: ["left_control", "left_option", "left_shift"], typingMode: true)),
]

let launcher: (String, Bool, String) -> String = { k, s, a in
"""
,
        {
            "from": {
                "key_code": "\(k)",
                "modifiers": {
                    "mandatory": ["left_control"\(s ? ", \"left_shift\"" : "")]
                }
            },
            "to": [\(a)],
            "type": "basic"
        }
"""
}

let ticktickQuickAdd: String = """
,
        {
            "from": {
                "key_code": "s",
                "modifiers": {
                    "mandatory": ["left_control", "left_shift"]
                }
            },
            "to": [\(getToText(key: "9", mods: ["left_control", "left_option", "left_shift", "left_command"]))],
            "type": "basic"
        }
"""

func addLaunchers() {
    for (key, shift, app) in launchers {
        manipulators.append(launcher(key, shift, app))
    }
    manipulators.append(ticktickQuickAdd)
}
