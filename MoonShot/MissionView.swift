//
//  MissionView.swift
//  MoonShot
//
//  Created by Akash Sheelavant on 5/16/24.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                        
                    }
                    .padding(.top)
                Text(mission.formattedLaunchDateLongFormat)
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    RectangleDivider(height: 2, style: .lightBackground, font: nil)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                    Text(mission.description)
                    RectangleDivider(height: 2, style: .lightBackground, font: .title.bold())
                        .padding(.vertical)
                        .padding(.bottom, 5)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                HorizontalScrollView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
