class User < ApplicationRecord
  
  mount_uploader :avatar, AvatarUploader
  enum role: [:user, :admin]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :user
  end

  def admin?
    self.role == "admin"
  end

  def self.count_admin
    User.where('role = 1').count
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable:admin
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :avatar, presence: true
  validates :name, presence: true

end
