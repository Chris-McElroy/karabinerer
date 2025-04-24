//
//  random.swift
//  karabinerer
//
//  Created by 4 on '25.4.14.
//

var spacebarMods = """
        {
            "from": {
                "key_code": "spacebar",
                "modifiers": { "mandatory": ["left_control"] }
            },
            "to": [
                {
                    "set_variable": {
                        "name": "control mode",
                        "value": 0
                    }
                },
                {
                    "key_code": "spacebar",
                    "modifiers": ["left_control"]
                }
            ],
            "type": "basic"
        }
"""

var deleteMods = """
,
        {
            "from": {
                "key_code": "delete_or_backspace",
                "modifiers": { "mandatory": ["left_shift"] }
            },
            "to": [
                {
                    "key_code": "delete_or_backspace",
                    "modifiers": ["right_option"]
                }
            ],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "delete_or_backspace",
                "modifiers": { "mandatory": ["left_shift", "right_control"] }
            },
            "to": [
                {
                    "key_code": "delete_or_backspace",
                    "modifiers": ["right_option"]
                }
            ],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "delete_or_backspace",
                "modifiers": { "mandatory": ["left_option"] }
            },
            "to": [
                {
                    "key_code": "delete_or_backspace"
                }
            ],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "delete_or_backspace",
                "modifiers": { "mandatory": ["right_control"] }
            },
            "to": [
                {
                    "key_code": "delete_or_backspace"
                }
            ],
            "type": "basic"
        }
"""

func addRandom() {
    manipulators.append(spacebarMods)
    manipulators.append(deleteMods)
}
