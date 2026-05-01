desc "Bypass CLI to make user 1 admin"
  task make_1_admin: [ :environment ] do
    numberone = User.find(1)
    numberone.admin = true
    numberone.save
end
