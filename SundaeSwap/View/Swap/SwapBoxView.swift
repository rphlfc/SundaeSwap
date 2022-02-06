//
//  SwapBoxView.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 05/02/22.
//

import SwiftUI

struct SwapBoxView: View {
    var token: Token?
    
    var body: some View {
        VStack {
            HStack {
                Text("0")
                
                Spacer()
                
                HStack {
                    if token != nil {
                        Image(token!.image)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                    }
                    
                    Text(token != nil ? token!.name : "SELECT")
                        .font(.callout)
                        .fontWeight(.semibold)
                        
                    Image(systemName: "chevron.down")
                        .font(.caption)
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color("BackgroundColor"))
                .cornerRadius(8)
            }
            
            Spacer(minLength: 0)
        }
        .frame(height: 90)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
    }
}

struct SwapBoxView_Previews: PreviewProvider {
    static var previews: some View {
        SwapBoxView(token: ada)
    }
}
