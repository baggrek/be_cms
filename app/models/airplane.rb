class Airplane < ApplicationRecord
  has_many :content_details
  belongs_to :user
end
