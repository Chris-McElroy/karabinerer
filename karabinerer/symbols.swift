//
//  symbols.swift
//  karabinerer
//
//  Created by 4 on '25.4.8.
//

import Foundation

let baseSymbolsKeymap: [(String, String)] = [
    ("q", getToText(key: nil)),
    ("w", getToText(key: "6")),
    ("e", getToText(key: "5")),
    ("r", getToText(key: "4")),
    ("t", getToText(key: "period")),
    ("y", getToText(key: "8", mods: ["shift"])),
    ("u", getToText(key: "equal_sign", mods: ["shift"])),
    ("i", getToText(key: "slash")),
    ("o", getToText(key: "backslash")),
    ("p", getToText(key: nil)),
    ("a", getToText(key: nil)),
    ("s", getToText(key: "3")),
    ("d", getToText(key: "2")),
    ("f", getToText(key: "1")),
    ("g", getToText(key: "0")),
    ("h", getToText(key: "4", mods: ["shift"])),
    ("j", getToText(key: "hyphen")),
    ("k", getToText(key: "9", mods: ["shift"])),
    ("l", getToText(key: "0", mods: ["shift"])),
    ("z", getToText(key: nil)),
    ("x", getToText(key: "9")),
    ("c", getToText(key: "8")),
    ("v", getToText(key: "7")),
    ("b", getToText(key: "semicolon", mods: ["shift"])),
    ("n", getToText(key: "5", mods: ["shift"])),
    ("m", getToText(key: "equal_sign")),
//    (",", getToText(key: "comma")),
//    ("'", getToText(key: "quote")),
//    (".", getToText(key: "period")), // these are all already there from the normal typing layer
]

let shiftedSymbolsKeymap: [(String, String)] = [
    ("q", getToText(key: nil)),
    ("w", getToText(key: "open_bracket")),
    ("e", getToText(key: "close_bracket")),
    ("r", getToText(key: nil)),
    ("t", getToText(key: "period", mods: ["shift"])),
    ("y", getToText(key: "6", mods: ["shift"])),
    ("u", getToText(key: "equal_sign", mods: ["shift", "right_option"])),
    ("i", getToText(key: "comma", mods: ["shift"])),
    ("o", getToText(key: "period", mods: ["shift"])),
    ("p", getToText(key: nil)),
    ("a", getToText(key: nil)),
    ("s", getToText(key: "9", mods: ["shift"])),
    ("d", getToText(key: "0", mods: ["shift"])),
    ("f", getToText(key: "equal_sign", mods: ["shift"])),
    ("g", getToText(key: "equal_sign")),
    ("h", getToText(key: "3", mods: ["shift"])),
    ("j", getToText(key: "grave_accent_and_tilde", mods: ["shift"])),
    ("k", getToText(key: "open_bracket", mods: ["shift"])),
    ("l", getToText(key: "close_bracket", mods: ["shift"])),
    ("z", getToText(key: nil)),
    ("x", getToText(key: nil)),
    ("c", getToText(key: nil)),
    ("v", getToText(key: nil)),
    ("b", getToText(key: "hyphen")),
    ("n", getToText(key: "5", mods: ["shift"])),
    ("m", getToText(key: "x", mods: ["right_option"])),
//    (",", getToText(key: "comma")),
//    ("'", getToText(key: "quote")),
//    (".", getToText(key: "period")), // these are all already there from the normal typing layer
]

let baseSymbolsMapper: (String, String) -> String = { f, t in
"""
,
        {
            "conditions": [
                {
                    "name": "control mode",
                    "type": "variable_if",
                    "value": 0
                },
                {
                    "name": "left layer",
                    "type": "variable_if",
                    "value": 0
                },
                {
                    "name": "right layer",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "\(f)"
            },
            "to": [\(t)],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "control mode",
                    "type": "variable_if",
                    "value": 0
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
                "key_code": "\(f)",
                "modifiers": { "mandatory": ["right_control"] }
            },
            "to": [\(t)],
            "type": "basic"
        }
"""
}

let shiftedSymbolsMapper: (String, String) -> String = { f, t in
"""
,
        {
            "conditions": [
                {
                    "name": "control mode",
                    "type": "variable_if",
                    "value": 0
                },
                {
                    "name": "left layer",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "\(f)",
                "modifiers": { "mandatory": ["shift"] }
            },
            "to": [\(t)],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "control mode",
                    "type": "variable_if",
                    "value": 0
                }
            ],
            "from": {
                "key_code": "\(f)",
                "modifiers": { "mandatory": ["left_option", "shift"] }
            },
            "to": [\(t)],
            "type": "basic"
        }
"""
}

func addSymbolsLayer() {
    for (from, to) in baseSymbolsKeymap {
        manipulators.append(baseSymbolsMapper(from, to))
    }
    for (from, to) in shiftedSymbolsKeymap {
        manipulators.append(shiftedSymbolsMapper(from, to))
    }
}
