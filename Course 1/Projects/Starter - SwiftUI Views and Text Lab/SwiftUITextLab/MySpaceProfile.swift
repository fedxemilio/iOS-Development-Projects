//
//  MySpaceProfile.swift
//  SwiftUITextLab
//
//  Created by Jane Madsen on 9/10/25.
//

import SwiftUI

/*
 ## Instructions:
 Your goal is to create an app that will serve as a social media profile. Use Text view modifiers to arrange and style your profile to reflect your unique style.
 
 Since this assignment will require you to choose custom fonts, you may want to open the Font Book app installed on your Mac, where you can view a list of the fonts available on Mac and iOS by default.
 
 If you would like to change the background color of each of these views, you can do so by changing the colors listed in each #Preview macro at the bottom of the page.
 
 1. Create three structs that conform to View: ProfileView, TopFiveFriendsView, and BlogPostView. This will fix the errors
 2. To see a preview of how each view will look in the app, make sure you have opened your canvas (Option + Command + Return). You can view each struct you've created by clicking on the tabs at the top of the canvas.
 3. Create a profile view with Text elements for each of the following items: Username, Real Name, Home City, and Bio. Style each of them appropriately with custom fonts, font sizes, and colors for each. Feel free to add any additional modifiers as well.
 4. Create a TopFiveFriends view with a list of your friends, ranked in order of favorite to least favorite. (Don't worry, we won't tell them). Use a different font and color for each person, and include an Emoji to represent each one as well.
 5. Create a BlogPostView. Write a long blog post. Give your blog post a title, a date posted, a body, and a display of number of likes and comments. Once again, style each individually with fonts, font sizes, and colors, and any other modifiers you would like.
 6. Try running the app. You should see all three views embedded in Tabs (the code for this is in SwiftUITextLabApp.swift). You may need to adjust the style slightly to accommodate the Tab Bar at the bottom of the screen.
 
 ## Black Diamond
 
 7. Add one or more Image views to each page.
 8. Use Stack views to arrange your content more dynamically.
 
 ## Rubric
 
 - App has a profile view with Username, Real Name, Home City, and Bio, appropriately filled out and styled.
 - App has a Top Five Friends screen with emoji, fonts, and colors for each friend.
 - App has a blog post view with a title, a date posted, a body, and a number of likes and comments. All are styled, sized, and colored appropriately.
 */

struct ProfileView: View {
    var body: some View {
        Circle()
            .fill(Color.green)
            .frame(width: 170, height: 170)
            .overlay(
                Image(systemName: "cat.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 90))
            )
        Text("fedxemilio")
            .font(.largeTitle)
            .bold()
            .shadow(radius: 10)
            .background(.ultraThinMaterial)
        Divider()
        Text("Frederic Emilio D")
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.green.opacity(0.1))
            )
            .font(.title)
            .foregroundStyle(.gray)
            .cornerRadius(12)
        Text("Tallahassee, Florida")
            .foregroundStyle(.secondary)
            .font(.title2)
        Text("𝒀ur mom ~🎶")
            .font(.title3)
            .padding()
    }
}

struct TopFiveFriendsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gui 🏴‍☠️")
                .underline()
                .background(.blue)
                .cornerRadius(12)
                .scaleEffect(2.5)
                .padding(30)
            Text("Jonny 🇨🇱")
                .background(RoundedRectangle(cornerRadius: 16)
                    .fill(Color.blue.opacity(0.5)))
                .scaleEffect(2.5)
                .padding(30)
            Text("Tony 🧑‍🍳")
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .scaleEffect(2.5)
                .padding(30)
            Text("Deanne 🎹")
                .background(
                    LinearGradient(
                        colors: [.purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(12)
                .scaleEffect(2.5)
                .padding(30)
            Text("Esteban 🦩")
                .border(.black, width: 2)
                .scaleEffect(2.5)
                .padding(30)
        }
    }
}

struct BlogPostView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Food Poisoning? Diarrhea?")
                    .bold()
                    
                Text("Feb 15, 2026")
            }
            Text("Woke up this morning feeling nasty. Couldn't make it to the bathroom without collapsing so I just laid there on the floor with my stomache hanging out. Like and repost if you like feel the saaaaame.")
                .padding()
                .background(Color.green.opacity(0.2))
                .cornerRadius(12)
            HStack(spacing: 26) {
                Text("\(Image(systemName: "heart")): 12")
                Text("\(Image(systemName: "bubble.right")): 421")
                Text("\(Image(systemName: "arrow.2.squarepath")): 1")
            }
        }

    }
}



#Preview("ProfileView") {
    ProfileView()
        .background(.white)
}

#Preview("TopFiveFriendsView") {
    TopFiveFriendsView()
        .background(.white)
}

#Preview("BlogPostView") {
    BlogPostView()
        .background(.white)
}
