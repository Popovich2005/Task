//
//  ContentView.swift
//  Task
//
//  Created by Алексей Попов on 20.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskListView()
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)

}
