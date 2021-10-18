import UIKit

extension UIImageView
{

    func setRemoteImage(with url: URL?, placeholder: UIImage? = UIImage(named: "ic_noimage"))
    {
        
        if let firstImageURL = url {
            URLSession.shared.dataTask(with: firstImageURL) {
                    (data, response, error) in

                    guard let data = data, error == nil, let image = UIImage(data: data) else {
                        self.image = placeholder
                        return
                    }

                DispatchQueue.main.sync {
                    self.image = image
                }
            }.resume()
        } else {
            self.image = placeholder
        }
    }
}
