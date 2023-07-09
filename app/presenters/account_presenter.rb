class AccountPresenter < BasePresenter
  def fullname
    "#{user.first_name} #{user.last_name}"
  end

  def avatar
    "https://ui-avatars.com/api?name=#{fullname}&rounded=true&format=svg"
  end
end
