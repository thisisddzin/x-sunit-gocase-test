namespace :dev do
  desc "Configure developer environment."
  task setup: :environment do

    show_spinner("Deleting database if it exists.") { %x(rails db:drop) }
    show_spinner("Creating database.") { %x(rails db:create) }
    show_spinner("Migranting tables to the database.") { %x(rails db:migrate) }
    %x(rails dev:add_survivors)

  end

  desc "Create survivors and their initial locations."
  task add_survivors: :environment do
    show_spinner("Create survivors and their initial locations.") do
      Random.rand(50..100).times do |i|
        @survivor = Survivor.find_or_create_by!(
          name: Faker::Name.name_with_middle,
          age: Random.rand(18..65),
          gender: Faker::Gender.binary_type
        )
        Location.find_or_create_by!(
          latitude: Faker::Address.latitude,
          longitude: Faker::Address.latitude,
          survivor: @survivor
        )
      end
    end
  end

  desc "Application Credits."
  task credits: :environment do
    puts "CREDITS: Application by: Adenilson Santos. X-Sunit gocase test. =D Valeu pela oportunidade! "
  end

  private
    def show_spinner(start_msg, end_msg = "Completed!")
      spinner = TTY::Spinner.new("[:spinner] Executing task: #{start_msg}", format: :pulse_2)
      spinner.auto_spin
      yield
      spinner.success("(#{end_msg})")
    end

end
