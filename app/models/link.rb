class Link < ApplicationRecord
  belongs_to :user, foreign_key: :created_by, optional: true

  scope :active, -> { where deleted_at: nil }
  scope :top_clicked, -> (user_id) { active.where(created_by: user_id).where.not(clicked: 0).order(clicked: :desc).limit(100) }

  def shorten_url
    "#{ENV['BASE_DOMAIN']}/#{slug}"
  end
end
