# LinkForm
class LinkForm < ::Link
  validates :url, presence: true, format: { without: /#{ENV['BASE_DOMAIN']}/ }
end
