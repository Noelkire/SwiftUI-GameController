//
//  JoyStickManager.swift
//  JoyStickUI
//
//  Created by Erik Leon on 8/21/22.
//

import Foundation
import GameController

class JoystickManager:ObservableObject {
    // Game Controller Properties
    @Published var gameControllerMapping = [Component(type: .thumbstick, name: "Left"),
                                            Component(type: .thumbstick, name: "Right"),
                                            Component(type: .shoulder, name: "Left"),
                                            Component(type: .shoulder, name: "Right"),
                                            Component(type: .trigger, name: "Left"),
                                            Component(type: .trigger, name: "Right"),
                                            Component(type: .button, name: "Menu"),
                                            Component(type: .button, name: "Options")
    ]
    
    init() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.GCControllerDidConnect, object: nil, queue: nil, using: handleControllerDidConnect)
        NotificationCenter.default.addObserver(forName: NSNotification.Name.GCControllerDidDisconnect, object: nil, queue: nil, using: handleControllerDidDisconnect)
        GCController.startWirelessControllerDiscovery()
    }
    func handleControllerDidConnect(_ notification: Notification) {
        guard let gameController = notification.object as? GCController else {
            return
        }
        registerGameController(gameController)
    }
    func handleControllerDidDisconnect(_ notification: Notification) {
        guard let gameController = notification.object as? GCController else {
            return
        }
    }
    func registerGameController(_ gameController: GCController) {
        if let gamepad = gameController.extendedGamepad {
            gamepad.leftThumbstick.valueChangedHandler = { (button,xvalue,yvalue) in self.valueHandler(0,xvalue: xvalue, yvalue: yvalue)}
            gamepad.leftThumbstickButton?.pressedChangedHandler = { (button,value,pressed) in self.pressedHandler(0,isPressed: pressed)}
            gamepad.rightThumbstick.valueChangedHandler = { (button,xvalue,yvalue) in self.valueHandler(1,xvalue: xvalue, yvalue: yvalue)}
            gamepad.rightThumbstickButton?.pressedChangedHandler = { (button,value,pressed) in self.pressedHandler(1,isPressed: pressed)}
            gamepad.leftShoulder.pressedChangedHandler = { (button,value,pressed) in self.pressedHandler(2,isPressed: pressed)}
            gamepad.rightShoulder.pressedChangedHandler = { (button,value,pressed) in self.pressedHandler(3,isPressed: pressed)}
            gamepad.leftTrigger.pressedChangedHandler = { (button,value,pressed) in self.pressedHandler(4,isPressed: pressed)}
            gamepad.rightTrigger.pressedChangedHandler = { (button,value,pressed) in self.pressedHandler(5,isPressed: pressed)}
            gamepad.buttonOptions?.pressedChangedHandler = { (button,value,pressed) in self.pressedHandler(6,isPressed: pressed)}
            gamepad.buttonMenu.pressedChangedHandler = { (button,value,pressed) in self.pressedHandler(7,isPressed: pressed)}
            
        }
    }
    func valueHandler(_ index:Int,xvalue:Float,yvalue:Float) {
        gameControllerMapping[index].xValue = xvalue
        gameControllerMapping[index].yValue = yvalue
    }
    func pressedHandler(_ index:Int,isPressed:Bool) {
        gameControllerMapping[index].isPressed = isPressed
    }
}
