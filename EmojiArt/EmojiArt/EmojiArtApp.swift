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
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
