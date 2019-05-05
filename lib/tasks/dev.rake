namespace :dev do
  desc "Configure developer environment."
  task setup: :environment do
    %x(rails db:drop db:create db:migrate)
  end

end
