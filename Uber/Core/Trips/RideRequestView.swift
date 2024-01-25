//
//  RideRequestView.swift
//  Uber
//
//  Created by Omkar Anarse on 21/01/24.
//

import SwiftUI

struct RideRequestView: View {
    
    @State private var selectedRideType : RideType =  .uberX
    @EnvironmentObject var locationViewModel : LocationSearchViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundStyle(Color(.systemGray3))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 40)
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 8, height: 6)
                }
                
                VStack(alignment: .leading, spacing: 24){
                    HStack {
                        Text("Current Location")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.gray)
                        Spacer()
                        Text(locationViewModel.pickUpTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.gray)
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        if let location = locationViewModel.selectedUberLocation {
                            Text(location.title)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        Spacer()
                        Text(locationViewModel.dropOffTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.leading, 8)
            }
            .padding()
            
            Divider()
            
            //ride type selection view
            Text("SUGGESTED RIDE")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal){
                HStack(spacing: 12) {
                    ForEach(RideType.allCases, id:  \.self){ rideType in
                        VStack {
                            Image(rideType.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading, spacing: 4){                            Text(rideType.discription)
                                    .font(.system(size: 14, weight: .semibold))
                                Text(locationViewModel.computeRidePrice(forType: rideType).toCurrency())
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding(8)
                            .foregroundStyle(rideType == selectedRideType ? .white : .black)
                        }
                        .frame(width: 112, height: 140)
                        .foregroundStyle(rideType == selectedRideType ? .white : Color.theme.primaryTextColor)
                        .background(rideType == selectedRideType ? .blue : Color.theme.secondaryBackgroundColor)
                        .scaleEffect(rideType == selectedRideType ? 1.2 : 1.0)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedRideType = rideType
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Divider().padding(.vertical, 8)
            
            //payment option View
            HStack(spacing: 12){
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .foregroundStyle(.white)
                    .padding(.leading)
                
                Text("****1234")
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .frame(height: 50)
            .background(Color(Color.theme.secondaryBackgroundColor))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
            
            //request ride button
            Button(action: {
                
            }, label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(.white)
            })
        }
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    RideRequestView()
}
