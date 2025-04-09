//
//  main.swift
//  karabinerer
//
//  Created by 4 on '25.4.8.
//

import Foundation


let start = """
{
    "description": "typing layers",
    "manipulators": [

"""

let end = """
        
    ]
}
"""

var manipulators = """
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

addModifiers()
addNumbersLayer()
addSymbolsLayer()
addControlsLayer()

print(start + manipulators + end)
    
func getFromText(key: String?, mandMods: [String]? = nil, optMods: [String]? = nil) -> String {
    guard let key else { return "\"key_code\": \"vk_none\"" }
    var output = "\"key_code\": \"\(key)\""
    
    if let mandMods {
        output += """
,
            "modifiers": { "mandatory": ["\(mandMods.joined(separator: "\", \""))"] }
"""
    } // TODO i'm not handling when there's both
    
    if let optMods {
        output += """
,
            "modifiers": { "optional": ["\(optMods.joined(separator: "\", \""))"] }
"""
    }
    
    return output
}

func getToText(key: String?, mods: [String]? = nil, controlOff: Bool = false) -> String {
    guard let key else { return "{ \"key_code\": \"vk_none\" }" }
    var output = !controlOff ? "" : """
        {
            "set_variable": {
                "name": "control mode",
                "value": 0
            }
        },
"""
    
    output += """

        {
            "key_code": "\(key)"
"""
    if let mods {
        output += """
,
            "modifiers": ["\(mods.joined(separator: "\", \""))"]
        }
"""
    } else {
        output += """

        }
"""
    }
    return output
}

