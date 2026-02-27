//
//  customButtonStyle.swift
//  buttonsPractice
//
//  Created by Emilio D on 2/24/26.
//

import Foundation
import SwiftUI

struct BigBlockButtonStyle: ButtonStyle {
    var string1 = "WOW!"
    var string2 = "wow"
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
                    Text("wow")
                        .opacity(configuration.isPressed ? 0 : 1)

                    Text("WOW!")
                        .opacity(configuration.isPressed ? 1 : 0)
                }
            .scaleEffect(configuration.isPressed ? 2: 1)
            .blur(radius: configuration.isPressed ? 0 : 0.5)
            .animation(.easeInOut, value: configuration.isPressed)
            .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.red)
                    )
                    .foregroundColor(.black)
    }
}
