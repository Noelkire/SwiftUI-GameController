//
//  JoyStickUIApp.swift
//  JoyStickUI
//
//  Created by Erik Leon on 8/21/22.
//

import SwiftUI

// Visual effect est la pour rendre le fond effet transparent
struct VisualEffect: NSViewRepresentable {
    var window:NSWindow?
    
    init() {
        self.window = NSWindow()
    }
    
  func makeNSView(context: Self.Context) -> NSView {
      let view = NSView()
      let vfx = NSVisualEffectView()
      vfx.material = .hudWindow
      vfx.state = NSVisualEffectView.State.active  // this is this state which says transparent all of the time
      return vfx }

  func updateNSView(_ nsView: NSView, context: Context) { }
}

@main
struct JoyStickUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(VisualEffect())
        }
        .windowStyle(.hiddenTitleBar)
    }
}
