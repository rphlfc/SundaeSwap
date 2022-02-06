//
//  LiquidityView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 29/01/22.
//

import SwiftUI

struct LiquidityView: View {
    @State var search = ""
    
    var body: some View {
        ZStack {
            BackgroundView {
                Image("ice_cream_cup_front")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 370, height: 370)
                    .opacity(0.5)
                    .offset(x: 130)
                    .padding(.bottom)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)
            }
            
            HeaderView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Liquidity")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    SearchView(search: $search, placeholder: "Search your liquidity positions")
                        
                    VStack(alignment: .center, spacing: 20) {
                        Image("sundae_bowl_left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                        
                        Text("Sorry, looks like your wallet is not connected.")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text("Connect your wallet below to view your liquidity positions.")
                            .multilineTextAlignment(.center)
                        
                        Button {
                            
                        } label: {
                            Text("Connect Wallet")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .frame(width: 180, height: 50)
                                .background(Color.accentColor)
                                .cornerRadius(15)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("BackgroundColor"))
                    .cornerRadius(15)
                    .padding()
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    
                    Spacer()
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct LiquidityView_Previews: PreviewProvider {
    static var previews: some View {
        LiquidityView()
    }
}
