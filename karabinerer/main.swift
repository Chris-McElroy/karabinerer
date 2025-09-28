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

var manipulators = start

addMinecraft()
addLaunchers()
addRandom()
addModifiers()
addNumbersLayer()
addSymbolsLayer()
addControlsLayer()

print(manipulators + end)

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

func getToText(key: String?, mods: [String]? = nil, typingMode: Bool = false) -> String {
    guard let key else { return "{ \"key_code\": \"vk_none\" }" }
    var output = !typingMode ? "" : """
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

func getToText(app: String) -> String {
    return """
                {
                    "software_function": {
                        "open_application": {
                            "bundle_identifier": "\(app)"
                        }
                    }
                }
"""
}

func getAppList(ifList: [String]? = nil, unlessList: [String]? = nil) -> String {
    var output = """
            "conditions": [
"""
    
    if let ifList {
        output += """
                {
                    "bundle_identifiers": [
                        "^\(ifList.joined(separator: "\", \""))"
                    ],
                    "type": "frontmost_application_if"
                }
"""
        if let unlessList { output += "," }
    }
    
    if let unlessList {
        output += """
                {
                    "bundle_identifiers": [
                        "^\(unlessList.joined(separator: "\", \""))"
                    ],
                    "type": "frontmost_application_unless"
                }
"""
    }
    
    return output + """
            ],
"""
}
