//
//  ContentView.swift
//  profilePage
//
//  Created by Emilio D on 2/25/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    profileHeader
                    
                    profileInfo
                    
                    profileActions
                    
                    tabBar
                    
                    emptyContentView
                }
            }
            bottomTabBar
        }
        .background(Color.black)
    }
    
    var emptyContentView: some View {
        Color(.green)
            .frame(width: 380, height: 320)
            .cornerRadius(20)
            .overlay(
                VStack(spacing: 20) {
                    Image(systemName: "nosign")
                        .foregroundColor(.white)
                        .font(.system(size: 70))
                    Text("Not Good Content")
                        .padding()
                        .foregroundStyle(.white)
                        .bold()
                }
            )
    }
    func bottomTabItem(title: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
            Text(title)
                .font(.caption)
        }
        .foregroundStyle(.gray)
        .frame(maxWidth: .infinity)

    }
    var bottomTabBar: some View {
        HStack {
            bottomTabItem(title: "Home", image: "house")
            bottomTabItem(title: "Reels", image: "play.rectangle")
            
            ZStack {
                bottomTabItem(title: "Messages", image: "paperplane")
                
                Circle()
                    .fill(Color.blue.opacity(0.15))
                    .frame(width: 80, height: 80)
            }
            
            bottomTabItem(title: "Search", image: "magnifyingglass")
            bottomTabItem(title: "Profile", image: "person.crop.circle")
        }
        .background(Color.white)

    }
    var tabBar: some View {
        HStack {
            Image(systemName: "square.grid.3x3.fill")
                .foregroundColor(.green)
                .font(.system(size: 30))
            
            Spacer()
            Divider()
            Spacer()
            
            
            Image(systemName: "play.rectangle")
                .foregroundColor(.green)
                .font(.system(size: 30))
            
            Spacer()
            Divider()
            Spacer()
            
            Image(systemName: "person.crop.square")
                .foregroundColor(.green)
                .font(.system(size: 30))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .padding(.horizontal)
    }
    var profileActions: some View {
        HStack {
            Text("Edit Profile")
                .padding()
                .padding(.horizontal)
                .background(Color.gray)
                .cornerRadius(20)
                .foregroundStyle(.white)
                .bold()
            Text("Share Profile")
                .padding()
                .padding(.horizontal)
                .background(Color.gray)
                .cornerRadius(20)
                .foregroundStyle(.white)
                .bold()
            Image(systemName: "tag")
                .padding()
                .background(Color.gray)
                .cornerRadius(20)
                .foregroundStyle(.white)
                .bold()
        }
    }
    var profileInfo: some View {
        HStack {
            VStack {
                Text("1")
                    .font(.title)
                    .bold()
                Text("Posts")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            VStack {
                Text("15")
                    .font(.title)
                    .bold()
                Text("followers")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack {
                Text("21")
                    .font(.title)
                    .bold()
                Text("following")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
    var profileHeader: some View {
        HStack(spacing: 20) {
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Frederic Emilio")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                
                Text("fedxemilio")
                    .foregroundStyle(.gray)
                    .font(.title3)
            }
//                Spacer()
            
            
            Circle()
                .fill(Color.green)
                .frame(width: 120, height: 120)
                .overlay(
                    Image(systemName: "cat.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 70))
                )
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
