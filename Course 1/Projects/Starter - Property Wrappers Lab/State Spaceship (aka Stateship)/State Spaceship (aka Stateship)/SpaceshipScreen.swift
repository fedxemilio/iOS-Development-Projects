//
//  SpaceshipScreen.swift
//  State Spaceship (aka Stateship)
//
//  Created by Jane Madsen on 9/29/25.
//

import SwiftUI

@Observable
class ShipComputer {
    var availablePower = 10
    var heading = ""
    var powerOn = false
    var weaponsPower = 0
    var shieldPower = 0
    var enginePower = 0
}

struct SpaceshipScreen: View {
    @State var shipComputer = ShipComputer()
    var body: some View {
        Form {
            Section("Helm Station") {
                HelmStation(heading: $shipComputer.heading)
            }
            
            Section("Weapons Station") {
                WeaponsStation(shipComputer: $shipComputer)
            }
            
            Section("Shield Station") {
                ShieldStation(shipComputer: $shipComputer)
            }
            
            Section("Engine Station") {
                EngineStation(shipComputer: $shipComputer)
            }
            
            Text("Available Power: \(shipComputer.availablePower)")

        }
        .padding()
    }
}

struct HelmStation: View {
    @Binding var heading: String
    var body: some View {
        HStack {
            CrewChair(crewMember: .dog)
            
            TextField("Heading", text: $heading)
        }
    }
}

struct WeaponsStation: View {
    @Binding var shipComputer: ShipComputer
    var body: some View {
        HStack {
            CrewChair(crewMember: .cat)
            
            VStack {
                Toggle("Weapons Power: \(shipComputer.weaponsPower)", isOn: $shipComputer.powerOn)
                
                Button("Fire!") {
                    shipComputer.weaponsPower -= 1
                    if shipComputer.weaponsPower == 0 {
                        shipComputer.powerOn = false
                        shipComputer.availablePower += 3
                    }
                    print("PEW!")
                }
                .onChange(of: shipComputer.powerOn) {
                    if shipComputer.powerOn {
                        shipComputer.availablePower += 3
                        shipComputer.weaponsPower += 3
                    } else {
                        shipComputer.availablePower -= 3
                    }
                    
                    if shipComputer.availablePower > 10 {
                        shipComputer.powerOn = false
                        shipComputer.weaponsPower -= 3
                    }
                }
                .disabled(shipComputer.weaponsPower < 1)
            }
        }
    }
}

struct ShieldStation: View {
    @Binding var shipComputer: ShipComputer
    var body: some View {
        HStack {
            CrewChair(crewMember: .lizard)
            
            Stepper("Shield Power: \(shipComputer.shieldPower)", value: $shipComputer.shieldPower, in: 0...10)
        }
        .onChange(of: shipComputer.shieldPower) { oldValue, newValue in
            let difference = newValue - oldValue
            shipComputer.availablePower -= difference
            
            if shipComputer.availablePower < 0 {
                shipComputer.shieldPower = oldValue
            }
        }
    }
}

struct EngineStation: View {
    @Binding var shipComputer: ShipComputer
    var body: some View {
        HStack {
            CrewChair(crewMember: .hare)
            
            Stepper("Engine Power: \(shipComputer.enginePower)", value: $shipComputer.enginePower, in: 0...10)

        }
        .onChange(of: shipComputer.enginePower) { oldValue, newValue in
            let difference = newValue - oldValue
            shipComputer.availablePower -= difference
            
            if shipComputer.availablePower < 0 {
                shipComputer.enginePower = oldValue
            }
        }
    }
}

struct CrewChair: View {
    var crewMember: Crew
    @State var inChair: Bool = false
    
    var body: some View {
        Button {
            inChair.toggle()
        } label: {
            if inChair {
                crewMember.icon
                    .tint(.green)
            } else {
                Image(systemName: "person.slash")
            }
        }
        .padding(5)
        .background {
            Circle()
                .foregroundStyle(.gray)
        }
        .buttonStyle(.borderless)
    }
}

enum Crew: String {
    case dog
    case cat
    case lizard
    case hare
    
    var icon: Image {
        switch self {
        case .dog:
            Image(systemName: "dog.fill")
        case .cat:
            Image(systemName: "cat.fill")
        case .lizard:
            Image(systemName: "lizard.fill")
        case .hare:
            Image(systemName: "hare.fill")
        }
    }
}

#Preview {
    SpaceshipScreen()
}
