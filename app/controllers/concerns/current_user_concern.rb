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
    guest = GuestUser.new
    guest.name = 'Guest User'
    guest.first_name = 'Guest'
    guest.last_name = 'User'
    guest.email = 'guest@example.com'
    guest
  end
end
