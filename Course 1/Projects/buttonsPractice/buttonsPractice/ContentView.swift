//
//  ContentView.swift
//  buttonsPractice
//
//  Created by Emilio D on 2/23/26.
//

import SwiftUI

func scream() {
    print("Ahhhhh!!")
}

struct ContentView: View {
    @State var isLiked = false
    @State var isScaled = false
    
    @State var gas: Double = 20
    @State var buttonColor: Color = .white
    
    @State var sheepIndex = 0
    
    @State var color1 = Color.blue
    @State var color2 = Color.blue
    
    var counting = ["one", "two", "three", "uh", "four", "five", "hmm", "six...", "...", "oh", "six seven", "eight", "nine", "...", "..."]
    var colors: [Color] = [.cyan, .green, .red, .yellow, .orange, .purple, .white, .black]
    
    func scale() {
        isScaled.toggle()
    }
    
    func toggleLike() {
        isLiked.toggle()
    }
    func blowUp() {
        gas *= 1.25
        if gas > 100 {
            gas = 1
        }
    }
    func shiftColor() {
        
        buttonColor = colors.randomElement() ?? .white
    }
    func countSheep() {
        sheepIndex += 1
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Divider()
            
            Button(action: scream) {
                Text("Boo!")
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.orange)
            .tint(.black)
            
            Button("Boo", systemImage: "fireworks", action: scale)
                .buttonStyle(.glass)
                .frame(width: isScaled ? 200: 100, height: isScaled ? 120: 60)
                .animation(.default, value: isScaled)
            
            Button(action: toggleLike) {
                Image(systemName: isLiked ? "heart.fill": "heart")
            }
            .padding()
            .buttonStyle(.plain)
            .foregroundStyle(.pink)
            
            Button { toggleLike() } label : { Image(systemName: "hand.thumbsup")}
                .buttonStyle(.borderedProminent)
            
            Button(action: blowUp) {
                Text("Don't Press ME!")
                    .font(.custom("Ariel", size: gas))
            }
            .padding()
            
            Button { toggleLike() } label: {
                Image(systemName: "hand.thumbsdown")
            }
            .disabled(!isLiked)
            .opacity(isLiked ? 1 : 0.5)
            .padding()
            
            Button(action: shiftColor) {
                Text("Press Me!")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .foregroundStyle(buttonColor)
            
            Button {
                color1 = colors.randomElement() ?? .blue
                color2 = colors.randomElement() ?? .blue
            } label: {
                Text("Press Me Too!")
                    .bold()
                    .frame(width: 345, height: 100)
            }
            .foregroundStyle(.black)
            .buttonStyle(.bordered)
            .background(
                LinearGradient(colors: [color1, color2], startPoint: .leading, endPoint: .trailing)
                    .clipShape(.capsule)
            )
            
            Button(action: countSheep) {
                Text("🐑: \(counting[sheepIndex % counting.count])")
                    .bold()
                    .padding()
            }
            
            Button(action: {}) {
            }
            .buttonStyle(BigBlockButtonStyle())
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
