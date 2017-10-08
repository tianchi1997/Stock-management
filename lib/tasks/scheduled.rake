namespace :scheduled do
  desc "Destroy all expired items in database"
  task remove_expired: :environment do
    ItemExpiry.where('expiry_date < ?', Date.today).destroy_all
  end

end
