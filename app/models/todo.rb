class Todo < ApplicationRecord
  has_many :items, dependent: :destroy
end
