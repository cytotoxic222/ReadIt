class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :image,
                  :first_name, :last_name
  validates :name, presence: true, uniqueness: true
  has_secure_password

  has_attached_file :image, :styles => { :small => "150x150>" },
                    :default_url => "/images/:style/missing.jpg"

  has_many :books

  ROLES = %w[generic admin]

  def role_symbols
    [role.to_sym]
  end

  after_destroy :ensure_an_admin_remains
  private

  	def ensure_an_admin_remains
  		if User.count.zero?
  			raise "Can't delete last admin"
  		end
  	end
end
