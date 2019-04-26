# frozen_string_literal: true

module Api::Controllers::Cats
  class Index
    include Api::Action
    accept :json

    expose :cat
    before :configure_response

    def call(_params)
      @cats = CatRepository.new.all
    end

    private

    def configure_response
      self.status = 200
    end
  end
end
