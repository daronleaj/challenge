struct IDResultMultimediaImageDTO: Codable
{
    let url: String?
}

struct IDResultMultimediaImageModel: Codable
{
    let url: String?
    
    static func mapperToIDResultMultimediaImageDTO(idResultMultimediaImageDTO: IDResultMultimediaImageDTO) -> IDResultMultimediaImageModel
    {
        return IDResultMultimediaImageModel(url: idResultMultimediaImageDTO.url)
    }
}
