class Shout < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :content, polymorphic: true

  validates :user, presence: true
  delegate :username, to: :user

  default_scope { order(created_at: :desc) }

end
