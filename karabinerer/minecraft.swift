//
//  minecraft.swift
//  karabinerer
//
//  Created by 4 on '25.7.4.
//

let baseMinecraftMap: [(String, String)] = [
    ("left_control", getToText(key: "spacebar")),
    ("left_option", getToText(key: "left_option")),
    ("q", getToText(key: "h")),
    ("w", getToText(key: "b")),
    ("e", getToText(key: "e")),
    ("r", getToText(key: "escape")),
    ("t", getToText(key: "f5")),
    ("a", getToText(key: "g")),
    ("s", getToText(key: "f")),
    ("d", getToText(key: "w")),
    ("f", getToText(key: "r")),
    ("g", getToText(key: "f3")),
    ("z", getToText(key: "0")),
    ("x", getToText(key: "a")),
    ("c", getToText(key: "s")),
    ("v", getToText(key: "d")),
    ("b", getToText(key: "p")),
    ("tab", getToText(key: "q")),
]

let altMinecraftMap: [(String, String)] = [
    ("left_control", getToText(key: "spacebar")),
    ("left_option", getToText(key: "left_option")),
    ("q", getToText(key: "4")),
    ("w", getToText(key: "6")),
    ("e", getToText(key: "e")),
    ("r", getToText(key: "escape")),
    ("t", getToText(key: "f3")),
    ("a", getToText(key: "3")),
    ("s", getToText(key: "7")),
    ("d", getToText(key: "w")),
    ("f", getToText(key: "r")),
    ("g", getToText(key: "f3")),
    ("z", getToText(key: "5")),
    ("x", getToText(key: "a")),
    ("c", getToText(key: "s")),
    ("v", getToText(key: "d")),
    ("b", getToText(key: "p")),
    ("tab", getToText(key: "q")),
]

let minecraftExitKeys: [String] = [
    "y",
    "u",
    "i",
    "o",
    "p",
    "h",
    "j",
    "k",
    "l",
    "n",
    "m",
    "comma",
    "quote",
    "period",
    "spacebar",
    "right_control",
]

let minecraftModeStarter = """
        {
            "conditions": [
                {
                    "name": "minecraft mode",
                    "type": "variable_if",
                    "value": 0
                }
            ],
            "from": {
                "key_code": "quote",
                "modifiers": { "mandatory": ["left_control"] }
            },
            "to": [
                {
                    "set_variable": {
                        "name": "minecraft mode",
                        "value": 1
                    }
                }
            ],
            "type": "basic"
        }
"""

let baseMinecraftMapper: (String, String) -> String = { f, t in
"""
,
        {
            "conditions": [
                {
                    "name": "minecraft mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "\(f)",
                "modifiers": {
                    "optional": ["left_shift"]
                }
            },
            "to": [\(t)],
            "type": "basic"
        }
"""
}

let altMinecraftMapper: (String, String) -> String = { f, t in
"""
,
        {
            "conditions": [
                {
                    "name": "minecraft mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "\(f)",
                "modifiers": {
                    "mandatory": ["left_option"],
                    "optional": ["left_shift"]
                }
            },
            "to": [\(t)],
            "type": "basic"
        }
"""
}

let minecraftExitMapper: (String) -> String = { k in
"""
,
        {
            "conditions": [
                {
                    "name": "minecraft mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "\(k)"
            },
            "to": [
                {
                    "set_variable": {
                        "name": "minecraft mode",
                        "value": 0
                    }
                }
            ],
            "type": "basic"
        }
"""
}

func addMinecraft() {
    manipulators.append(minecraftModeStarter)
    for (from, to) in baseMinecraftMap {
        manipulators.append(baseMinecraftMapper(from, to))
    }
    for (from, to) in altMinecraftMap {
        manipulators.append(altMinecraftMapper(from, to))
    }
    for (key) in minecraftExitKeys {
        manipulators.append(minecraftExitMapper(key))
    }
}
