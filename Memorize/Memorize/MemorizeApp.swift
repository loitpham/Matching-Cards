//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Loi Pham on 4/2/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}
