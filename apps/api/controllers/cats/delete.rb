# frozen_string_literal: true

module Api::Controllers::Cats
  class Delete
    include Api::Action
    accept :json

    expose :cat
    before :configure_response

    params do
      required(:id).filled
    end

    def call(params)
      halt 400 unless params.valid?

      @cat = CatRepository.new.delete(params.get(:id))
    end

    private

    def configure_response
      self.status = 204
    end
  end
end
