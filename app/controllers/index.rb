get '/' do
  # let user create new short URL, display a list of shortened URLs
erb :index
end

post '/urls' do
  # create a new Url
  @url = params[:url]
  @new_link = Url.new(url: @url, shortened_url: Url.generate_short_url, click_count: 0)
    if @new_link.valid? == true
      @new_link.save
      erb :short
    elsif @new_link.valid? == false
      erb :invalid
    end

end


# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  @url = Url.get_url(params[:short_url])
  redirect to(@url)
end