class Shout < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :body, presence: true, length: {in: 1..144}
  validates :user, presence: true
  delegate :username, to: :user

  default_scope { order(created_at: :desc) }

end
