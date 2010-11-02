module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the signup page/
      '/signup'
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    
    when /the upload song page/
      '/songs/new'

    when /the profile for "(.*)"/
       @user = User.find_by_name($1)
      '/users/show/'+@user.id.to_s
    when /the edit user page for "(.*)"/
       @user = User.find_by_name($1)
      '/users/edit/'+@user.id.to_s
    when /the login page/
       '/login'
    when /the Make new playlist page/
       '/Playlists/new'

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
