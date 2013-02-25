namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    require 'faker'
    user = User.new(:login => "lightxu",
                    :password => "password",
                    :password_confirmation => "password",
                    :role => "guest")
    user.is_checker = true
    user.build_user_profile(:first_name => "Xu",
                            :family_name => "Shicheng",
                            :sex => "male",
                            :email => "lightxuzju@gmail.com")
    user.save!
    Admin.create!(:user_id => user)
    100.times do |n|
      job = Job.new(:name => Faker::Company.bs,
                  :pay => n + 1)
      job.state = "valid"
      job.category = "campus"
      job.build_job_profile(:address => Faker::Address.street_address, 
                  :stop_employ_at => "2012-01-01",
                  :start_work_at  => "2012-01-01", 
                  :amount => "1",
                  :sex => "whatever", 
                  :campus => "whatever")
      job.user_profile = user.user_profile
      job.save
    end
  end
end