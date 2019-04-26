# frozen_string_literal: true

class CatSerializer < BaseSerializer
  attribute :token

  def token
    payload = { id: object.id, name: object.name }
    JWT.encode payload, nil, 'none'
  end
end
