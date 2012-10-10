namespace :access_tokens do
  desc 'Create new access tokens for all users for web app'
  task :refresh => :environment do
    begin
      web_app = App.find_by_name! 'FootballOps.org Official Website'
      User.all.each do |user|
        AccessToken.create! user: user, app: web_app
      end
    rescue ActiveRecord::RecordNotFound
      puts 'Cannot find official web app in database...'
      exit
    end
  end
end
