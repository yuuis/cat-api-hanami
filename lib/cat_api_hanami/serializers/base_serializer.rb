# frozen_string_literal: true

require_relative './serializer'

class BaseSerializer < Selializer
  class << self
    protected

    def attribute(*syms)
      @@keys ||= {}
      @@keys[to_s] ||= []
      syms.each do |sym|
        @@keys[to_s].push sym
      end
      # rubocop:enable Style/ClassVars
    end
  end

  def initialize(obj)
    @obj = obj
  end

  def json(opt = {})
    result = base
    root = opt&.fetch(:root, '')
    root.empty? ? result.to_json : { root => result }.to_json
  end

  def hash
    base
  end

  def try_send_key(key)
    if respond_to? key
      send(key)
    else
      begin
        @obj.send(key)
      rescue
        raise $ERROR_INFO
      end
      # rubocop:enable Lint/RescueWithoutErrorClass
    end
  end

  protected

  def object
    @obj
  end

  private

  def base
    result = {}
    @@keys[self.class.to_s]&.each do |key|
      value = try_send_key(key)
      result = result.merge(key => value) unless value.nil?
    end
    result
  end
end
