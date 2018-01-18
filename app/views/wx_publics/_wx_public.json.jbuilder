json.extract! wx_public, :id, :nickname, :manager, :alias, :created_at, :updated_at
json.url wx_public_url(wx_public, format: :json)
