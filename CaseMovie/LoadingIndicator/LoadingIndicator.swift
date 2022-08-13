//
//  LoadingIndicator.swift
//  CaseMovie
//
//  Created by Winlentia on 13.08.2022.
//

import Foundation
import UIKit

class LoadingIndicator {
    
    static let sharedInstance = LoadingIndicator()
    
    let indicatorView = UIActivityIndicatorView(frame: .init(x: 0, y: 0, width: 40, height: 40))
    
    let containerView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 0/100, alpha: 0.4)
        return view
    }()
    
    init() {
        containerView.addSubview(indicatorView)
        
        indicatorView.center = containerView.center
        containerView.bringSubviewToFront(indicatorView)
        
    }
    
    func startAnimation() {
        guard let topController = UIApplication.getTopViewController() else { return }
        
        topController.view.addSubview(containerView)
        topController.view.bringSubviewToFront(containerView)
        indicatorView.startAnimating()
   }
    
    func stopAnimation() {
        indicatorView.stopAnimating()
        containerView.removeFromSuperview()
    }
}
