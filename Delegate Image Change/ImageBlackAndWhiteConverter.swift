//
//  ImageBlackAndWhiteConverter.swift
//  Delegate Image Change
//
//  Created by Глеб Капустин on 15.09.2023.
//

import UIKit


protocol ImageBlackAndWhiteConverterDelegate: AnyObject{
    func convertedImage(_ image: UIImage?)
}
final class ImageBlackAndWhiteConverter {
    private weak var delegate: ImageBlackAndWhiteConverterDelegate?
    init(delegate: ImageBlackAndWhiteConverterDelegate) {
        self.delegate = delegate
    }
    func convert(_ image: UIImage?) {
        print("start")
        
     //
     //
     //
     //
     //
     //
     //
        image?.convertToBlackAndWhite(completion: {[weak self] convertedImage in
            self?.delegate?.convertedImage(convertedImage)
            print("Done")
        })
    }
    
}
