module Api::Views::Cats
  class Update
    include Api::View
    layout false

    def render
      _raw cat.to_h.to_json
    end
  end
end

