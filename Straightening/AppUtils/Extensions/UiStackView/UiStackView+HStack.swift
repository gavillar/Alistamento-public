//
//  UiStackView+HStack.swift
//  Straightening
//
//  Created by user220831 on 11/17/22.
//

import Foundation
import UIKit

class HStack: VStack {

    override init(spacing: CGFloat = 16,
                  distribution: UIStackView.Distribution = .fill,
                  alignment: UIStackView.Alignment = .fill,
                  addArrangedSubviews views: [UIView]) {

        super.init(spacing: spacing, distribution: distribution,
                   alignment: alignment, addArrangedSubviews: views)
        axis = .horizontal
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIStackView {
    func addArrangedSubviewList(views: UIView ...)  {
        views.forEach({addArrangedSubview($0)})
    }
}
