import UIKit

// MARK: - View
protocol IDResultDetailView
{
    
    var presenter: IDResultDetailPresenter? { get set }
    
    func setTitle(title: String)
    func showGallery(gallery: [IDResultMultimediaImageModel])
    func showDescription(strDescription: String, price: Int, isFavorite: Bool)
}

// MARK: - Presenter
protocol IDResultDetailPresenter
{
    
    var view: IDResultDetailView? { get set }
    var interactor: IDResultDetailInteractor? { get set }
    var interactorSpace: IDSpaceInteractor? { get set }
    var router: IDResultDetailRouter? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    
    func userClickGoBack()
    func userClickAddFavorite()
    func userClickRemoveFavorite()
}

// MARK: - Interactor
protocol IDResultDetailInteractorCallback
{
}

protocol IDResultDetailInteractor
{    
    var presenter: IDResultDetailInteractorCallback? { get set }
}

// MARK: - Router
protocol IDResultDetailRouter
{
    
    func goBack()
}
