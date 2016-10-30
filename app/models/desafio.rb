class Desafio < ActiveRecord::Base
  scope :tipo, -> (tipo) { where tipo: tipo }
  scope :id, -> (id) { where id: id }
end
