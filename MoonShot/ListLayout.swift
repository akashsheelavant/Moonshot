//
//  ListLayout.swift
//  MoonShot
//
//  Created by Akash Sheelavant on 7/8/24.
//

import SwiftUI

struct ListLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                            .padding()
                        VStack {
                            Text(mission.displayName)
                                .font(.title2)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.headline)
                                .foregroundStyle(.white.opacity(0.5))
                            
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
                
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
    
    init(missions: [Mission], astronauts: [String: Astronaut]) {
        self.missions = missions
        self.astronauts = astronauts
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return ListLayout(missions: missions, astronauts: astronauts)
}
