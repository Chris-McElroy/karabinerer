//
//  symbols.swift
//  karabinerer
//
//  Created by 4 on '25.4.8.
//

import Foundation

let baseSymbolsKeymap: [(String, String)] = [
    ("q", getToText(key: nil)),
    ("w", getToText(key: "open_bracket")),
    ("e", getToText(key: "close_bracket")),
    ("r", getToText(key: nil)),
    ("t", getToText(key: nil)),
    ("y", getToText(key: "8", mods: ["shift"])),
    ("u", getToText(key: "hyphen", mods: ["shift", "right_option"])),
    ("i", getToText(key: "slash")),
    ("o", getToText(key: "backslash")),
    ("p", getToText(key: nil)),
    ("a", getToText(key: nil)),
    ("s", getToText(key: "open_bracket", mods: ["shift"])),
    ("d", getToText(key: "close_bracket", mods: ["shift"])),
    ("f", getToText(key: "semicolon")),
    ("g", getToText(key: nil)),
    ("h", getToText(key: "1", mods: ["shift"])),
    ("j", getToText(key: "hyphen")),
    ("k", getToText(key: "9", mods: ["shift"])),
    ("l", getToText(key: "0", mods: ["shift"])),
    ("z", getToText(key: nil)),
    ("x", getToText(key: nil)),
    ("c", getToText(key: nil)),
    ("v", getToText(key: nil)),
    ("b", getToText(key: nil)),
    ("n", getToText(key: "slash", mods: ["shift"])),
    ("m", getToText(key: "7", mods: ["shift"])),
    ("comma", getToText(key: nil)),
    ("quote", getToText(key: nil)),
    ("period", getToText(key: nil)),
]

let shiftedSymbolsKeymap: [(String, String)] = [
    ("q", getToText(key: nil)),
    ("w", getToText(key: nil)),
    ("e", getToText(key: nil)),
    ("r", getToText(key: nil)),
    ("t", getToText(key: nil)),
    ("y", getToText(key: "6", mods: ["shift"])),
    ("u", getToText(key: "hyphen", mods: ["shift"])),
    ("i", getToText(key: "comma", mods: ["shift"])),
    ("o", getToText(key: "period", mods: ["shift"])),
    ("p", getToText(key: nil)),
    ("a", getToText(key: nil)),
    ("s", getToText(key: nil)),
    ("d", getToText(key: nil)),
    ("f", getToText(key: nil)),
    ("g", getToText(key: nil)),
    ("h", getToText(key: nil)),
    ("j", getToText(key: "hyphen", mods: ["right_option"])),
    ("k", getToText(key: "open_bracket", mods: ["shift"])),
    ("l", getToText(key: "close_bracket", mods: ["shift"])),
    ("z", getToText(key: nil)),
    ("x", getToText(key: nil)),
    ("c", getToText(key: nil)),
    ("v", getToText(key: nil)),
    ("b", getToText(key: nil)),
    ("n", getToText(key: nil)),
    ("m", getToText(key: "2", mods: ["shift"])),
    ("comma", getToText(key: nil)),
    ("quote", getToText(key: nil)),
    ("period", getToText(key: nil)),
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
