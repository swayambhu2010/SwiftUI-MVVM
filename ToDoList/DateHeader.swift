//
//  DateHeader.swift
//  SwiftUI_MVVM
//
//  Created by Swayambhu BANERJEE on 05/02/26.
//

import SwiftUI

struct DateHeader: View {
    @EnvironmentObject var dateManager: DateManager
    
    var body: some View {
        VStack {
            makeHeaderView()
            DateSliderView { week in
                DateView(week: week)
            }
            .frame(height: 60, alignment: .top)
            Divider()
            HStack {
                Spacer()
                Text(dateManager.selectedDate.toString("EEEE,dd.MM.yyyy"))
                    .font(.system(size: 10, design: .rounded))
                    .foregroundColor(.gray)
                
            }
        }
    }
    
    private func makeHeaderView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hi Swayambhu")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(4)
                Text(dateManager.selectedDate == Calendar.current.startOfDay(for: Date()) ? "What's up for today?" : "planning for future?")
                    .font(.caption)
                    .fontWeight(.light)
                    .padding(4)
                
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(dateManager.selectedDate.monthToString())
                    .font(.system(size: 10))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Button {
                    withAnimation(.linear(duration: 0.1)) {
                        dateManager.selectToday()
                    }
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
    DateHeader().environmentObject(DateManager())
}
