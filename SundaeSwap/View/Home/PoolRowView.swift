//
//  PoolRowView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 30/01/22.
//

import SwiftUI

struct PoolRowView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    var pool: Pool
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                HStack(spacing: 0) {
                    Image(pool.token1.image)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .background(Color.accentColor.opacity(0.4))
                        .clipShape(Circle())
                    
                    Image(pool.token2.image)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .offset(x: -10)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(pool.token1.name)/\(pool.token2.name)")
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text("\(pool.lpFee, specifier: "%0.1f")% LP Fee")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(2)
                    
                    if pool.farmingAvailable {
                        Text("Farming Available")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor2"), Color("BackgroundColor1")]), startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(.white)
                            .cornerRadius(2)
                    }
                }
                
                Spacer()
            }
            .padding()
            
            if pool.isExpanded {
                VStack {
                    VStack {
                        VStack(spacing: 8) {
                            HStack {
                                Text("Effective \(pool.token1.name) Price:")
                                    
                                Spacer(minLength: 0)
                                
                                Text("1 \(pool.token1.name) = 0.645577 \(pool.token2.name)")
                            }
                            
                            HStack {
                                Text("Effective \(pool.token2.name) Price:")
                                    
                                Spacer(minLength: 0)
                                
                                Text("1 \(pool.token2.name) = 1.548715 \(pool.token1.name)")
                            }
                            
                            HStack {
                                Text("Total Locked \(pool.token1.name):")
                                    
                                Spacer(minLength: 0)
                                
                                Text("16,708,246.99")
                            }
                            
                            HStack {
                                Text("Total Locked \(pool.token2.name):")
                                    
                                Spacer(minLength: 0)
                                
                                Text("10,788,456.3")
                            }
                        }
                        .font(.caption)
                        
                        HStack {
                            Button {
                                vm.swapTokens(token1: pool.token1, token2: pool.token2)
                            } label: {
                                Text("Swap \(pool.token1.name)/\(pool.token2.name)")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .frame(height: 60)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.accentColor.opacity(0.3))
                                    .cornerRadius(15)
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Provide Liquidity")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .frame(height: 60)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.accentColor.opacity(0.3))
                                    .cornerRadius(15)
                            }
                        }
                    }
                    .padding()
                        
                    Line()
                        .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 1, dash: [1]))
                        .frame(height: 1)
                    
                    VStack {
                        Text("Note: ")
                            .fontWeight(.semibold) +
                        Text("You currently do not have any LP Tokens for this pair. Before you can Yield Farm, please deposit liquidity and ensure you understand the risks involved. Learn more ") +
                        Text("here")
                            .foregroundColor(Color.accentColor)
                        
                        Button {
                            
                        } label: {
                            Text("Provide Liquidity")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .frame(height: 60)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                                .cornerRadius(15)
                        }
                    }
                    .padding()
                }
            }
        }
        .background(Color("BackgroundColor"))
    }
}

struct PoolRowView_Previews: PreviewProvider {
    static var previews: some View {
        PoolRowView(pool: samplePools[0])
    }
}
