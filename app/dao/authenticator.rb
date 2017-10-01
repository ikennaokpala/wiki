class Authenticator
  def initialize(params)
    @username = params[:username]
    @password = params[:password]
  end

  def valid?
    user.present?
  end

  def user
    @user ||= (
      User.find_by(username: @username, password: @password) ||
      NullUser.new(nil)
    )
  end

  NullUser = Struct.new(:id) { def present?; false; end }
end
