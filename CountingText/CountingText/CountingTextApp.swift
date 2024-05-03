//
//  CountingTextApp.swift
//  CountingText
//
//  Created by apple on 5/2/24.
//

import SwiftUI

@main
struct CountingTextApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
    
    private var statusItem: NSStatusItem?
    private var popover = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = ContentView()
        
        self.popover.behavior = .transient
        self.popover.animates = true
        self.popover.contentViewController = NSViewController()
        self.popover.contentViewController?.view = NSHostingView(rootView: contentView)
        
        popover.contentViewController?.view.window?.makeKey()
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let statusItem = statusItem?.button {
            statusItem.image = NSImage(systemSymbolName: "character.cursor.ibeam", accessibilityDescription: nil)
            statusItem.action = #selector(MenuButtonToggle)
        }
    }
    
    @objc func MenuButtonToggle(sender: AnyObject) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
            if let button = statusItem?.button {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
