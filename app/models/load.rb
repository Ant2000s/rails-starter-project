class Load < ApplicationRecord
  validates :title, presence: true, uniqueness: { message: 'was taken', scope: :user_id }
end
