class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :videos
  validates :first_name, presence: true
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'Staff User' if role.nil?
  end

  def admin?
    role.name == "Admin User"
  end

  def super_user?
    role.name == "Super User"
  end

  def staff?
    role.name == "Staff User"
  end

  def member?
    role.name == "Member"
  end

end
