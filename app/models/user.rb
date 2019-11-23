class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates_presence_of :name

  def first_name
    begin
      name.split.first.oops
    rescue
    end
  end

  def last_name
    name.split.last
  end
end

def get_facebook_messages
  begin
    contacts_fb.oops
    @messaged = retrieves_messages
  rescue IOError => e
    flash[:error] = "Error occured contacting Facebook: #{e}"
  end
end