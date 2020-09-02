//
//  ContentView.swift
//  ConvertTemperature
//
//  Created by Ekaterina Musiyko on 26/04/2020.
//  Copyright © 2020 Ekaterina Akchurina. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
  @State var degreeInput = ""
    let systems = ["C", "K", "F"]
    @State var currentSystem = 1
    var tempInKelvin: Double{
        let doubleInput = Double(degreeInput) ?? 0
        if currentSystem == 1{
            return doubleInput
        } else if currentSystem == 0 {
            return doubleInput + 273.15
        } else {
            return (doubleInput - 32) * 5 / 9 + 273.15
        }
    }
    var tempInCelsius: Double {
        let newTemp = tempInKelvin - 273.15
        return newTemp
    }
    var tempInFahrenheit: Double{
        let newTemp = (tempInKelvin - 273.15) * 9 / 5 + 32
        return newTemp
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input degrees and scale")) {
                    TextField("0.00", text: $degreeInput)
                        .keyboardType(.numbersAndPunctuation)
                    Picker("", selection: $currentSystem) {
                        ForEach(0..<3){
                            Text(self.systems[$0])
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                
                }
                
                Section (header: Text("Degrees in different systems:")){
                    Text("\(tempInCelsius, specifier: "%.2f") C")
                    Text("\(tempInKelvin, specifier: "%.2f") K")
                    Text("\(tempInFahrenheit, specifier: "%.2f") F")
                }
            }
        .navigationBarTitle("Converter")
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, .init(identifier: "ru"))
    }
}
