//
//  GameComponents.swift
//  JoyStickUI
//
//  Created by Erik Leon on 8/24/22.
//

import Foundation

struct Component {
    enum ComponentType {
        case button
        case trigger
        case shoulder
        case thumbstick
        case dpad
    }
    var type:ComponentType
    var name:String
    var xValue:Float = 0.0
    var yValue:Float = 0.0
    var isPressed:Bool = false
}
