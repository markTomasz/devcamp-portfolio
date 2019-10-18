module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    # currently, current-user is only avail to devise users.
    # we want current-use to be avail even when no user is signed in.
    # overloading method
    # super (current user logged in?)
    super || guest_user
  end

  def guest_user
    OpenStruct.new( name: 'Guest USer',
                    first_name: 'Guest',
                    last_name: 'User',
                    email: 'guest@example.com'
                  )
  end
end