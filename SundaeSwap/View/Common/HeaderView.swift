//
//  HeaderView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 05/02/22.
//

import SwiftUI

struct HeaderView<Content: View>: View {
    let content: Content
    
    @State var showConnectYourWalletView = false
    @Environment(\.openURL) var openURL
    @State var showQuickMenuView = false
    
    @Environment(\.colorScheme) var colorScheme
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                buttons
                
                content
                
                Spacer(minLength: 0)
            }
            
            if showConnectYourWalletView {
                ConnectYourWalletView(isVisible: $showConnectYourWalletView)
            }
            
            if showQuickMenuView {
                QuickMenuView(isVisible: $showQuickMenuView)
            }
        }
    }
}

extension HeaderView {
    private var buttons: some View {
        HStack(spacing: 8) {
            Image("sundae")
                .resizable()
                .frame(width: 40, height: 40)
            
            Spacer(minLength: 0)
            
            Button(action: {
                showConnectYourWalletView.toggle()
            }, label: {
                Text("Connect Wallet")
                    .font(.callout)
                    .frame(height: 40)
                    .padding(.horizontal)
                    .background(Color("BackgroundColor"))
                    .foregroundColor(Color("TextColor"))
                    .cornerRadius(8)
            })
            
            Button(action: {
                openURL(URL(string: "https://help.sundaeswap.finance/en/")!)
            }, label: {
                Image(systemName: "questionmark.circle")
                    .font(.callout)
                    .frame(width: 40, height: 40)
                    .background(Color("BackgroundColor"))
                    .foregroundColor(.primary)
                    .cornerRadius(8)
            })
            
            Button(action: {
                showQuickMenuView.toggle()
            }, label: {
                Image(systemName: "circle.grid.3x3.fill")
                    .font(.callout)
                    .frame(width: 40, height: 40)
                    .background(Color("BackgroundColor"))
                    .foregroundColor(.primary)
                    .cornerRadius(8)
            })
        }
        .padding(.horizontal)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView {
            Text("Content")
        }
    }
}
