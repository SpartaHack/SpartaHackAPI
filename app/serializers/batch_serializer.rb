class BatchSerializer < ActiveModel::Serializer
  attributes :token, :hackers

  def hackers
    users = User.find object.hackers.split(',')
    user_names = []
    users.each do |u|
      user_names.push "#{u.first_name.capitalize} #{u.last_name.capitalize}"
    end
    user_names
  end
end
