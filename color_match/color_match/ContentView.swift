//
//  ContentView.swift
//  color_match
//
//  Created by Gideon S Crawley on 3/2/21.
//  Copyright © 2021 Make School. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    static func randomiser() -> Double {
        return Double.random(in: 0..<1)
    }
    
    @State var redActual = randomiser()
    @State var greenActual = randomiser()
    @State var blueActual = randomiser()
    
    @State var redSlider: Double
    @State var greenSlider: Double
    @State var blueSlider: Double


    
    var body: some View {
        VStack(spacing: 20){
            Text("Match this Color")
                .font(.largeTitle)
                .bold()
            HStack{
                Circle()
                    .fill(Color(red: redActual, green: greenActual,
                                blue: blueActual))
                    .padding()
                Circle().fill(Color(red: redSlider, green: greenSlider, blue: blueSlider))
                    .padding()
            }
            
            Sliders(value: $redSlider, color: .red, textColor: "Red")
            Sliders(value: $greenSlider, color: .green, textColor: "Green")
            Sliders(value: $blueSlider, color: .blue, textColor: "Blue")
            
            Button(action: {}) {
                Text("Submit")
            }.padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
                .background(Color(red: redActual, green: greenActual, blue: blueActual))
                .cornerRadius(.infinity)
                .foregroundColor(.white)
            
            Button(action: {}) {
                Text("Reset")
            }.padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
                .background(Color(red: redSlider, green: greenSlider, blue: blueSlider))
                .cornerRadius(.infinity)
                .foregroundColor(.white)
        }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(redSlider: 0.0, greenSlider: 0.0, blueSlider: 0.0)
    }
}

struct Sliders: View {
    @Binding var value: Double
    var color: Color
    var textColor: String
    
    var body: some View {
        VStack(){
            Text("\(textColor) (\(Int(value * 255) )) ")
                
            Slider(value: $value)
                .accentColor(.red)
                .padding()
        }
        .padding(.all, -12.0)
        
    }
}
 
