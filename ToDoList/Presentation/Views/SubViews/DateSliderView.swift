//
//  DateSliderView.swift
//  SwiftUI_MVVM
//
//  Created by Swayambhu BANERJEE on 09/02/26.
//

import SwiftUI

struct DateSliderView<DateViewContent: View>: View {
    
    @ObservedObject var viewModel: TaskPageViewModel
    @State private var activeTab: Int = 1
    @State private var position = CGSize.zero
    @GestureState private var dragOffSet =  CGSize.zero
    @State private var direction: SliderTimeDirection = .unknown
    
    let dateViewContent: (_ week: WeekModel) -> DateViewContent
    
    init(viewModel: TaskPageViewModel, dateViewContent: @escaping (_ week: WeekModel) -> DateViewContent) {
        self.viewModel = viewModel
        self.dateViewContent = dateViewContent
    }
    
    var body: some View {
        TabView(selection: $activeTab) {
            dateViewContent(viewModel.weeks[0])
                .frame(maxWidth: .infinity)
                .tag(0)
            dateViewContent(viewModel.weeks[1])
                .frame(maxWidth: .infinity)
                .tag(1)
                .onDisappear() {
                    guard direction != .unknown else { return }
                    viewModel.onDateScrolled(to: direction)
                    // To keep the displayed week as current week
                    direction = .unknown
                    activeTab = 1
                }
            dateViewContent(viewModel.weeks[2])
                .frame(maxWidth: .infinity)
                .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onChange(of: activeTab) { _, value in
            if value == 0 {
                direction = .past
            } else if value == 2 {
                direction = .future
            }
        }
    }
}

#Preview {
    TaskHomePage()
}
