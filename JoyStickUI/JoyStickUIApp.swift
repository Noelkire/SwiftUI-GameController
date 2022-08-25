//
//  JoyStickUIApp.swift
//  JoyStickUI
//
//  Created by Erik Leon on 8/21/22.
//

import SwiftUI

// Visual effect est la pour rendre le fond effet transparent
struct VisualEffect: NSViewRepresentable {
    @State var window:NSWindow
    
  func makeNSView(context: Self.Context) -> NSView {
      let view = NSView()
      window.backgroundColor = .clear
      window.styleMask = [.hudWindow,.fullSizeContentView]
      
      let vfx = NSVisualEffectView()
      vfx.material = .hudWindow
      vfx.state = NSVisualEffectView.State.active
      
      view.addSubview(vfx)
      return vfx }

  func updateNSView(_ nsView: NSView, context: Context) { }
}

@main
struct JoyStickUIApp: App {
    @State var window = NSWindow()
    
    var body: some Scene {
        WindowGroup {
            ContentView(window: $window)
                .background(Color.clear)
                .background(VisualEffect(window: window))
        }
        .windowStyle(.hiddenTitleBar)
    }
}
