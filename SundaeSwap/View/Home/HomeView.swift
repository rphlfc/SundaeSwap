//
//  HomeView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 29/01/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ZStack {
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
            
            HeaderView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        welcome
                        
                        shortcuts
                        
                        SearchView(search: $vm.searchText, placeholder: "Search Pools")
                        
                        poolsList
                    }
                    .padding(.bottom, 40)
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

extension HomeView {
    private var welcome: some View {
        ZStack {
            Text("The Sweetest Decentralized Exchange in the Cardano Ecosystem")
                .font(.title)
                .fontWeight(.semibold)
            + Text(".")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color("AccentColor"))
        }
        .padding(.leading)
    }
    
    private var shortcuts: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(tokens) { token in
                    HStack(spacing: 15) {
                        Image(token.image)
                            .resizable()
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                        
                        Text(token.name)
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color("BackgroundColor"))
                    .cornerRadius(8)
                    .onTapGesture {
                        vm.swapToken(token)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private var poolsList: some View {
        VStack(spacing: 0) {
            ForEach(0 ..< vm.pools.count, id:\.self) { i in
                let pool = vm.pools[i]
                
                VStack(spacing: 0) {
                    PoolRowView(pool: pool)
                        .clipShape(RoundedCorner(radius: pool.id == vm.pools.first?.id ? 15 : pool.id == vm.pools.last?.id ? 15 : 0, corners: pool.id == vm.pools.first?.id ? [.topLeft, .topRight] : pool.id == vm.pools.last?.id ? [.bottomLeft, .bottomRight] : []))
                        .onTapGesture {
                            withAnimation {
                                vm.expandPoolAtIndex(i)
                            }
                        }
                    
                    if pool.id != vm.pools.last?.id {
                        Divider()
                            .background(Color.accentColor.opacity(0.3))
                    }
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
