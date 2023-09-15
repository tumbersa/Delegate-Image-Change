//
//  ViewController.swift
//  Delegate Image Change
//
//  Created by Глеб Капустин on 15.09.2023.
//

import UIKit

final class ImageViewController: UIViewController {
    
    
    private lazy var imageConverter = ImageBlackAndWhiteConverter(delegate: self)
    @IBOutlet weak var madeBlackAndWhiteButton: UIButton!
    @IBOutlet weak var pictageImageView: UIImageView!
    
    @IBAction func madeBlackAndWhiteAction(_ sender: Any) {
        imageConverter.convert(pictageImageView.image)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }


}

extension ImageViewController {
    func createUI(){
        view.backgroundColor = .lightGray
        pictageImageView.image = UIImage(named: "vrn")
        pictageImageView.layer.cornerRadius = 8
        pictageImageView.clipsToBounds = true
        pictageImageView.backgroundColor = .white
        pictageImageView.contentMode = .scaleAspectFit
        
        madeBlackAndWhiteButton.setTitle("Сделать чёрно-белым", for: .normal)
        madeBlackAndWhiteButton.backgroundColor = .white
        madeBlackAndWhiteButton.setTitleColor(.black, for: .normal)
        madeBlackAndWhiteButton.setTitleColor(.systemBlue, for: .highlighted)
        madeBlackAndWhiteButton.layer.cornerRadius = 4
    }
}

extension ImageViewController: ImageBlackAndWhiteConverterDelegate {
    func convertedImage(_ image: UIImage?) {
        pictageImageView.image = image
    }
}
