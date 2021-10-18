import UIKit

class IDResultDetailViewController: UIViewController
{
    // MARK: - Presenter
    var presenter: IDResultDetailPresenter?
    
    // MARK: Var
    var imagesSpace: [IDResultMultimediaImageModel]?
    var isFavoriteSpace: Bool = false
    
    // MARK: IBOutlets
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var containerIndexImageView: UIView!
    @IBOutlet weak var indexImageLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var containerFavoriteView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        self.presenter?.viewDidAppear()
    }
    
    @objc func userClickBack(sender: UIBarButtonItem)
    {
        presenter?.userClickGoBack()
    }
    
    @IBAction func clickFavorite(_ sender: Any)
    {
        isFavoriteSpace = !isFavoriteSpace
        setButtonFavorite(isFavorite: isFavoriteSpace)
        if isFavoriteSpace {
            presenter?.userClickAddFavorite()
        } else {
            presenter?.userClickRemoveFavorite()
        }
    }
}

extension IDResultDetailViewController: IDResultDetailView
{
    func setTitle(title: String)
    {
        self.title = title
    }
    
    func showGallery(gallery: [IDResultMultimediaImageModel])
    {
        self.imagesSpace = gallery
        
        self.imagesCollectionView.reloadData()
        setIndexLabel(iPosition: 0)
    }
    
    func showDescription(strDescription: String, price: Int, isFavorite: Bool)
    {
        self.descriptionLabel.text = strDescription
        self.priceLabel.text = R.arguments.spacePrice_(value: "\(price)").string
        self.isFavoriteSpace = isFavorite
        setButtonFavorite(isFavorite: isFavorite)
    }
}


// MARK: UICollectionViewDataSource
extension IDResultDetailViewController: UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.imagesSpace?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IDResultDetailCollectionCellView.identifier, for: indexPath) as? IDResultDetailCollectionCellView else {
            return UICollectionViewCell()
        }
        cell.setupCell(imageModel: (self.imagesSpace?[indexPath.row])!)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension IDResultDetailViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}

// MARK: - UICollectionViewDelegate
extension IDResultDetailViewController: UICollectionViewDelegate
{
    func scrollViewDidScroll(_ scrollView:UIScrollView)
    {
        let point:CGPoint = CGPoint(x:scrollView.bounds.midX, y:scrollView.bounds.midY)

        guard let indexPath:IndexPath = imagesCollectionView.indexPathForItem(at:point) else { return }

        setIndexLabel(iPosition: indexPath.item)
    }
}

// MARK: - Private Methods
private extension IDResultDetailViewController
{
    
    func setUpView ()
    {
        //Change back button
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "bt_back"), style: .plain, target: self, action: #selector(userClickBack(sender:)))
        
        //Images CollectionView
        let nib = UINib(nibName: IDResultDetailCollectionCellView.identifier, bundle: nil)
        self.imagesCollectionView.register(nib, forCellWithReuseIdentifier: IDResultDetailCollectionCellView.identifier)
        
        self.imagesCollectionView.dataSource = self
        self.imagesCollectionView.delegate = self
        
        self.containerFavoriteView.roundCorners(cornerRadius: containerFavoriteView.frame.height/2)
        
        //Style
        self.indexImageLabel.font = UIFont.mainFont(name: .josefinSan, size: .fourteen, fontType: .regular)
        self.containerIndexImageView.roundCorners(cornerRadius: 2)
        
        self.priceLabel.font = UIFont.mainFont(name: .josefinSan, size: .eighteen, fontType: .semibold)
        self.descriptionLabel.font = UIFont.mainFont(name: .josefinSan, size: .fourteen, fontType: .regular)
    }
    
    func setIndexLabel(iPosition: Int)
    {
        self.indexImageLabel.text = "\(iPosition+1)/\(imagesSpace?.count ?? 0)"
    }
    
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
}

