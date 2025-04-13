//
//  symbols.swift
//  karabinerer
//
//  Created by 4 on '25.4.8.
//

import Foundation

let baseSymbolsKeymap: [(String, String)] = [
    ("q", getToText(key: nil)),
    ("w", getToText(key: "open_bracket", mods: ["shift"])),
    ("e", getToText(key: "close_bracket", mods: ["shift"])),
    ("r", getToText(key: "grave_accent_and_tilde")),
    ("t", getToText(key: nil)),
    ("y", getToText(key: nil)),
    ("u", getToText(key: "2", mods: ["shift"])),
    ("i", getToText(key: "comma", mods: ["shift"])),
    ("o", getToText(key: "period", mods: ["shift"])),
    ("p", getToText(key: nil)),
    ("a", getToText(key: nil)),
    ("s", getToText(key: "9", mods: ["shift"])),
    ("d", getToText(key: "0", mods: ["shift"])),
    ("f", getToText(key: "1", mods: ["shift"])),
    ("g", getToText(key: nil)),
    ("h", getToText(key: nil)),
    ("j", getToText(key: "slash", mods: ["shift"])),
    ("k", getToText(key: "slash")),
    ("l", getToText(key: "backslash")),
    ("z", getToText(key: nil)),
    ("x", getToText(key: "open_bracket")),
    ("c", getToText(key: "close_bracket")),
    ("v", getToText(key: "hyphen", mods: ["right_option", "shift"])),
    ("b", getToText(key: "hyphen", mods: ["shift"])),
    ("n", getToText(key: nil)),
    ("m", getToText(key: nil)),
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
    ("y", getToText(key: nil)),
    ("u", getToText(key: nil)),
    ("i", getToText(key: nil)),
    ("o", getToText(key: nil)),
    ("p", getToText(key: nil)),
    ("a", getToText(key: nil)),
    ("s", getToText(key: nil)),
    ("d", getToText(key: nil)),
    ("f", getToText(key: nil)),
    ("g", getToText(key: nil)),
    ("h", getToText(key: nil)),
    ("j", getToText(key: nil)),
    ("k", getToText(key: nil)),
    ("l", getToText(key: nil)),
    ("z", getToText(key: nil)),
    ("x", getToText(key: nil)),
    ("c", getToText(key: nil)),
    ("v", getToText(key: nil)),
    ("b", getToText(key: nil)),
    ("n", getToText(key: nil)),
    ("m", getToText(key: nil)),
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
