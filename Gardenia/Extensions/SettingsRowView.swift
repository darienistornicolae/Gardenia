//
//  SettingsRowView.swift
//  Gardening
//
//  Created by Darie-Nistor Nicolae on 25.07.2023.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    let actionToggle: Binding<Bool>?
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.headline)
            
            if let actionToggle = actionToggle {
                Toggle(isOn: actionToggle, label: {
                    
                })
            }
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    @State static var sampleToggle = true
    
    static var previews: some View {
        Group {
            SettingsRowView(imageName: "gearshape", title: "With Toggle", tintColor: .blue, actionToggle: $sampleToggle)
            SettingsRowView(imageName: "gearshape", title: "Without Toggle", tintColor: .blue, actionToggle: nil)
        }
        .previewLayout(.sizeThatFits)
    }
}
