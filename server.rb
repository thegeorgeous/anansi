require 'sinatra'

FAILURE_STATUS = [300, 301, 302, 303, 304, 305, 306, 307, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 500, 501, 502, 503, 504, 505].freeze

probabilistic_response = lambda do
  probability = params[:probability]&.to_i || 100

  if rand(1..100) < probability
    status 200
    body { { success: true }.to_json }
  else
    http_status = FAILURE_STATUS.sample
    status http_status
  end
end

delayed_response = lambda do
  probability = params[:probability]&.to_i || 100
  delay = params[:delay]&.to_i || 3

  sleep delay if rand(1..100) < probability
  status 200
  body { { success: true }.to_json }
end

get '/crm/?:probability?', &probabilistic_response
post '/crm/?:probability?', &probabilistic_response
get '/crm/delay/?:delay?', &delayed_response
post '/crm/delay/?:delay?', &delayed_response
get '/crm/?:probability/?:delay?', &delayed_response
post '/crm/?:probability/?:delay?', &delayed_response

get '/' do
  redirect '/crm'
end
