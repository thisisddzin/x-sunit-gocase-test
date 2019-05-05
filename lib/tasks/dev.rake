namespace :dev do
  desc "Configure developer environment."
  task setup: :environment do
    %x(rails db:drop db:create db:migrate)

    # Create survivors with their initial locations.
    puts "Creating survivors."
    Random.rand(50..100).times do |i|
      @survivor = Survivor.create!(
        name: Faker::Artist.name,
        age: Random.rand(18..65),
        gender: Faker::Gender.type,
      )
      Location.create!(
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.latitude,
        survivor: @survivor
      )
    end
    puts "Survivors createds successfully."

  end

end
