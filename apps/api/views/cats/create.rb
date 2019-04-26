module Api::Views::Cats
  class Create
    include Api::View
    layout false

    def render
      json = {
        id: cat.id,
        name: cat.name
      }.to_json

      _raw json
    end
  end
end
