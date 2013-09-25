get '/' do
  @title = "i love tacos"
  @schools = School.all
  @expensive = Stats::most_expensive(@schools)
  @cheap = Stats::least_expensive(@schools)
  slim :index
end

get '/states/all' do
  slim :states, layout: false
end

get '/states/:name' do
  @schools = School.find_all_by_state(params[:name])
  @state = params[:name]
  @expensive = Stats::most_expensive(@schools)
  slim :by_state
end

get '/religions/all' do
  slim :religions, layout: false
end

get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  filename = "#{params[:name]}"
  render :scss, filename.to_sym, :layout => false, :views => './public/css'
end