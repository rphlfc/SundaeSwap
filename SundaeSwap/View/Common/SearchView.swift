//
//  SearchView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 29/01/22.
//

import SwiftUI

struct SearchView: View {
    @Binding var search: String
    var placeholder: String
    @State var isFocusing: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeholder)
                .padding(.leading)
                .font(isFocusing ? .caption : .headline)
                .foregroundColor(isFocusing ? Color.accentColor : Color.gray)
                .offset(y: isFocusing ? 40 : 0)
                .zIndex(isFocusing ? 1 : 0)
                .animation(Animation.linear(duration: 0.1))
            
            TextField("", text: $search, onEditingChanged: { editing in
                isFocusing = editing
            })
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor1"), Color("BackgroundColor2")]), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                )
        }
        .background(Color("BackgroundColor").cornerRadius(15))
        .animation(.none)
        .background(ShadowAnimationView(animate: $isFocusing))
        .padding()
        .padding(.bottom, 8)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(search: .constant(""), placeholder: "Search")
    }
}
