//
//  LocationSearchResultCell.swift
//  Uber
//
//  Created by Omkar Anarse on 21/01/24.
//

import SwiftUI

struct LocationSearchResultCell: View {
    
    var title : String
    var subTitle : String
    
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundStyle(.blue)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.body)
                    .foregroundStyle(Color.black)
                
                Text(subTitle)
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.horizontal)
    }
}

#Preview {
    LocationSearchResultCell(title: "star Buks", subTitle: "123")
}
