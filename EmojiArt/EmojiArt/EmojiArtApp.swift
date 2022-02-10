//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Denys on 24.01.2022.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    let document = EmojiArtDocument()
    let palleteStore = PaletteStore(named: "Default Palette")
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
