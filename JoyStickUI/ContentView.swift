//
//  ContentView.swift
//  JoyStickUI
//
//  Created by Erik Leon on 8/21/22.
//

import SwiftUI
import GameController

struct ContentView: View {
    @Binding var window:NSWindow
    
    @ObservedObject var joystick = JoystickManager()
    
    var body: some View {
        VStack{
            Image(systemName: "logo.xbox")
                .resizable()
                .frame(width: 50,height:50)
                .foregroundColor(.black)
            HStack{
                VStack{
                    TriggerButtonView(button: joystick.gameControllerMapping[4])
                    ShoulderButtonView(button: joystick.gameControllerMapping[2])
                }
                VStack{
                    TriggerButtonView(button: joystick.gameControllerMapping[5])
                    ShoulderButtonView(button: joystick.gameControllerMapping[3])
                }
            }
            HStack{
                ThumbstickView(thumbstick: joystick.gameControllerMapping[0])
                SecondaryButtonView(button: joystick.gameControllerMapping[6])
                SecondaryButtonView(button: joystick.gameControllerMapping[7])
                ThumbstickView(thumbstick: joystick.gameControllerMapping[1])
            }
        }
        .ignoresSafeArea()
        .onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification), perform: { _ in
                        NSApp.mainWindow?.standardWindowButton(.zoomButton)?.isHidden = true
                        NSApp.mainWindow?.standardWindowButton(.closeButton)?.isHidden = true
                        NSApp.mainWindow?.standardWindowButton(.miniaturizeButton)?.isHidden = true
                    })
        .padding()
        .frame(width: 400)
    }
}


struct ThumbstickView: View {
    let width:CGFloat = 80.0
    
    var thumbstick:Component
    
    var body: some View {
        VStack{
            Text("\(thumbstick.name) Thumbstick")
            Text("\(thumbstick.xValue)")
            Text("\(thumbstick.yValue)")
            Text("\(thumbstick.isPressed.description)")
            Circle()
                .foregroundColor(.gray)
                .frame(width: width,height: width)
                .overlay {
                    Circle()
                        .foregroundColor(.black)
                        .frame(width: width / 2,height: width / 2)
                        .offset(CGSize(width: CGFloat(thumbstick.xValue) * 40.0, height: CGFloat(thumbstick.yValue) * -40.0))
                }
        }
    }
}
struct SecondaryButtonView: View {
    let width:CGFloat = 20.0
    
    var button:Component
    
    var body: some View {
        VStack{
            Text("\(button.isPressed.description)")
            Image(systemName: button.isPressed ? "\(button.name).fill":"\(button.name)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:20,height:20)
        }
    }
}
struct ShoulderButtonView: View {
    let width:CGFloat = 100.0
    
    var button:Component
    
    var body: some View {
        VStack{
            Text("\(button.isPressed.description)")
            Image(systemName: button.isPressed ? "\(button.name).fill":"\(button.name)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40,height:40)
        }
    }
}
struct TriggerButtonView: View {
    let height:CGFloat = 90.0
    
    var button:Component
    
    var body: some View {
        Image(systemName: button.isPressed ? "\(button.name).fill":"\(button.name)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:40,height:40)
    }
}
