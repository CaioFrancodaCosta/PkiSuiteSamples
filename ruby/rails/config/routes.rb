Rails.application.routes.draw do

  root action: :index, controller: :home

  get '/check-express/:rc(/:fwd(/:op))', action: :check_pki_express, controller: :home
  get '/check-rest-token/:rc(/:fwd(/:op))', action: :check_rest_pki_token, controller: :home

  get '/download/:file_id', action: :get, controller: :download
  get '/download/sample/:sample_id', action: :sample, controller: :download
  get '/download/doc/:id', action: :doc, controller: :download

  get '/upload/:rc', action: :index, controller: :upload, as: :upload
  post '/upload/:rc', action: :action, controller: :upload

  get '/server-files/:rc/:op', action: :index, controller: :server_files, as: :server_files
  post '/server-files/:rc/:op', action: :action, controller: :server_files

  get '/pades-signature-rest/:file_id', action: :index, controller: :pades_signature_rest, as: :pades_signature_rest
  post '/pades-signature-rest/:file_id', action: :action, controller: :pades_signature_rest

  get '/pades-signature-express/:file_id', action: :index, controller: :pades_signature_express, as: :pades_signature_express
  post '/pades-signature-express/start/:file_id', action: :start, controller: :pades_signature_express
  post '/pades-signature-express/complete/:file_id', action: :complete, controller: :pades_signature_express
end
