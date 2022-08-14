//
//  Kingfisher+Extensions.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(withUrl: String?){
        guard let urlString = withUrl else {
            self.image = UIImage(named: "not-found")
            self.clipsToBounds = true
            self.contentMode = .center
            return
        }
        
        let modifier = AnyModifier { request in
            var r = request
            // replace "Access-Token" with the field name you need, it's just an example
            r.setValue(AppConstants.Config.movieToken, forHTTPHeaderField: "Authorization")
            return r
        }

        let url = URL(string: urlString)
        
        self.kf.setImage(with: url, options: [.requestModifier(modifier)]) { result in
            switch result {
            case .success(let result):
                self.image = result.image
            case .failure(_):
                self.image = UIImage(named: "not-found")
                self.clipsToBounds = true
                self.contentMode = .center
            }
        }

    }
}


