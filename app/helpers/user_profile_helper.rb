module UserProfileHelper
  def full_name(user_profile)
    user_profile.family_name + user_profile.first_name
  end
  
  def part_name(user_profile)
    user_profile.family_name + case user_profile.role
      when 'student' then t('.mate')
      else case user_profile.sex
        when 'male' then t('.mr')
        when 'female' then t('.miss')
      end
    end
  end
end