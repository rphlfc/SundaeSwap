//
//  ContentView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 27/01/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $vm.selectedTabIndex) {
            HomeView()
                .tag(0)
            
            SwapView()
                .tag(1)
            
            LiquidityView()
                .tag(2)
            
            QueueView()
                .tag(3)
        }
        .overlay(
            HStack(spacing: 0) {
                ForEach(0 ..< menuItems.count) { i in
                    ZStack {
                        if vm.selectedTabIndex == i {
                            RoundedRectangle(cornerRadius: 4).fill(Color.accentColor.opacity(0.3))
                                .frame(width: 60, height: 60)
                                .matchedGeometryEffect(id: "tab", in: animation)
                        }
                        
                        VStack(spacing: 8) {
                            Image(systemName: menuItems[i].image)
                            
                            Text(menuItems[i].title)
                                .font(.caption)
                        }
                        .foregroundColor(vm.selectedTabIndex == i ? .primary : .gray)
                        .onTapGesture {
                            vm.clearTokens()
                            
                            withAnimation {
                                vm.selectedTabIndex = i
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(
                Color("BackgroundColor")
                    .clipShape(RoundedCorner(radius: 15, corners: [.topLeft, .topRight]))
                    .ignoresSafeArea(.all, edges: .bottom)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 0)
            )
            
            , alignment: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HomeViewModel())
    }
}
