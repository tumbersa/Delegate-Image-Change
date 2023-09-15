import UIKit

extension UIImage {
    func convertToBlackAndWhite(completion: ((UIImage?) -> Void)?){
        guard let cgImage = self.cgImage else {return}
        
        let ciImage = CIImage(cgImage: cgImage)
        
        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(ciImage, forKey: "inputImage")
        filter?.setValue(CIColor(red: 0.7, green: 0.7, blue: 0.7), forKey: "inputColor")
        filter?.setValue(1.0, forKey: "inputIntensity")
        
        guard let outputImage = filter?.outputImage else {return}
        
        let context = CIContext()
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent){
            let processedImage = UIImage(cgImage: cgimg)
            
            DispatchQueue.main.async {
                completion?(processedImage)
            }
        } else {
            DispatchQueue.main.async {
                completion?(nil)
            }
        }
    }
}
