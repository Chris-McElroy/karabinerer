//
//  controls.swift
//  karabinerer
//
//  Created by 4 on '25.4.8.
//

import Foundation

let baseControlsKeymap: [(String, String)] = [
    (getFromText(key: "q"), getToText(key: "q", mods: ["command"])),
    (getFromText(key: "w", optMods: ["shift", "right_option", "right_command"]), getToText(key: "left_arrow")),
    (getFromText(key: "e", optMods: ["shift", "right_option", "right_command"]), getToText(key: "right_arrow")),
    (getFromText(key: "r"), getToText(key: "c", mods: ["command"])),
    (getFromText(key: "t"), getToText(key: "x", mods: ["command"])),
    (getFromText(key: "y"), getToText(key: "hyphen", mods: ["command"])),
    (getFromText(key: "u"), getToText(key: "equal_sign", mods: ["command"])),
    (getFromText(key: "i"), getToText(key: "b", mods: ["command"])),
    (getFromText(key: "o"), getToText(key: "i", mods: ["command"])),
    (getFromText(key: "p"), getToText(key: "u", mods: ["command"])),
    (getFromText(key: "a"), getToText(key: "h", mods: ["command"])),
    (getFromText(key: "s", optMods: ["shift", "right_option", "right_command"]), getToText(key: "up_arrow")),
    (getFromText(key: "d", optMods: ["shift", "right_option", "right_command"]), getToText(key: "down_arrow")),
    (getFromText(key: "f"), getToText(key: "w", mods: ["command"])),
    (getFromText(key: "g"), getToText(key: "v", mods: ["command"])),
    (getFromText(key: "h"), getToText(key: "f", mods: ["command"], typingMode: true)),
    (getFromText(key: "j"), getToText(key: "o", mods: ["command"], typingMode: true)),
    (getFromText(key: "j", mandMods: ["shift"]), getToText(key: "n", mods: ["command"], typingMode: true)),
    (getFromText(key: "k"), getToText(key: "right_option")),
    (getFromText(key: "l"), getToText(key: "right_command")),
    (getFromText(key: "z"), getToText(key: "comma", mods: ["command"])),
    (getFromText(key: "x"), getToText(key: "z", mods: ["command"])),
    (getFromText(key: "x", mandMods: ["shift"]), getToText(key: "z", mods: ["command", "shift"])),
    (getFromText(key: "c"), getToText(key: "a", mods: ["command"])),
    (getFromText(key: "v"), getToText(key: nil)),
    (getFromText(key: "b", optMods: ["shift"]), getToText(key: "s", mods: ["command"])),
    (getFromText(key: "n"), getToText(key: nil)),
    (getFromText(key: "m"), getToText(key: nil)),
    (getFromText(key: "comma"), getToText(key: "3", mods: ["command"])),
    (getFromText(key: "comma", mandMods: ["shift"]), getToText(key: "3", mods: ["command", "right_option"])),
    (getFromText(key: "quote", optMods: ["shift", "right_option"]), getToText(key: "t", mods: ["command"])),
    (getFromText(key: "period"), getToText(key: nil)),
]

let controlsMapper: (String, String) -> String = { f, t in
"""
,
        {
            "conditions": [
                {
                    "name": "control mode",
                    "type": "variable_if",
                    "value": 1
                },
                {
                    "name": "left layer",
                    "type": "variable_if",
                    "value": 0
                },
                {
                    "name": "right layer",
                    "type": "variable_if",
                    "value": 0
                }
            ],
            "from": {
                \(f)
            },
            "to": [\(t)],
            "type": "basic"
        }
"""
}

func addControlsLayer() {
    for (from, to) in baseControlsKeymap {
        manipulators.append(controlsMapper(from, to))
    }
}
