//
//  launchers.swift
//  karabinerer
//
//  Created by 4 on '25.8.22.
//



let launchers: [(String, Bool, String)] = [
    ("q", false, "com.endel.endel"), // TODO make endel playpause boi
    ("q", true, "com.endel.endel"),
    ("w", false, "com.microsoft.Excel"),
    ("e", false, "md.obsidian"),
    ("r", false, "com.microsoft.Outlook"),
    ("r", true, "com.edisonmail.edisonmail"),
    ("t", false, "com.microsoft.teams2"),
    ("y", false, "com.rstudio.desktop"),
    ("u", false, "dev.warp.Warp-Stable"),
    ("i", false, "org.pqrs.Karabiner-Elements.Settings"),
    ("i", true, "org.pqrs.Karabiner-EventViewer"),
    ("o", false, "org.zotero.zotero"),
    ("p", false, "com.apple.Photos"),
    
    ("tab", false, "com.apple.systempreferences"),
    ("a", false, "com.apple.Safari"),
    ("s", false, "com.TickTick.task.mac"),
    ("d", false, "com.automattic.beeper.desktop"),
    ("g", false, "com.kishanbagaria.jack"),
    ("h", false, "com.microsoft.VSCode"),
    ("j", false, "com.apple.dt.Xcode"),
    ("k", false, "org.whispersystems.signal-desktop"),
    ("l", false, "com.apple.MobileSMS"),
    ("delete_or_backspace", false, "net.whatsapp.WhatsApp"),
    
    ("z", false, "com.apple.Safari.WebApp.D380587C-9309-4FB3-B3ED-3CD539EFA20B"),
    ("x", false, "com.apple.Safari.WebApp.A9DFBA1A-8806-4BEC-BDAA-1B2F24F14407"),
    ("c", true, "chris.ticker"),
    ("v", false, "com.apple.finder"),
    ("n", false, "com.apple.ScreenContinuity"),
    ("m", false, "com.spotify.client"),
    ("comma", false, "com.microsoft.Word"),
    ("period", false, "com.runningwithcrayons.Alfred-Preferences"),
    
    ("spacebar", false, "com.runningwithcrayons.Alfred"),
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
            "to": [{
                    "software_function": {
                        "open_application": {
                            "bundle_identifier": "\(a)"
                        }
                    }
                }],
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
