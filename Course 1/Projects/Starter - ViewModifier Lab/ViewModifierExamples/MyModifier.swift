//
//  MyModifier.swift
//  ViewModifierExamples
//
//  Created by Toby Youngberg on 9/15/25.
//

import SwiftUI

struct Squarify: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .border(.black, width: 2.5)
            .padding(5)
            .offset(x: 30, y: -20)
    }
}

extension View {
    func squarify() -> some View {
        modifier(Squarify())
    }
}

struct EccentuatedWords: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Futura", size: 24))
            .italic()
            .underline()
            .frame(width: 200, height: 250, alignment: .topLeading)
            .background(alignment: .bottom, content: {Color.red})
    }
}

extension View {
    func eccentuatedWords() -> some View {
        modifier(EccentuatedWords())
    }
}

