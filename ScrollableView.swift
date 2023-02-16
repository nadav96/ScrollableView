//
//  ScrollableView.swift
//
//  Created by Nadav Goldstein on 16/02/2023.
//

import UIKit

/// How to use?
/// 1. create a new uiview in the storyboard with correct constraints, and make it of type ScrollableView
/// 2. add to it a subview (named content) of **without** constraints related to it's superview (just width and height explicity or implicit by it's children)
/// 3. using assistant, bind the new subview to the IBOutlet **content**
/// 3. inside the content view, add the controller layout, using constraints that are top to bottom (so the app can determine it's height during runtime
///
/// **NOTE**, the only constraint error you should have is *missing height or Y constraint of the content view*
///
/// **NOTE 2** Even if the entire UI in the storyboard is broken, trust me, it can still work, just compile and run.
/// **NOTE 3** to modify the view, if the storyboard is broken, move the view out of the scrollable view and fix it to the view controller, 
/// and after finishing repeat those steps.
///
class ScrollableView: UIScrollView {
    @IBOutlet weak var content: UIView?
    
    
    override func awakeFromNib() {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let v = self.content {
            NSLayoutConstraint.activate([
                v.leadingAnchor.constraint(equalTo: self.contentLayoutGuide.leadingAnchor),
                v.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor),
                v.trailingAnchor.constraint(equalTo: self.contentLayoutGuide.trailingAnchor),
                v.bottomAnchor.constraint(equalTo: self.contentLayoutGuide.bottomAnchor),
                v.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ])
        }
    }

}
