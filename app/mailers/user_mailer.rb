class UserMailer < ApplicationMailer
	 default from: 'rahulmeena@gmail.com'
def home_email
  @user = params[:user]
  mail(to: @user.email, subject: 'Welcome to My Awesome Site')
end