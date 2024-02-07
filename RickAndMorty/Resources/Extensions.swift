//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Никита Солодков on 07.02.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
