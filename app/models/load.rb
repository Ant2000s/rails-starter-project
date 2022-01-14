class Load < ApplicationRecord
    validates :title, uniqueness: {message: "was taken", scope: :user_id}
end
