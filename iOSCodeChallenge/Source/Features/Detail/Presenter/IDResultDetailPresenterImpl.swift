
final class IDResultDetailPresenterImpl
{
    
    //MARK: - View
    var view: IDResultDetailView?
    
    //MARK: - Interactor
    var interactor: IDResultDetailInteractor?
    var interactorSpace: IDSpaceInteractor?
    
    //MARK: - Router
    var router: IDResultDetailRouter?
    
    //MARK: - Var
    private var item: IDResultModel

    init(item: IDResultModel)
    {
        self.item = item
    }
}

// MARK: - Presenter methods
extension IDResultDetailPresenterImpl: IDResultDetailPresenter
{
    
    func viewDidLoad()
    {
        view?.setTitle(title: item.getTitle())
        
        if let images = item.multimedia?.images {
            view?.showGallery(gallery: images)
        }
        
        view?.showDescription(strDescription: item.getDescription(), price: item.price ?? 0, isFavorite: item.isFavorite)
    }
    
    func viewWillAppear()
    {
        AnalyticsAgent.SpaceScreen.trackDetailSpace()
    }
    
    func viewDidAppear()
    {
        //Nothing to do here
    }
    
    func userClickGoBack()
    {
        self.router?.goBack()
    }
    
    func userClickAddFavorite()
    {
        interactorSpace?.addSpaceFavorie(item: item)
    }
    
    func userClickRemoveFavorite()
    {
        interactorSpace?.removeSpaceFavorie(item: item)
    }
    
}

// MARK: - IDResultDetailInteractorCallback methods
extension IDResultDetailPresenterImpl: IDResultDetailInteractorCallback
{
}

// MARK: - IDSpaceInteractorCallback methods
extension IDResultDetailPresenterImpl: IDSpaceInteractorCallback
{
}
