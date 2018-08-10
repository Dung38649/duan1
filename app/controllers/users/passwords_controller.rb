# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # prepend_before_action :require_no_authentication
  # prepend_before_action :remove_session, only: [:edit, :cancle]
  # prepend_before_action :require_no_authentication
  prepend_before_action :require_no_authentication, only: [ :edit, :update]


  # GET /resource/password/new
  def new
    p "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    p "-----------------------"
    super
  end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    p "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    p "-----------------------"
    super
  end

  # PUT /resource/password
  def update
    super
  end

  # protected

  def after_resetting_password_path_for(resource)
    p "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    p "-----------------------"
    super(resource)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    p "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    p "-----------------------"
    super(resource_name)
  end
end
