# frozen_string_literal: true

module Api::Controllers::Cats
  class Create
    include Api::Action
    accept :json

    expose :cat
    before :configure_response

    params do
      required(:name).filled(size?: 1..15)
    end

    def call(params)
      halt 400 unless params.valid?

      @cat = CatRepository.new.create(name: params.get(:name))
    end

    private

    def configure_response
      self.status = 201
    end
  end
end
