import UIKit

class IDResultListTableViewCell: UITableViewCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        backgroundColor = .white
        selectionStyle = .none
        separatorInset = .zero
    }
    
    func fill(withResult result: IDResultModel)
    {
        titleLabel.text = result.getTitle()
        subtitleLabel.text = String(format: "%@ €", String(result.price ?? 0))
        
        if let multimedia = result.multimedia, let firstImageURL = multimedia.images.first?.url {
            URLSession.shared.dataTask(with: URL(string: firstImageURL)!) {
                    (data, response, error) in

                    guard let data = data, error == nil, let image = UIImage(data: data) else {
                        return
                    }

                DispatchQueue.main.sync {
                    self.photo.image = image
                }
                }.resume()
        }
    }
    
    
}
