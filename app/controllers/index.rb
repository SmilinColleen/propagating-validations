get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @name = session[:name]
  @email = session[:email]
  erb :register
end

post '/events/create' do
  @event = Event.create(params)
  session[:name] = params[:organizer_name]
  session[:email] = params[:organizer_email]
  if @event.errors.any?
    @name = session[:name]
    @email = session[:email]
    erb :register
  else
    redirect '/'
  end

end
