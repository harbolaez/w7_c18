class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email

  has_many :albums


  # current_user.full_name
  def full_name
    [self.first_name, self.last_name].join(" ")
  end

end
