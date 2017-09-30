class Album < ApplicationRecord

  validates_presence_of :title, :user_id

  belongs_to :user
  has_many   :photos

end
