//
//  ContentView.swift
//  JoyStickUI
//
//  Created by Erik Leon on 8/21/22.
//

import SwiftUI
import GameController

struct ContentView: View {
    @ObservedObject var joystick = JoystickManager()
    
    var body: some View {
        VStack{
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
            Text("\(button.name) Button")
            Text("\(button.isPressed.description)")
            Circle()
                .foregroundColor(button.isPressed ? .black:.gray)
                .frame(width: width,height: width)
        }
    }
}
struct ShoulderButtonView: View {
    let width:CGFloat = 100.0
    
    var button:Component
    
    var body: some View {
        VStack{
            Text("\(button.name) Shoulder")
            Text("\(button.isPressed.description)")
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(button.isPressed ? .black:.gray)
                .frame(width: width,height: 30)
        }
    }
}
struct TriggerButtonView: View {
    let height:CGFloat = 90.0
    
    var button:Component
    
    var body: some View {
        VStack{
            Text("\(button.name) Trigger")
            Text("\(button.isPressed.description)")
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(button.isPressed ? .black:.gray)
                .frame(width: 50,height: height)
        }
    }
}
