module Api::Views::Cats
  class Index
    include Api::View
    layout false

    def render
      _raw cats.map(&:to_h).to_json
    end
  end
end
