//
//  QueueView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 29/01/22.
//

import SwiftUI

struct QueueView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ZStack {
            BackgroundView {
                EmptyView()
            }
            
            HeaderView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Pool Queues, by Depth")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Approximate number of processable orders in queue for the deepest pools. All other pools operating normally.")
                            .font(.callout)
                        
                        VStack(spacing: 0) {
                            ForEach(0 ..< 4, id:\.self) { i in
                                let pool = vm.pools[i]
                                
                                VStack(spacing: 0) {
                                    QueueRowView(pool: pool, index: i)
                                        .clipShape(RoundedCorner(radius: pool.id == vm.pools.first?.id ? 15 : pool.id == vm.pools.last?.id ? 15 : 0, corners: pool.id == vm.pools.first?.id ? [.topLeft, .topRight] : pool.id == vm.pools.last?.id ? [.bottomLeft, .bottomRight] : []))
                                        .onTapGesture {
                                            withAnimation {
                                                vm.pools[i].isExpanded.toggle()
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
                    }
                    .padding()
                }
            }
        }
    }
}

struct QueueRowView: View {
    var pool: Pool
    var index: Int
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                VStack(alignment: .leading) {
                    Text("Position")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("\(index)")
                }
                
                HStack(spacing: 0) {
                    Image(pool.token1.image)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .background(Color.accentColor.opacity(0.4))
                        .clipShape(Circle())
                    
                    Image(pool.token2.image)
                        .resizable()
                        .frame(width: 30, height: 30)
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
                }
                .padding(.leading, -10)
                
                Spacer(minLength: 0)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Depth Count")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                GeometryReader { reader in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 18)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor1"), Color.accentColor]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: (CGFloat(pool.depth) * reader.size.width) / 7000, height: 18)
                        
                        Text("\(pool.depth)")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding(.leading)
                    }
                }
            }
        }
        .padding()
        .background(Color("BackgroundColor"))
    }
}

struct QueueView_Previews: PreviewProvider {
    static var previews: some View {
        QueueView()
            .environmentObject(HomeViewModel())
    }
}
