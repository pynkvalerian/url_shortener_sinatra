get '/' do
  # let user create new short URL, display a list of shortened URLs
erb :index
end

post '/urls' do
  # create a new Url

  @url = params[:url]
  @new_link = Url.create(url: @url, shortened_url: Url.generate_short_url, click_count: 0)
  erb :short
end


# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  @url = Url.get_url(params[:short_url])
  byebug
  redirect to("http://" + @url)
end