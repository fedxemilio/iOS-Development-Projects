//
//  ContentView.swift
//  Hotel Registration App
//
//  Created by Jane Madsen on 9/26/25.
//Instructions:
//You are creating a registration app for a hotel, the Mountainland Inn. A starter project can be found in iOS Development/1 - Swift Fundamentals/Assignments/UI Elements and Controls Lab. Follow the instructions to create a screen where the customer can input their registration data.
//In HotelRegistrationScreen, add a header to the top of the screen. It should include the hotel’s logo and a text label with its name; you can find the image in the assets folder. Make sure that the logo is appropriately sized.
//The assets folder also includes a few Color Sets with the hotel’s brand colors. Place backgroundColor behind your view (you may wish to use a ZStack in ContentView to simplify doing this) and place a RoundedRectangle with highlightColor behind the logo and hotel name stack; make the hotel’s name be the same color as the background. Make the rest of the text in your app all colored with the textColor color set and the company’s preferred fonts, Verdana and Rockwell.
//Add @State properties for the following data to be collected from the customer: firstName, lastName, doorCode (a passcode for the hotel’s door number pads), numberOfGuests, lengthOfStay, nonSmoking, and registrationFeedback (which will hold a star rating from 1-5). Choose appropriate types for each field.
//Implement each UI Element one at a time: TextFields for the names, SecureField for the door code, a picker for numberOfGuests, a stepper for lengthOfStay, and a toggle for nonSmoking.
//Add a Button labelled “Submit.” Once pressed, it should toggle a boolean value called submitted.
//Add an if statement to the bottom of the view. If submitted == true, display a text label that says “Thank you for booking with us! How would you rate your experience?” Below the text, show a slider that updates registrationFeedback, with a Text label underneath that shows the rating they have selected (something like “1/5 ⭐️s”)
//Black Diamond
//Replace the background with a LinearGradient. Feel free to simply try making one, picking an initializer and figuring out the parameters yourself, or look up how to make one online.
//Add a date picker to select the check in and check out dates.
//Add a color picker. I’m not really sure why a hotel registration form would ask you to pick a color, so feel free to make up any reason you can imagine.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HotelRegistrationScreen()
    }
}

struct HotelRegistrationScreen: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var doorCode: String = ""
    @State var numberOfGuests: String = "One"
    @State var lengthOfStay: Int = 1
    @State var nonSmoking: Bool = true
    @State var registrationFeedback: String = ""
    @State var registrationRating: Double = 5
    
    @State var submitted = false
    let guestNumbers = ["One", "Two", "Three", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve"]
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Image("mountainlandLogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Mountainland Inn")
                    .foregroundStyle(.text)
                    .font(.title)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.highlight.opacity(0.5))
            )
            
            Divider()
            
            TextField("First Name", text: $firstName)
                .textFieldStyle(.roundedBorder)
            TextField("Last Name", text: $lastName)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Door Code", text: $doorCode)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            HStack {
            Text("Number of guests: ")
                    .foregroundStyle(.text)
                    .font(.custom("verdana", size: 20))
                Picker("Guests: \(numberOfGuests)", selection: $numberOfGuests) {
                    ForEach(guestNumbers, id: \.self) { number in
                        Text(number)
                    }
                }
                Spacer()
            }
            
            Stepper(value: $lengthOfStay, in: 1...12) {
                Text("Length of stay: \(lengthOfStay) Day(s)")
                    .foregroundStyle(.text)
                    .font(.custom("verdana", size: 20))
            }
            
            Toggle(isOn: $nonSmoking) {
                HStack {
                    Text("Non-smoking")
                    Image(systemName: "nosign")
                }
                .foregroundStyle(.text)
                .font(.custom("verdana", size: 20))
            }
            
            Spacer()
            
            if submitted {
                Text("Thank you for booking with us! How would you rate your experience?")
                    .foregroundStyle(.text)
                    .font(.custom("verdana", size: 20))
                    .fixedSize(horizontal: false, vertical: true)
                TextEditor(text: $registrationFeedback)
                VStack {
                    Slider(value: $registrationRating, in: 0...5, step: 1)
                    Text("Rating: \(Int(registrationRating))/5 ⭐️s")
                }
            } else {
                Button("Submit") {submitted.toggle()}
            }
        }
        .background(Color.background)
    }
}

#Preview {
    ContentView()
}
