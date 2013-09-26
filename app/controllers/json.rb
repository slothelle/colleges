get '/fancy/:name/json.json' do
  content_type :json
  schools = School.find_all_by_state(params[:name])
  schools.to_json
end