//
//  ConnectYourWalletView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 05/02/22.
//

import SwiftUI

struct ConnectYourWalletView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                header
                
                content
                
                footer
            }
            .background(Color.white)
            .cornerRadius(15)
            .padding()
        }
    }
}

extension ConnectYourWalletView {
    var header: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "i.circle")
                    .foregroundColor(Color.red)
                
                Text("Note: ALL hardware wallets WILL NOT be able to interact with DEX. Please use a browser extension wallet. ")
                    .font(.callout.bold()) +
                Text("Read more.")
                    .underline()
                    .font(.callout)
            }
            .padding()
            
            Divider()
        }
        .background(Color.gray.opacity(0.1))
    }
    
    var content: some View {
        VStack {
            HStack {
                Text("Connect Your Wallet")
                    .font(.title2)
                .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    isVisible.toggle()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                })
            }
            
            CheckboxView()
                .padding(.bottom)
            
            WalletOptionView(name: "Nami", image: "nami", colors: [Color("NamiBackgroundColor1"), Color("NamiBackgroundColor2")])
            
            WalletOptionView(name: "ccvault.io", image: "ccvault", colors: [Color("VaultBackgroundColor1"), Color("VaultBackgroundColor2")])
        }
        .padding()
    }
    
    var footer: some View {
        VStack(spacing: 0) {
            Text("New to Cardano?")
                .fontWeight(.semibold)
        
            Text("Learn more about wallets")
        }
        .font(.caption)
        .padding()
    }
}

struct CheckboxView: View {
    @State var isChecked = false
    
    var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .onTapGesture {
                    isChecked.toggle()
                }
            
            Text("By connecting your wallet you agree to our ")
                .font(.callout)
            + Text("Disclaimer")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color.accentColor)
            + Text(", ")
                .font(.callout)
            + Text("Use Terms ")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color.accentColor)
            + Text("and our ")
                .font(.callout)
            + Text("Privacy Policy")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color.accentColor)
            + Text(".")
                .font(.callout)
        }
        .padding()
        .background(isChecked ? Color.green.opacity(0.1) : Color.accentColor.opacity(0.1))
        .cornerRadius(8)
    }
}

struct WalletOptionView: View {
    var name: String
    var image: String
    var colors: [Color]
    
    var body: some View {
        HStack {
            Text(name)
                .foregroundColor(.white)
            
            Spacer()
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25)
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(8)
    }
}

struct ConnectYourWalletView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectYourWalletView(isVisible: .constant(true))
    }
}
