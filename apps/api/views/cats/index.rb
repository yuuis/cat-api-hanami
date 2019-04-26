module Api::Views::Cats
  class Index
    include Api::View
    layout false

    def render
      # _raw JSON.dump(cats.map(&:to_h))
      cats.to_json
    end
  end
end
