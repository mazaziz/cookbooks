
# installing ruby-shadow library to access shadow passwords
if node['box']['users'].length > 0
  gem_package "ruby-shadow" do
    gem_binary "/opt/vagrant_ruby/bin/gem"
  end
end

# creating/updating users
node['box']['users'].each do |username,option|

  user username do

    # home directory
    if option['home'].is_a?(String)
      home option['home']
    elsif option['system'] 
      home "/bin"
    end

    # shell
    if option['shell']
      shell option['shell']
    elsif option['system'] == true
      shell "/usr/sbin/nologin"
    else
      shell "/bin/bash"
    end

    # group
    if option['group'].is_a?(String)
      group option['group']
    end
    
    # password
    if option['password'].is_a?(String)
      password option['password']
    end

    # system user ?
    if option['system']
      system true
    end

  end

end
