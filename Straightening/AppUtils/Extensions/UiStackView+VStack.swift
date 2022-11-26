//
//  uiStackView+VsStack.swift
//  Straightening
//
//  Created by user220831 on 11/17/22.
//

import Foundation
import UIKit

class VStack: UIStackView {

    init(spacing: CGFloat = 16, distribution: UIStackView.Distribution = .fill,
                                alignment: UIStackView.Alignment = .fill,
                                addArrangedSubviews views: [UIView]) {
        super.init(frame: .zero)
        self.addArrangedSubviews(views)
        self.axis = .vertical
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
