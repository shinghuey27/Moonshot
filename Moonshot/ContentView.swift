//
//  ContentView.swift
//  Moonshot
//
//  Created by Shing Huey on 05/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingGrid = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if showingGrid {
                    GridLayout(missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                }
            }
            .transition(.opacity)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            showingGrid.toggle()
                        }                    }) {
                        Image(systemName: showingGrid ? "list.dash" : "square.grid.2x2")
                            .foregroundColor(.white)
                    }
                }
            }            .navigationTitle("Moonshot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
