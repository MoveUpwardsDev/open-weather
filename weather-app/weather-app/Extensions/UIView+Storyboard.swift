//
//  UIView+Storyboard.swift
//  weather-app
//
//  Created by lgriffie on 21/06/2021.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T? {
        Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as? T
    }
}
