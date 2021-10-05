//
//  PokemonCell.swift
//  Pokedex
//
//  Created by user206981 on 10/5/21.
//

import SwiftUI

struct PokemonCell: View {
    var body: some View {
        HStack {
         Image(systemName: "photo")
            VStack(alignment: .leading) {
             Text("My Pokemon").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
             Text("3 abilities")
         }
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell()
    }
}
