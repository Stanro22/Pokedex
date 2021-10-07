//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by user206981 on 10/7/21.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @Environment(\.presentationMode) private var presentationMode
    @State private var didAppear = false
    @State private var catchPokemon = false
    
    var body: some View {
        VStack {
            Image(pokemon.originalName)
                .resizable()
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fit)
                
        }.navigationTitle(pokemon.name)
            .navigationBarItems(
                //leading:
                //Button("Go back") {
                    //presentationMode.wrappedValue.dismiss()
                //},
                trailing:
                NavigationLink(destination:
                    Text("My favourite pokemon is: \(pokemon.name)")
                ) {
                    Image(systemName: "star")
                }
            ).onAppear {
                didAppear = true
            }
            .scaleEffect(didAppear ? 1 : 2)
            .opacity(didAppear ? 1 : 0)
            .animation(.linear)
            .background(didAppear ? Color.blue : .white)
            .clipShape(RoundedRectangle(cornerRadius: didAppear ? 60 : 0))
            .padding()
            .animation(.interpolatingSpring(stiffness: 10, damping: 1)
                        .speed(3)
                        .delay(0.5)
            )
            .onTapGesture {
                withAnimation {
                    catchPokemon.toggle()
                }
            }
            if catchPokemon {
                Text("Pokemon is caught")
                    .font(.headline)
                    .transition(.opacity.combined(with: .slide))
            }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PokemonDetailView(pokemon: Pokemon.testPokemon)
        }
    }
}
