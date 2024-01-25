//
//  LocationSearchView.swift
//  Uber
//
//  Created by Omkar Anarse on 21/01/24.
//

import SwiftUI

struct LocationSearchView: View {
    
    @State private var startLocationText : String = ""
    @Binding var mapState : MapViewState
    @EnvironmentObject var viewModel : LocationSearchViewModel
    
    var body: some View {
        VStack {
            //header view
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack{
                   TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                         .frame(height: 32)
                         .background(Color(.systemGray4))
                         .padding(.trailing)

                }
            }
            .padding(.top, 64)
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical)
            
            //list view
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(viewModel.results, id:  \.self) { result in
                        LocationSearchResultCell(title: result.title, subTitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()){
                                    viewModel.queryFragment = ""
                                    viewModel.selectedLocation(result)
                                    mapState = .locationSelected
                                }
                            }
                    }
                }
            }
        }
        .background(Color.theme.backgroundColor)
        .background(Color.white)
    }
}

//#Preview {
//    LocationSearchView(mapState: .constant(.SearchingForLocation))
//}
