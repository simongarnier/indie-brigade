require 'uri'

class Dev < ActiveRecord::Base
  include IdentityCache

  belongs_to :role
  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :main_skill, class_name: 'Skill', foreign_key: 'main_skill_id'

  has_many :dev_conditions, dependent: :delete_all
  has_many :conditions, through: :dev_conditions

  has_many :dev_major_skills , dependent: :delete_all
  has_many :major_skills, through: :dev_major_skills, source: :skill

  has_many :dev_minor_skills, dependent: :delete_all
  has_many :minor_skills, through: :dev_minor_skills, source: :skill

  has_many :availabilities, as: :available
  accepts_nested_attributes_for :availabilities, allow_destroy: true

  has_many :dev_softwares, dependent: :delete_all
  has_many :softwares, through: :dev_softwares

  attr_reader :skills

  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/default_profile.png"
  has_attached_file :banner, styles: { display: "960x240#"}, default_url: "/images/default_banner.png"

  # Avatar and banner validation
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_content_type :banner, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  validates_attachment_file_name :banner, matches: [/png\Z/, /jpe?g\Z/]
  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/png"] }, size: { in: 0..1.megabytes }
  validates_attachment :banner, content_type: { content_type: ["image/jpeg", "image/png"] }, size: { in: 0..5.megabytes }

  def skills
    minor_skills + major_skills
  end

  def major_skills_by_role
    major_skills.sort_by{|skill| skill.role.code}
  end

  def minor_skills_by_role
    minor_skills.sort_by{|skill| skill.role.code}
  end

  def compatible_devs
    Availability.for_available_type("Opening").compatible_availability(self).available
  end

  def external_sites_attributes
    attributes.select do |k, _|
      k.include?("handle") || k.include?("link") && !k.include?("portfolio")
    end.select do |_, v|
      v && !v.empty?
    end
  end

  def self.css_class_for_field(field)
    {
      facebook_handle: "fa fa-facebook-square",
      google_handle: "fa fa-google-plus",
      linkedin_link: "fa fa-linkedin",
      tumblr_handle: "fa fa-tumblr",
      youtube_handle: "fa fa-youtube-play",
      behance_handle: "fa fa-behance",
      instagram_handle: "fa fa-instagram",
      twitter_handle: "fa fa-twitter",
      deviantart_handle: "fa fa-deviantart",
      skype_handle: "fa fa-skype",
      vimeo_handle: "fa fa-vimeo",
      pinterest_handle: "fa fa-pinterest"
    }[field]
  end

  def self.social_link_for_field(field, value)
    encoded = URI.encode(value)
    {
      facebook_handle: "https://www.facebook.com/#{encoded}",
      google_handle: "https://plus.google.com/u/0/#{encoded}",
      linkedin_link: "#{encoded}",
      tumblr_handle: "http://#{encoded}.tumblr.com/",
      youtube_handle: "https://www.youtube.com/user/#{encoded}",
      behance_handle: "https://www.behance.net/#{encoded}",
      instagram_handle: "https://www.instagram.com/#{encoded}",
      twitter_handle: "https://twitter.com/#{encoded}",
      deviantart_handle: "http://#{encoded}.deviantart.com/",
      vimeo_handle: "https://vimeo.com/#{encoded}",
      pinterest_handle: "https://www.pinterest.com/#{encoded}/"
    }[field]
  end
end
