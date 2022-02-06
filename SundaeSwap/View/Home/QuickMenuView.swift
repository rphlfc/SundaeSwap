//
//  QuickMenuView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 05/02/22.
//

import SwiftUI

struct QuickMenuView: View {
    @Binding var isVisible: Bool
    @State var enableErrorReporting = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text("Quick Menu")
                        .font(.title2)
                        
                    Spacer()
                    
                    Button(action: {
                        isVisible.toggle()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.primary)
                    })
                }
                .foregroundColor(.primary)
                
                Text("Enable Error Reporting and stay up to date with SundaeSwap news on our socials.")
                    .foregroundColor(.gray)
                
                HStack {
                    SocialView(image: "twitter", name: "Twitter")
                    SocialView(image: "discord", name: "Discord")
                    SocialView(image: "medium", name: "Medium")
                }
                
                HStack {
                    Text("Enable Error Reporting")
                        .font(.caption)
                    
                    Spacer()
                 
                    ToggleView(isToggled: $enableErrorReporting)
                }
                
                Text("By opting into error reporting, you agree to share information about errors, which may include non-anonymized information (such as wallet addresses), with SundaeSwap Labs, Inc. and its third party service provider \"Raygun\". Submitted information will be used to address the issue and improve related systems. You can find our privacy policy ")
                    .font(.caption)
                    .foregroundColor(.gray)
                + Text("here")
                    .font(.caption)
                    .foregroundColor(Color.accentColor)
                + Text(".")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .foregroundColor(.gray)
            .padding()
            .background(Color("QuickMenuBackgroundColor"))
            .cornerRadius(15)
            .padding()
        }
    }
}

struct SocialView: View {
    var image: String
    var name: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 28)
                .foregroundColor(.black)
                
            Spacer()
            
            Text(name)
        }
        .foregroundColor(.primary)
        .frame(height: 70)
        .frame(maxWidth: .infinity)
        .padding(.vertical)
    }
}

struct ToggleView: View {
    @Binding var isToggled: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 6)
                .frame(width: 70, height: 6)
                .foregroundColor(.gray.opacity(0.4))
            
            Circle()
                .fill(isToggled ? Color.accentColor : Color.white)
                .frame(width: 25, height: 25)
                .overlay(Circle().strokeBorder(Color.accentColor, lineWidth: 6))
                .offset(x: isToggled ? 45 : 0)
        }
        .onTapGesture {
            withAnimation {
                isToggled.toggle()
            }
        }
    }
}

struct QuickMenuView_Previews: PreviewProvider {
    static var previews: some View {
        QuickMenuView(isVisible: .constant(true))
    }
}
