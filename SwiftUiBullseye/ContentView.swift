//
//  ContentView.swift
//  SwiftUiBullseye
//
//  Created by Tauan Camargo on 16/04/23.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var sliderValue: Double = 50.0
  
  var body: some View {
    VStack {
      Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
        .kerning(2.0)
      Text("89")
        .kerning(-1.0)
        .font(.largeTitle)
        .fontWeight(.black)
      HStack {
        Text("1")
          .bold()
          .padding()
        Slider(value: $sliderValue, in: 1.0...100.0)
        Text("100")
          .bold()
          .padding()
      }
      Button {
        alertIsVisible.toggle()
      } label: {
        Text("Hit me")
      }
      .alert("Hello There!", isPresented: $alertIsVisible, actions: {
        Button {
        } label: {
          Text("Hit me")
        }
      }, message: {
        var roundedValue: Int = Int(sliderValue.rounded())
        Text("The slider's value is \(roundedValue)")
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
