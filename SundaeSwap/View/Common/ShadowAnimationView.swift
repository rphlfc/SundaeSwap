//
//  ShadowAnimationView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 30/01/22.
//

import SwiftUI

struct ShadowAnimationView: View {
    @Binding var animate: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .shadow(color: Color.accentColor, radius: animate ? 45 : 1, x: 0, y: 0)
            .opacity(animate ? 0 : 1)
            .animation(animate ? Animation.easeOut(duration: 0.2) : .none)
    }
}

struct ShadowAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowAnimationView(animate: .constant(false))
    }
}
