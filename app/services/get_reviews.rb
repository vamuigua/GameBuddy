class GetReviews
  def self.gamereviews
    response = RestClient::Request.execute(
      method: :get,
      url: 'https://api-2445582011268.apicast.io/reviews/?fields=*&limit=10',
      headers: {'user-key':ENV['IGDB_API_KEY'],'Accept':'application/json'}
    )
  end
end