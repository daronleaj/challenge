struct IDResultMultimediaDTO: Codable
{
    let images: [IDResultMultimediaImageDTO]
}

struct IDResultMultimediaModel
{
    let images: [IDResultMultimediaImageModel]
    
    static func mapperToIDResultMultimediaDTO(idResultMultimediaDTO: IDResultMultimediaDTO?) -> IDResultMultimediaModel
    {
        var images: [IDResultMultimediaImageModel] = []
        
        if let resultImages = idResultMultimediaDTO?.images {
            images = resultImages.map { return IDResultMultimediaImageModel.mapperToIDResultMultimediaImageDTO(idResultMultimediaImageDTO: $0) }
        }
        
        return IDResultMultimediaModel(images: images)
    }
}
