class ContentDetail < ApplicationRecord
  belongs_to :airplane
  belongs_to :content

  def self.click_count(airplane_id, content_id)
    row = ContentDetail.create!(click: 1, airplane_id: airplane_id, content_id: content_id)
  end
end
