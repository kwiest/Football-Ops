namespace :access_tokens do
  desc 'Destroy all access tokens for main web app'
  task :delete_all => :environment do
    tokens_to_destroy = AccessToken.where(app_id: web_app).destroy_all
  end

  desc 'Create new access tokens for all users for web app'
  task :create_all => :environment do
    User.all.each do |user|
      AccessToken.create! user: user, app: web_app
    end
  end

  desc 'Re-build access tokens for all users for web app'
  task :refresh do
    Rake::Task['access_tokens:delete_all'].invoke
    Rake::Task['access_tokens:create_all'].invoke
  end

  def web_app
    @web_app ||= App.find_by_name! 'FootballOps.org Official Website'
  rescue ActiveRecord::RecordNotFound
    puts 'Cannot find official web app in database...'
    exit
  end
end
