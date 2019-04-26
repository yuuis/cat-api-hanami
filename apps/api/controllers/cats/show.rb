# frozen_string_literal: true

module Api::Controllers::Cats
  class Show
    include Api::Action
    accept :json

    expose :cat
    before :configure_response

    params do
      required(:id).filled
    end

    def call(_params)
      halt 400 unless params.valid?

      @cat = CatRepository.new.find(params.get(:id))
    end

    private

    def configure_response
      self.status = 200
    end
  end
end
