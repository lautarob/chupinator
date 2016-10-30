json.extract! desafio, :id, :tipo, :titulo, :descripcion, :puntos, :created_at, :updated_at
json.url desafio_url(desafio, format: :json)