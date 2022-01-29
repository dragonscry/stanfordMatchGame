//
//  UtilityViews.swift
//  EmojiArt
//
//  Created by Denys on 29.01.2022.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        if uiImage != nil {
            Image(uiImage: uiImage!)
        }
    }
}
