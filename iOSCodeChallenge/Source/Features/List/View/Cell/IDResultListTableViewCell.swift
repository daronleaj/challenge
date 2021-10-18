import UIKit

protocol IDResultListTableViewCellOutput: AnyObject
{
    func clickAddFavorite(item: IDResultModel)
    func clickRemoveFavorite(item: IDResultModel)
}

class IDResultListTableViewCell: UITableViewCell
{
    // MARK: - Outlet
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var containerFavoriteView: UIView!
    
    //MARK: - Delegate
    weak var delegateOutput:IDResultListTableViewCellOutput?
    
    // MARK: - Var
    private var model: IDResultModel?
    static var identifier: String
    {
        return "\(self)"
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        setUpView()
    }
    
    func fill(withResult result: IDResultModel, delegateOutput:IDResultListTableViewCellOutput?)
    {
        self.model = result
        self.delegateOutput = delegateOutput
        
        titleLabel.text = result.getTitle()
        if let price = result.price {
            subtitleLabel.text = R.arguments.spacePrice_(value: "\(price)").string
        }
        setButtonFavorite(isFavorite: model?.isFavorite ?? false)
        
        if let multimedia = result.multimedia, let firstImageURL = multimedia.images.first?.url {
            self.photo.setRemoteImage(with: URL(string: firstImageURL))
        }
    }
    
    @IBAction func clickFavorite(_ sender: Any)
    {
        let isFavorite = !(model?.isFavorite ?? false)
        model?.setFavorite(favorite: isFavorite)
        
        if isFavorite {
            delegateOutput?.clickAddFavorite(item: model!)
        } else {
            delegateOutput?.clickRemoveFavorite(item: model!)
        }
        
        setButtonFavorite(isFavorite: isFavorite)
    }
}

private extension IDResultListTableViewCell
{
    func setButtonFavorite(isFavorite: Bool)
    {
        if isFavorite {
            favoriteButton.setImage(UIImage(named: "ic_heartBlue"), for: .normal)
            favoriteButton.setImage(UIImage(named: "ic_heartWhite"), for: .highlighted)
        } else {
            favoriteButton.setImage(UIImage(named: "ic_heartWhite"), for: .normal)
            favoriteButton.setImage(UIImage(named: "ic_heartBlue"), for: .highlighted)
        }
    }
    
    func setUpView()
    {
        backgroundColor = .white
        selectionStyle = .none
        separatorInset = .zero
        
        containerFavoriteView.roundCorners(cornerRadius: containerFavoriteView.frame.height/2)
        containerView.roundCorners(cornerRadius: 4)
        
        titleLabel.font = UIFont.mainFont(name: .josefinSan, size: .eighteen, fontType: .semibold)
        subtitleLabel.font = UIFont.mainFont(name: .josefinSan, size: .fourteen, fontType: .regular)
    }
}
