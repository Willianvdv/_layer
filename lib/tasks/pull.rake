namespace :pull do
  task :user_data, [:pull_implementation_path, :pull_implementation_class] => :environment do |t, args|
    pull_implementation_path = args[:pull_implementation_path]
    pull_implementation_class = args[:pull_implementation_class]

    fail 'Missing pull implementation path' if pull_implementation_path.blank?
    fail 'Missing pull implementation class' if pull_implementation_class.blank?

    # load the file where the pull implementation class is defined
    require pull_implementation_path

    pull_implementation_class = pull_implementation_class.constantize
    pull_implementation = pull_implementation_class.new

    Sync::Pull::UserPuller.new(pull_implementation).pull_all
  end
end
