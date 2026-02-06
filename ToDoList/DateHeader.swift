//
//  DateHeader.swift
//  SwiftUI_MVVM
//
//  Created by Swayambhu BANERJEE on 05/02/26.
//

import SwiftUI

struct DateHeader: View {
    var body: some View {
        makeHeaderView()
    }
    
    private func makeHeaderView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hi Swayambhu")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(4)
                Text("What's up for today?")
                    .font(.caption)
                    .fontWeight(.light)
                    .padding(4)
                
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("August")
                    .font(.system(size: 10))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Button {
                    // Action
                } label: {
                    Text("Today")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(.black)
                        .cornerRadius(4)
                }
            }
        }
    }
}

#Preview {
    DateHeader()
}
