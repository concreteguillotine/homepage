class Comment < ApplicationRecord
  belongs_to :article

  validates :text, presence: true

  scope :persisted, -> { where.not(id: nil) }
  scope :ordered, -> { order(created_at: :asc) }
end
