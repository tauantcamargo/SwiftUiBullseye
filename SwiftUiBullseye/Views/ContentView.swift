//
//  ContentView.swift
//  SwiftUiBullseye
//
//  Created by Tauan Camargo on 16/04/23.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game: Game = Game()
  
  
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      VStack {
        InstructionsView(game: $game)
        SliderView(sliderValue: $sliderValue)
        HitMeButton(game: $game, alertIsVisible: $alertIsVisible, sliderValue: $sliderValue)
      }
    }
  }
}

struct InstructionsView: View {
  @Binding var game: Game
  
  var body: some View {
    TitleView(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
      .padding(.horizontal, 30)
    BigNumberText(text: String(game.target))
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
        .frame(width: 35)
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
        .frame(width: 35)
    }
    .padding()
  }
}

struct HitMeButton: View {
  @Binding var game: Game
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  
  var body: some View {
    Button("Hit me".uppercased()) {
      alertIsVisible.toggle()
    }
    .foregroundColor(Color.white)
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(colors: [.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
      }
    )
    .overlay(
      RoundedRectangle(cornerRadius: 21.0)
        .strokeBorder(Color.white, lineWidth: 2.0)
    )
    .cornerRadius(21.0)
    .bold()
    .font(.title3)
    .alert("Hello There!", isPresented: $alertIsVisible, actions: {
      Button {
        
      } label: {
        Text("Hit me")
      }
    }, message: {
      let roundedValue = Int(sliderValue.rounded())
      Text("""
        The slider's value is \(roundedValue).
        You scored \(game.points(sliderValue: roundedValue)) points this round.
      """)
    })
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .previewInterfaceOrientation(.portrait)
      .previewLayout(.device)
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 14 Plus")
  }
}
