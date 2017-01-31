Rails.application.routes.draw do
  post '/tag', to: 'tags#create', defaults: { format: 'json' }
  get '/tags/:entity_type/:entity_id', to: 'tags#show', defaults: { format: 'json' }
  delete '/tags/:entity_type/:entity_id', to: 'tags#destroy', defaults: { format: 'json' }
  # the nominal resource names here are a bit odd. But they'll do.
  get '/stats', to: 'stats#index', defaults: { format: 'json' }
  get '/stats/:entity_type/:entity_id', to: 'stats#show', defaults: { format: 'json' }
end
