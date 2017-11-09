module Blending
  extend ActiveSupport::Concern

  included do
    after_save :make_juice, if: :delicious_apples?
  end

  def delicious_apples?
    self.class == Apple
  end

  def make_juice
    # binding.pry
    "whirrrrr"
  end
end

class Apple < ApplicationRecord
  include Blending
end

class Orange < ApplicationRecord
  include Blending
end
