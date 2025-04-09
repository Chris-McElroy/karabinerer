//
//  modifiers.swift
//  karabinerer
//
//  Created by 4 on '25.4.8.
//

let control = """
,
        {
            "conditions": [
                {
                    "name": "recent control",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": { "key_code": "left_control" },
            "to": [
                {
                    "set_variable": {
                        "name": "control mode",
                        "value": 0
                    }
                },
                {
                    "set_variable": {
                        "name": "recent control",
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
                { "key_code": "left_control" }
            ],
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
            "from": { "key_code": "left_control" },
            "to": [
                {
                    "set_variable": {
                        "name": "recent control",
                        "value": 1
                    }
                },
                { "key_code": "left_control" }
            ],
            "to_if_alone": [
                {
                    "set_variable": {
                        "name": "control mode",
                        "value": 1
                    }
                }
            ],
            "to_delayed_action": {
                "to_if_invoked": [
                    {
                        "set_variable": {
                            "name": "recent control",
                            "value": 0
                        }
                    }
                ],
                "to_if_canceled": [
                    {
                        "set_variable": {
                            "name": "recent control",
                            "value": 0
                        }
                    }
                ]
            },
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "control mode",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": { "key_code": "left_control" },
            "to": [
                {
                    "set_variable": {
                        "name": "recent control",
                        "value": 1
                    }
                },
                { "key_code": "left_control" }
            ],
            "to_if_alone": [
                {
                    "set_variable": {
                        "name": "control mode",
                        "value": 0
                    }
                }
            ],
            "to_delayed_action": {
                "to_if_invoked": [
                    {
                        "set_variable": {
                            "name": "recent control",
                            "value": 0
                        }
                    }
                ],
                "to_if_canceled": [
                    {
                        "set_variable": {
                            "name": "recent control",
                            "value": 0
                        }
                    }
                ]
            },
            "type": "basic"
        }
"""

let leftLayer = """
,
        {
            "conditions": [
                {
                    "name": "left layer",
                    "type": "variable_if",
                    "value": 0
                }
            ],
            "from": { "key_code": "left_option" },
            "to": [{ "key_code": "left_option" }],
            "to_if_alone": [
                {
                    "set_variable": {
                        "name": "left layer",
                        "value": 1
                    }
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "left layer",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": { "key_code": "left_option" },
            "to": [
                {
                    "set_variable": {
                        "name": "left layer",
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
            "conditions": [
                {
                    "name": "right layer",
                    "type": "variable_if",
                    "value": 0
                }
            ],
            "from": { "key_code": "right_control" },
            "to": [{ "key_code": "right_control" }],
            "to_if_alone": [
                {
                    "set_variable": {
                        "name": "right layer",
                        "value": 1
                    }
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "right layer",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": { "key_code": "right_control" },
            "to": [
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

func addModifiers() {
    manipulators.append(control)
    manipulators.append(leftLayer)
    manipulators.append(rightLayer)
}
