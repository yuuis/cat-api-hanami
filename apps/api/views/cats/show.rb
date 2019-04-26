module Api::Views::Cats
  class Show
    include Api::View
    layout false

    def render
      binding.pry
      _raw cat.to_h.to_json
    end
  end
end

