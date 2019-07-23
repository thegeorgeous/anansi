require 'sinatra'

probabilistic_response = lambda do
  probability = params[:probability]&.to_i || 100

  if rand(1..100) < probability
    status 200
    body { { success: true }.to_json }
  else
    http_status = (201..599).to_a.sample
    status http_status
  end
end

get '/crm/?:probability?', &probabilistic_response
post '/crm/?:probability?', &probabilistic_response

get '/' do
  redirect '/crm'
end
