//
//  DateHeader.swift
//  SwiftUI_MVVM
//
//  Created by Swayambhu BANERJEE on 05/02/26.
//

import SwiftUI

struct DateHeader: View {
    @ObservedObject var viewModel: TaskPageViewModel
    
    var body: some View {
        VStack {
            makeHeaderView()
            DateSliderView(viewModel: viewModel) { week in
                DateView(viewModel: viewModel, week: week)
            }
            .frame(height: 60, alignment: .top)
            Divider()
            HStack {
                Spacer()
                Text(viewModel.selectedDate.toString("EEEE,dd.MM.yyyy"))
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
                Text(viewModel.getSelectedDate() == Calendar.current.startOfDay(for: Date()) ? "What's up for today?" : "planning for future?")
                    .font(.caption)
                    .fontWeight(.light)
                    .padding(4)
                
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(viewModel.getSelectedDate().monthToString())
                    .font(.system(size: 10))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Button {
                    withAnimation(.linear(duration: 0.1)) {
                        viewModel.selectTheDay(with: Date())
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
    TaskHomePage()
}
