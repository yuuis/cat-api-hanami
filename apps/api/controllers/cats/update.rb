# frozen_string_literal: true

module Api::Controllers::Cats
  class Update
    include Api::Action
    accept :json

    expose :cat
    before :configure_response

    params do
      required(:id).filled
      required(:name).filled(size?: 1..15)
    end

    def call(params)
      halt 400 unless params.valid?

      @cat = CatRepository.new.update(params.get(:id), name: params.get(:name))
    end

    private

    def configure_response
      self.status = 200
    end
  end
end
