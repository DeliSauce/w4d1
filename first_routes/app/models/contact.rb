class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true

  #checks to make sure user_id & email aren't the same on two records
  validates :email, uniqueness: { scope: :user_id}

  belongs_to :owner,
    class_name: :User,
    foreign_key: :user_id

  has_many :contact_shares,
    class_name: :ContactShare,
    primary_key: :id,
    foreign_key: :contact_id

  has_many :shared_users,
    through: :contact_shares,
    source: :user

end
