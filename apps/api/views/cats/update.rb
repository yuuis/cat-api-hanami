module Api::Views::Cats
  class Update
    include Api::View
    layout false

    def render
      _raw cat.curry_args.to_h.to_json
    end
  end
end

