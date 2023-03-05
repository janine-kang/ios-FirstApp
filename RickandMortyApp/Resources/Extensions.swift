//
//  Extensions.swift
//  RickandMortyApp
//
//  Created by Janine on 2023/03/05.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
