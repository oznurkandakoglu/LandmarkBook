//
//  DetailsVC.swift
//  LandmarkBook

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedName = ""
    var selectedImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkLabel.text = selectedName
        imageView.image = selectedImage
        
    }

}
