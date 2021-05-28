//
//  UIImageViewExtension.swift
//  MVVMTest
//
//  Created by Milton Orellana on 26/05/2021.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageURL: String) {
        self.kf.setImage(with: URL(string: imageURL))
    }
}
