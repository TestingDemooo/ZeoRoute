//
//  ImageDisplayVC.swift
//  routePlanner
//
//  Created by Hema M on 22/03/25.
//

import UIKit

class ImageDisplayVC: UIViewController {
    
    @IBOutlet weak var img: ImageCache!
    @IBOutlet weak var btnClose: UIButton!
    var strImg = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black.withAlphaComponent(0.8)
        
        self.setupViews()
        self.setupData()
    }
    
    // MARK: - Button Actions
    
    @objc fileprivate func btnCloseTapped() {
        self.dismiss(animated: true)
    }
    
    // MARK: - Setup Data

    fileprivate func setupData() {
        
        if let url = URL(string: strImg) {
            self.img.loadImages(from: url)
        }
    }

    // MARK: - Setup Views
    
    fileprivate func setupViews() {
        
        btnClose.setImage(UIImage(named: "icon_close")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnClose.imageView?.tintColor = .white
        btnClose.addTarget(self, action: #selector(btnCloseTapped), for: .touchUpInside)
        
        img.contentMode = .scaleAspectFill

    }
}
