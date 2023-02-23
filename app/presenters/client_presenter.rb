class ClientPresenter < BasePresenter

  def fullname
    "#{first_name} #{last_name}"
  end

  def avatar
    "https://ui-avatars.com/api?name=#{fullname}&rounded=true&format=svg"
  end
end
