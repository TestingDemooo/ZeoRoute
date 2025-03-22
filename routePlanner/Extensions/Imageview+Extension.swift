//
//  Imageview+Extension.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import Foundation
import UIKit

class ImageCache: UIImageView {
    
    static var cache = NSCache<AnyObject, UIImage>()
    
    func loadImages(from url: URL) {
        if let cachedImage = ImageCache.cache.object(forKey: url as AnyObject) {
            self.image = cachedImage
            print("You get image from cache")
        }else{
            URLSession.shared.dataTask(with: url) { (data, respnse, error) in
                if let error = error {
                    print("Error: \(error)")
                }else if let data = data {
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                        ImageCache.cache.setObject(self.image!, forKey: url as AnyObject)
                        print("You get image from \(url)")
                    }
                }
            }.resume()
        }
    }
}
