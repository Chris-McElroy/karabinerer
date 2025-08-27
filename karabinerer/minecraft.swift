//
//  minecraft.swift
//  karabinerer
//
//  Created by 4 on '25.7.4.
//

let baseMinecraftMap: [(String, String)] = [
    ("left_option", getToText(key: "a")),
    ("left_control", getToText(key: "right_shift")),
    ("spacebar", getToText(key: "right_shift")),
    ("left_shift", getToText(key: "d")),
    
    ("t", getToText(key: "6")),
    ("g", getToText(key: "5")),
    ("b", getToText(key: "4")),
    
    ("r", getToText(key: "1")),
    ("f", getToText(key: "2")),
    ("v", getToText(key: "3")),
    
    ("e", getToText(key: "q")),
    ("d", getToText(key: "spacebar")),
//    ("c", getToText(key: "f3")),
    
    ("w", getToText(key: "escape")),
    ("s", getToText(key: "w")),
    ("x", getToText(key: "s")),
    
    ("q", getToText(key: "f")),
//    ("a", getToText(key: "  ")),
    ("z", getToText(key: "left_shift")),
    
    ("tab", getToText(key: "right_control")),
    
    ("y", getToText(key: "c")),
    ("h", getToText(key: "x")),
    ("return_or_enter", getToText(key: "tab")),
    ("right_command", getToText(key: "r")),
]

//let altMinecraftMap: [(String, String)] = [
//    ("left_shift", getToText(key: "a")),
//    ("left_control", getToText(key: "right_shift")),
//    ("spacebar", getToText(key: "d")),
//    
//    ("t", getToText(key: "4")),
//    ("g", getToText(key: "5")),
//    ("b", getToText(key: "6")),
//    
//    ("r", getToText(key: "1")),
//    ("f", getToText(key: "2")),
//    ("v", getToText(key: "3")),
//    
//    ("e", getToText(key: "q")),
//    ("d", getToText(key: "spacebar")),
////    ("c", getToText(key: "f3")),
//    
//    ("w", getToText(key: "escape")),
//    ("s", getToText(key: "w")),
//    ("x", getToText(key: "s")),
//    
//    ("q", getToText(key: "f")),
////    ("a", getToText(key: "  ")),
//    ("z", getToText(key: "left_shift")),
//    
//    ("tab", getToText(key: "left_control")),
//    
//    ("y", getToText(key: "c")),
//    ("h", getToText(key: "x")),
//    ("return_or_enter", getToText(key: "tab")),
//    ("right_command", getToText(key: "r")),
//]

let f3MinecraftMap: [(String, String)] = [
    ("v", getToText(key: "g")),
    ("f", getToText(key: "b")),
    ("left_control", getToText(key: "f")),
    ("spacebar", getToText(key: "f")),
    ("left_shift", getToText(key: "escape")),
    ("r", getToText(key: "h")),
    ("t", getToText(key: "f4")),
]

let invMinecraftMap: [(String, String)] = [
    ("r", getToText(key: "7")),
    ("f", getToText(key: "8")),
    ("v", getToText(key: "9")),
    ("g", getToText(key: "e")),
    ("e", getToText(key: "q", mods: ["left_command"])),
]


let minecraftExitKeys: [String] = [
              "n",
    "u",      "m",
    "i",      "comma",
    "o", "l", "quote",
    "p",      "period",
    "right_control",
    "delete_or_backspace",
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

//let altMinecraftModeStarter = """
//,
//        {
//            "conditions": [
//                {
//                    "name": "minecraft mode",
//                    "type": "variable_if",
//                    "value": 0
//                }
//            ],
//            "from": {
//                "key_code": "quote",
//                "modifiers": { "mandatory": ["left_control", "left_shift"] }
//            },
//            "to": [
//                {
//                    "set_variable": {
//                        "name": "minecraft mode",
//                        "value": 2
//                    }
//                }
//            ],
//            "type": "basic"
//        }
//"""

let f3ModeStarter = """
,
        {
            "conditions": [
                {
                    "name": "minecraft mode",
                    "type": "variable_unless",
                    "value": 0
                }
            ],
            "from": {
                "key_code": "c",
                "modifiers": { "optional": ["left_shift", "right_shift", "left_command", "right_control"] }
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

let invModeStarter = """
,
        {
            "conditions": [
                {
                    "name": "minecraft mode",
                    "type": "variable_unless",
                    "value": 0
                }
            ],
            "from": {
                "key_code": "a",
                "modifiers": { "optional": ["left_shift", "right_shift", "left_command", "right_control"] }
            },
            "to": [
                {
                    "set_variable": {
                        "name": "inv mode",
                        "value": 1
                    }
                }
            ],
            "to_after_key_up": [
                {
                    "set_variable": {
                        "name": "inv mode",
                        "value": 0
                    }
                }
            ],
            "to_if_alone": [
                {
                    "set_variable": {
                        "name": "inv mode",
                        "value": 0
                    }
                },
                { "key_code": "0" }
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
                    "type": "variable_unless",
                    "value": 0
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
                {
                    "set_variable": {
                        "name": "f3 mode",
                        "value": 0
                    }
                },
                {
                    "set_variable": {
                        "name": "inv mode",
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
                    "type": "variable_unless",
                    "value": 0
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
                {
                    "set_variable": {
                        "name": "f3 mode",
                        "value": 0
                    }
                },
                {
                    "set_variable": {
                        "name": "inv mode",
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
                    "optional": ["left_shift", "right_shift", "left_command", "right_control"]
                }
            },
            "to": [\(t)],
            "type": "basic"
        }
"""
}

//let altMinecraftMapper: (String, String) -> String = { f, t in
//"""
//,
//        {
//            "conditions": [
//                {
//                    "name": "minecraft mode",
//                    "type": "variable_if",
//                    "value": 2
//                }
//            ],
//            "from": {
//                "key_code": "\(f)",
//                "modifiers": {
//                    "optional": ["left_shift", "right_shift", "left_command", "right_control"]
//                }
//            },
//            "to": [\(t)],
//            "type": "basic"
//        }
//"""
//}

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
                    "optional": ["left_shift", "right_shift", "left_command", "right_control"]
                }
            },
            "to": [\(t)],
            "type": "basic"
        }
"""
}

let invMinecraftMapper: (String, String) -> String = { f, t in
"""
,
        {
            "conditions": [
                {
                    "name": "inv mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "\(f)",
                "modifiers": {
                    "optional": ["left_shift", "right_shift", "left_command", "right_control"]
                }
            },
            "to": [\(t)],
            "type": "basic"
        }
"""
}

//let comboMinecraftMapper: (String, String, String) -> String = { f1, f2, t in
//"""
//,
//        {
//            "conditions": [
//                {
//                    "name": "minecraft mode",
//                    "type": "variable_if",
//                    "value": 1
//                },
//                {
//                    "name": "f3 mode",
//                    "type": "variable_if",
//                    "value": 0
//                }
//            ],
//            "from": {
//                "simultaneous": [
//                    {"key_code": "\(f1)"},
//                    {"key_code": "\(f2)"}
//                ],
//                "modifiers": {
//                    "optional": ["left_shift", "right_shift", "left_command", "right_control""]
//                }
//            },
//            "to": [\(t)],
//            "type": "basic"
//        }
//"""
//}


let minecraftExitMapper: (String) -> String = { k in
"""
,
        {
            "conditions": [
                {
                    "name": "minecraft mode",
                    "type": "variable_unless",
                    "value": 0
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
                },
                {
                    "set_variable": {
                        "name": "f3 mode",
                        "value": 0
                    }
                },
                {
                    "set_variable": {
                        "name": "inv mode",
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
//    manipulators.append(altMinecraftModeStarter)
    manipulators.append(f3ModeStarter)
    manipulators.append(invModeStarter)
    manipulators.append(minecraftCustomExit)
    for (from, to) in f3MinecraftMap {
        manipulators.append(f3MinecraftMapper(from, to))
    }
    for (from, to) in invMinecraftMap {
        manipulators.append(invMinecraftMapper(from, to))
    }
    for (from, to) in baseMinecraftMap {
        manipulators.append(baseMinecraftMapper(from, to))
    }
//    for (from, to) in altMinecraftMap {
//        manipulators.append(altMinecraftMapper(from, to))
//    }
    for (key) in minecraftExitKeys {
        manipulators.append(minecraftExitMapper(key))
    }
}
