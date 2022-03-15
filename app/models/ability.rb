# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
   #return unless user.present?

    if user && user.super_user?
      can :manage, :all
    elsif user && user.admin?
      can :manage, :all
    elsif user && user.staff?
      can :read, Video
      can :create, Video
      can :update, Video do |video|
        video.try(:user) == user
      end
      can :destroy, Video do |video|
        video.try(:user) == user
      end
    elsif user && user.member?
      can :read, Video
    end
    can :read, Video unless user.present?
    can :rent_form, Video unless user.present?
    can :add_to_cart, Video unless user.present?
    can :remove_from_cart, Video unless user.present?
    can :clear_cart, Video unless user.present?
    can :cart, Video unless user.present?
  end


end
