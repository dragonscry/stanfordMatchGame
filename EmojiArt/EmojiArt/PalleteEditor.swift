//
//  PalleteEditor.swift
//  EmojiArt
//
//  Created by Denys on 09.03.2022.
//

import SwiftUI

struct PalleteEditor: View {
    @Binding var palette: Palette
    
    var body: some View {
        Form {
            Section(header: Text("Name")){
                TextField("Name", text: $palette.name)
            }
        }
        .frame(minWidth: 300, minHeight: 350)
    }
}

struct PalleteEditor_Previews: PreviewProvider {
    static var previews: some View {
        PalleteEditor(palette: .constant(PaletteStore(named: "Preview").palette(at: 4)))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/))
    }
}
