class AdminSession < Authlogic::Session::Base
  # attr_accessible :title, :body
  acts_as_authentic
   def to_key 
    new_record? ? nil : [ self.send(self.class.primary_key) ] 
   end 
end
