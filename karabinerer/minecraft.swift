//
//  minecraft.swift
//  karabinerer
//
//  Created by 4 on '25.7.4.
//

let baseMinecraftMap: [(String, String)] = [
    ("t", getToText(key: "f")),
    ("g", getToText(key: "z")),
    ("b", getToText(key: "f5")),
    ("f", getToText(key: "spacebar")),
    ("v", getToText(key: "right_control")),
    ("e", getToText(key: "escape")),
    ("d", getToText(key: "w")),
    ("c", getToText(key: "s")),
    ("w", getToText(key: "1")),
    ("s", getToText(key: "2")),
    ("x", getToText(key: "3")),
    ("q", getToText(key: "4")),
    ("a", getToText(key: "5")),
    ("z", getToText(key: "6")),
    ("tab", getToText(key: "q")),
    ("left_option", getToText(key: "a")),
    ("left_control", getToText(key: "left_shift")),
    ("left_shift", getToText(key: "d")),
    ("return_or_enter", getToText(key: "tab")),
    ("right_command", getToText(key: "left_control")),
]

let f3MinecraftMap: [(String, String)] = [
    ("w", getToText(key: "f")),
    ("a", getToText(key: "b")),
    ("q", getToText(key: "g")),
    ("z", getToText(key: "h")),
]

let comboMinecraftMap: [(String, String, String)] = [
    ("q", "w", getToText(key: "7")),
    ("a", "s", getToText(key: "8")),
    ("z", "x", getToText(key: "9")),
]

let minecraftExitKeys: [String] = [
    "y", "h", "n",
    "u",      "m",
    "i",      "comma",
    "o", "l", "quote",
    "p",      "period",
    "right_command",
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

let f3ModeStarter = """
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
                "key_code": "r",
                "modifiers": { "optional": ["left_shift", "left_control"] }
            },
            "to": [
                {
                    "set_variable": {
                        "name": "f3 mode",
                        "value": 1
                    }
                },
                { "key_code": "f3" }
            ],
            "to_after_key_up": [
                {
                    "set_variable": {
                        "name": "f3 mode",
                        "value": 0
                    }
                }
            ],
            "type": "basic"
        }
"""

let minecraftCustomExit = """
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
                "key_code": "j"
            },
            "to": [
                {
                    "set_variable": {
                        "name": "minecraft mode",
                        "value": 0
                    }
                },
                \(getToText(key: "t"))
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "minecraft mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "k"
            },
            "to": [
                {
                    "set_variable": {
                        "name": "minecraft mode",
                        "value": 0
                    }
                },
                \(getToText(key: "slash"))
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
                    "optional": ["left_shift", "left_control"]
                }
            },
            "to": [\(t)],
            "type": "basic"
        }
"""
}

let f3MinecraftMapper: (String, String) -> String = { f, t in
"""
,
        {
            "conditions": [
                {
                    "name": "f3 mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "\(f)",
                "modifiers": {
                    "optional": ["left_shift", "left_control"]
                }
            },
            "to": [\(t)],
            "type": "basic"
        }
"""
}

let comboMinecraftMapper: (String, String, String) -> String = { f1, f2, t in
"""
,
        {
            "conditions": [
                {
                    "name": "minecraft mode",
                    "type": "variable_if",
                    "value": 1
                },
                {
                    "name": "f3 mode",
                    "type": "variable_if",
                    "value": 0
                }
            ],
            "from": {
                "simultaneous": [
                    {"key_code": "\(f1)"},
                    {"key_code": "\(f2)"}
                ],
                "modifiers": {
                    "optional": ["left_shift", "left_control"]
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
    manipulators.append(f3ModeStarter)
    manipulators.append(minecraftCustomExit)
    for (from, to) in f3MinecraftMap {
        manipulators.append(f3MinecraftMapper(from, to))
    }
    for (from1, from2, to) in comboMinecraftMap {
        manipulators.append(comboMinecraftMapper(from1, from2, to))
    }
    for (from, to) in baseMinecraftMap {
        manipulators.append(baseMinecraftMapper(from, to))
    }
    for (key) in minecraftExitKeys {
        manipulators.append(minecraftExitMapper(key))
    }
}
