# frozen_string_literal:true

# User model
class User < ApplicationRecord
  # Encrypt Password
  has_secure_password

  # Associations
  has_many :todos, foreign_key: :created_by

  # Validations
  validates_presence_of :name, :email, :password_digest
end
