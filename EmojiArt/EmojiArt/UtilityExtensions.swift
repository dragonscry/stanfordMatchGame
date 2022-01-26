//
//  UtilityExtensions.swift
//  EmojiArt
//
//  Created by Denys on 26.01.2022.
//

import SwiftUI

extension Collection where Element: Identifiable {
    func index(matching element: Element) -> Self.Index? {
        firstIndex(where: {$0.id == element.id} )
    }
}
