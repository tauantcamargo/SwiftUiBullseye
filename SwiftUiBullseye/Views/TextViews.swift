//
//  TextViews.swift
//  SwiftUiBullseye
//
//  Created by Tauan Camargo on 16/04/23.
//

import SwiftUI


struct TitleView: View {
  var text: String
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
      .kerning(2.0)
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
  }
}

struct SliderLabelText: View {
  var text: String
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      TitleView(text: "Instructions")
      BigNumberText(text: "999")
      SliderLabelText(text: "100")
    }
  }
}
