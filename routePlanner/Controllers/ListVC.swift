//
//  ListVC.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    fileprivate var listVM = ImageListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        self.setupViews()
        self.fetchImagesAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupNavigation()
    }
    
    // MARK: - API Call
    
    fileprivate func fetchImagesAPI() {
        self.listVM.fetchList(inputView: self)
    }
    
    // MARK: - Setup Views

    fileprivate func setupViews() {
        
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.showsVerticalScrollIndicator = false
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.register(UINib(nibName: CellList.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: CellList.cellIdentifier)

        self.listVM.delegate = self
    }
    
    // MARK: - Setup Navigation
    
    fileprivate func setupNavigation() {
        NAVIGATION.setNavigationTitle(strTitle: "Gallery", aViewController: self)
    }
}

// MARK: - UICollectionview delegate & datasource

extension ListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listVM.getImageInfoCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let aCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellList.cellIdentifier, for: indexPath) as! CellList
        DispatchQueue.main.async {
            aCell.setupImg(str: self.listVM.getImageList()[indexPath.row].urls.regular)
        }
        return aCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (SCREEN_WIDTH - 30)/2
        return CGSize(width: width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = GlobalStoryboard().imageDisplayVC
        vc.modalPresentationStyle = .overFullScreen
        let strImg = self.listVM.getImageList()[indexPath.row].urls.regular
        vc.strImg = strImg
        self.present(vc, animated: true)
    }
}
extension ListVC: SuccessAndErrorHandling {
    func successWithData<T>(for data: T, index: Int, message: String) {
        
        if message == "" {
            DispatchQueue.main.async {
                self.collectionview.reloadData()
            }
        }
    }
}
