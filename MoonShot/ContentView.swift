//
//  ContentView.swift
//  MoonShot
//
//  Created by Akash Sheelavant on 3/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGrid = true
    
    var body: some View {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar(content: {
                ToolbarItem(placement: .automatic) {
                    Button(showingGrid ? "Show List" : "Show Grid") {
                        showingGrid = !showingGrid
                    }
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
