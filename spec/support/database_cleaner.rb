RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
    puts "DatabaseCleaner: Using truncation strategy"
  end

  config.before(:each) do
    DatabaseCleaner.start
    puts "DatabaseCleaner: Started cleaning"
  end

  config.after(:each) do
    DatabaseCleaner.clean
    puts "DatabaseCleaner: Finished cleaning"
  end
end
