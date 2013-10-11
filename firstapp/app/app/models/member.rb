class Member < ActiveRecord::Base
  attr_accessible  :city, :country, :email, :first_name, :last_name, :password,  :state, :zip
  validates :city, :country, :email, :first_name,  :password,  :state, :zip, presence:true
  has_secure_password
  before_save { |member| member.email = member.email.downcase }
  before_save :create_remember_token
  
  validates :first_name, :last_name, length: { maximum: 50 }  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  
  private
	
    
    

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
