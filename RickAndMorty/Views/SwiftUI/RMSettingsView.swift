//
//  RMSettingsView.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 24.02.2024.
//

import SwiftUI

struct RMSettingsView: View {
    let viewModel: RMSettingsViewViewModel
    
    init(viewModel: RMSettingsViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.cellViewModels) { viewModel in
            HStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(Color.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.red)
                        .padding(8)
                        .background(Color(viewModel.iconContainerColor))
                        .clipShape(.rect(cornerRadius: 6))
                }
                Text(viewModel.title)
                    .padding(.leading, 10)
                
                Spacer()
            }
            .contentShape(Rectangle())
            .padding(.bottom, 3)
            .onTapGesture {
                viewModel.onTapHandler(viewModel.type)
            }
        }
    }
}

#Preview {
    RMSettingsView(viewModel: .init(cellViewModels: RMSettingsOption.allCases.compactMap {
        return RMSettingsCellViewModel(type: $0) { option in
            
        }
    }))
}
