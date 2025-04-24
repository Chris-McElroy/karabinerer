//
//  modifiers.swift
//  karabinerer
//
//  Created by 4 on '25.4.8.
//

let control = """
,
        {
            "from": { "key_code": "left_control" },
            "to": [
                { "key_code": "left_control" }
            ],
            "to_if_alone": [
                {
                    "set_variable": {
                        "name": "control mode",
                        "value": 1
                    }
                },
                {
                    "set_variable": {
                       "name": "left layer",
                       "value": 0
                    }
                },
                {
                    "set_variable": {
                        "name": "right layer",
                        "value": 0
                    }
                }
            ],
            "type": "basic"
        }
"""

let leftLayer = """
,
        {
            "from": { "key_code": "left_option" },
            "to": [
                {
                    "set_variable": {
                        "name": "control mode",
                        "value": 0
                    }
                },
                {
                    "set_variable": {
                       "name": "left layer",
                       "value": 0
                    }
                },
                {
                    "set_variable": {
                        "name": "right layer",
                        "value": 0
                    }
                },
                { "key_code": "left_option" }],
            "to_if_alone": [
                {
                    "set_variable": {
                        "name": "control mode",
                        "value": 0
                    }
                },
                {
                    "set_variable": {
                       "name": "left layer",
                       "value": 1
                    }
                },
                {
                    "set_variable": {
                        "name": "right layer",
                        "value": 0
                    }
                }
            ],
            "type": "basic"
        }
"""

let rightLayer = """
,
        {
            "from": { "key_code": "right_control" },
            "to": [
                {
                    "set_variable": {
                        "name": "control mode",
                        "value": 0
                    }
                },
                {
                    "set_variable": {
                       "name": "left layer",
                       "value": 0
                    }
                },
                {
                    "set_variable": {
                        "name": "right layer",
                        "value": 0
                    }
                },
                { "key_code": "right_control" }],
            "to_if_alone": [
                {
                    "set_variable": {
                        "name": "control mode",
                        "value": 0
                    }
                },
                {
                    "set_variable": {
                       "name": "left layer",
                       "value": 0
                    }
                },
                {
                    "set_variable": {
                        "name": "right layer",
                        "value": 1
                    }
                }
            ],
            "type": "basic"
        }
"""

let typingMode = """
,
        {
            "from": { "key_code": "left_shift" },
            "to": [
                { "key_code": "left_shift" }
            ],
            "to_if_alone": [
                {
                    "set_variable": {
                        "name": "control mode",
                        "value": 0
                    }
                },
                {
                    "set_variable": {
                       "name": "left layer",
                       "value": 0
                    }
                },
                {
                    "set_variable": {
                        "name": "right layer",
                        "value": 0
                    }
                }
            ],
            "type": "basic"
        }
"""

let spaceKey = """
,
        {
            "from": { "key_code": "spacebar" },
            "to": [
                { "key_code": "left_shift" }
            ],
            "to_if_alone": [
                { "key_code": "spacebar" }
            ],
            "type": "basic"
        }
"""

func addModifiers() {
    manipulators.append(control)
    manipulators.append(leftLayer)
    manipulators.append(rightLayer)
    manipulators.append(typingMode)
//    manipulators.append(spaceKey)
}
