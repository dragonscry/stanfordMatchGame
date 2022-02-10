//
//  PalletteStore.swift
//  EmojiArt
//
//  Created by Denys on 10.02.2022.
//

import Foundation

class PaletteStore: ObservableObject {
    let name: String
    
    @Published var palettes = [Palette]() {
        didSet {
            storeInUserDefaults()
        }
    }
    private var userDefaultsKey: String {
        "PaletteStore" + name
    }
    
    private func storeInUserDefaults() {
 //       UserDefaults.standard.set(palettes.map { [$0.name, $0.emojis, String($0.id)] } , forKey: userDefaultsKey)
        UserDefaults.standard.set(try? JSONEncoder().encode(palettes), forKey: userDefaultsKey)
    }
    
    private func restoreFromUserDefaults() {
//        if let palettesAsPropertyList = UserDefaults.standard.array(forKey: userDefaultsKey) as? [[String]] {
//            for palleteAsArray in palettesAsPropertyList {
//                if palleteAsArray.count == 3, let id = Int(palleteAsArray[2]), !palettes.contains(where: {$0.id == id}) {
//                    let palette = Palette(name: palleteAsArray[0], emojis: palleteAsArray[1], id: id)
//                    palettes.append(palette)
//                }
//            }
//        }
        if let jsonData = UserDefaults.standard.data(forKey: userDefaultsKey), let decodedPalettes = try? JSONDecoder().decode([Palette].self, from: jsonData) {
            palettes = decodedPalettes
        }
    }
    
    
    
    init(named name: String) {
        self.name = name
        restoreFromUserDefaults()
        if palettes.isEmpty {
            insertPalette(named: "Vehicles", emojis: "🚗🚕🚙")
            insertPalette(named: "Sports", emojis: "⚽️🏀🏈⚾️")
        } else {
            print("succes loaded")
        }
    }
    
    func palette(at index: Int) -> Palette {
        let safeIndex = min(max(index, 0), palettes.count - 1)
        return palettes[safeIndex]
    }
    
    @discardableResult
    func removaPalette(at index: Int) -> Int {
        if palettes.count > 1, palettes.indices.contains(index) {
            palettes.remove(at: index)
        }
        
        return index % palettes.count
    }
    
    func insertPalette(named name: String, emojis: String? = nil, at index: Int = 0) {
        let unique = (palettes.max(by: {$0.id < $1.id})?.id ?? 0) + 1
        let palette = Palette(name: name, emojis: emojis ?? "", id: unique)
        let safeIndex = min(max(index, 0), palettes.count)
        palettes.insert(palette, at: safeIndex)
    }
}

struct Palette: Identifiable, Codable {
    var name: String
    var emojis: String
    var id: Int
    
    fileprivate init(name: String, emojis: String, id: Int) {
        self.name = name
        self.emojis = emojis
        self.id = id
    }
}

