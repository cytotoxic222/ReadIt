class User < ActiveRecord::Base
  has_many :books
  has_many :reviews
  attr_accessible :username, :email, :first_name, :last_name,
  				  :password, :password_confirmation, :avatar
  acts_as_authentic

  has_attached_file :avatar, :styles => { :small => "150x150>" },
				    :default_url => "/images/:style/missing.jpg"

  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar,
                                    :content_type => ['image/jpg', 'image/jpeg', 'image/gif', 'image/png']

end
