import UIKit

class IDResultDetailCollectionCellView: UICollectionViewCell
{
    // MARK: - Outlet
    @IBOutlet weak var imageSpace: UIImageView!
    
    // MARK: - Var
    static var identifier: String
    {
        return "\(self)"
    }

    // MARK: - Public
    func setupCell(imageModel: IDResultMultimediaImageModel)
    {
        self.imageSpace?.setRemoteImage(with: URL(string: imageModel.url ?? ""))
    }
}
