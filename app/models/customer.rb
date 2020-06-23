class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable#, :validatable

  #validates_uniqueness_of :email, scope: :is_deleted
  validates :email, uniqueness: { scope: :is_deleted }
  validates_format_of :email, with: Devise.email_regexp, if: :will_save_change_to_email?
  validates :password, presence: true, confirmation: true, length: { in: Devise.password_length }, on: :create
  validates :password, confirmation: true, length: { in: Devise.password_length }, allow_blank: true, on: :update


  def active_for_authentication?
    super && (self.is_deleted == false)
  end


  has_many :cart_items
  has_many :orders
  has_many :deliveries

end
