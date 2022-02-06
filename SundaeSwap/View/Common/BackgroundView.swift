//
//  BackgroundView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 29/01/22.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            LinearGradient(
                gradient: Gradient(colors: [Color("BackgroundColor1"), Color("BackgroundColor2")]),
                startPoint: .leading,
                endPoint: .trailing)
            
            LinearGradient(
                gradient: Gradient(colors: [Color("BackgroundColor3"), Color.white.opacity(0)]),
                startPoint: .bottom,
                endPoint: .top)
            
            content
        }
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView {
            Image("froyo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 370, height: 370)
                .rotationEffect(Angle.init(degrees: 25))
                .opacity(0.5)
                .offset(x: 50)
                .padding(.bottom)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)
        }
    }
}
