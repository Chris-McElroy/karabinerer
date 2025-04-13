//
//  numbers.swift
//  karabinerer
//
//  Created by 4 on '25.4.8.
//

import Foundation

let baseNumbersKeymap: [(String, String)] = [
    ("q", getToText(key: nil)),
    ("w", getToText(key: "4", mods: ["shift"])),
    ("e", getToText(key: "0")),
    ("r", getToText(key: "period")),
    ("t", getToText(key: "semicolon")),
    ("y", getToText(key: "3", mods: ["shift"])),
    ("u", getToText(key: "grave_accent_and_tilde", mods: ["shift"])),
    ("i", getToText(key: "7", mods: ["shift"])),
    ("o", getToText(key: "backslash", mods: ["shift"])),
    ("p", getToText(key: nil)),
    ("a", getToText(key: "1")),
    ("s", getToText(key: "2")),
    ("d", getToText(key: "3")),
    ("f", getToText(key: "4")),
    ("g", getToText(key: "5")),
    ("h", getToText(key: "6")),
    ("j", getToText(key: "7")),
    ("k", getToText(key: "8")),
    ("l", getToText(key: "9")),
    ("z", getToText(key: "6", mods: ["shift"])),
    ("x", getToText(key: "8", mods: ["shift"])),
    ("c", getToText(key: "equal_sign", mods: ["shift"])),
    ("v", getToText(key: "hyphen")),
    ("b", getToText(key: "hyphen", mods: ["right_option"])),
    ("n", getToText(key: "5", mods: ["shift"])),
    ("m", getToText(key: "equal_sign")),
    ("comma", getToText(key: "comma")),
    ("quote", getToText(key: "semicolon", mods: ["shift"])),
    ("period", getToText(key: nil))
]

let shiftedNumbersKeymap: [(String, String)] = [
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

let baseNumbersMapper: (String, String) -> String = { f, t in
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
                },
                {
                    "name": "right layer",
                    "type": "variable_if",
                    "value": 0
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
                "modifiers": { "mandatory": ["left_option"] }
            },
            "to": [\(t)],
            "type": "basic"
        }
"""
}

let shiftedNumberMapper: (String, String) -> String = { f, t in
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

func addNumbersLayer() {
    for (from, to) in baseNumbersKeymap {
        manipulators.append(baseNumbersMapper(from, to))
    }
    for (from, to) in shiftedNumbersKeymap {
        manipulators.append(shiftedNumberMapper(from, to))
    }
}
