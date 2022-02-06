//
//  SwapView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 29/01/22.
//

import SwiftUI

struct SwapView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var inverted: Bool = false
    
    var token1: Token?
    var token2: Token?
    
    var body: some View {
        ZStack {
            BackgroundView {
                Image("fish")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 370, height: 370)
                    .opacity(0.5)
                    .offset(x: 50)
                    .padding(.bottom)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)
            }
            
            HeaderView {
                VStack(spacing: 0) {
                    Group {
                        Text("IMPORTANT NOTICE: ")
                            .font(.callout.bold())
                            .foregroundColor(Color.red) +
                        Text("The network is extremely congested at the moment. Swaps may fail or not go through until congestion decreses. Please be patient.")
                            .font(.callout)
                            .foregroundColor(Color.gray)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Swap")
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Text("Swap between native CARDANO tokens.")
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                        ZStack {
                            VStack {
                                SwapBoxView(token: vm.token1)
                                
                                SwapBoxView(token: vm.token2)
                            }
                            
                            Image(systemName: "arrow.down")
                                .foregroundColor(Color.primary)
                                .rotationEffect(Angle(degrees: inverted ? 0 : 180))
                                .padding(12)
                                .background(Color("BackgroundColor"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                .cornerRadius(8)
                                .onTapGesture {
                                    vm.invertTokens()
                                    
                                    withAnimation {
                                        inverted.toggle()
                                    }
                                }
                        }
                        
                        HStack(spacing: 4) {
                            Text("Slippage tolerance: 3%")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape")
                                    .font(.callout)
                                    .foregroundColor(.accentColor)
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Connect Wallet")
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(Color("LightGrayColor"))
                                .cornerRadius(15)
                        }
                    }
                    .padding()
                }
                .background(Color("BackgroundColor"))
                .cornerRadius(15)
                .padding()
            }
        }
    }
}

struct SwapView_Previews: PreviewProvider {
    static var previews: some View {
        SwapView(token1: nil, token2: tokens[0])
    }
}
