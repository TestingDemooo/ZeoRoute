//
//  CellList.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import UIKit

class CellList: UICollectionViewCell {
    
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var img: ImageCache!
    
    static var cellIdentifier: String = {
        return "CellList"
    }()
    static var nibName: String = {
       return "CellList"
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.setupViews()

    }
    override func prepareForReuse() {
        super.prepareForReuse()
        img.image = nil
    }
    
    // MARK: - Setup Data
    
    func setupImg(str: String) {
        if let url = URL(string: str) {
            self.img.loadImages(from: url)
        }
    }

    // MARK: - Setup Views
    fileprivate func setupViews() {
        
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        
    }
}
