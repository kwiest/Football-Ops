module CampersHelper
  def tags_for(user)
    tags = ''
    tags << administrator_tag if user.admin?
    tags << conference_rep_tag if user.conference_rep?
    tags << national_committee_tag if user.national_committee?
    tags.html_safe
  end


  private

  def administrator_tag
    content_tag :span, 'Site administrator', class: 'badge badge-warning'
  end

  def conference_rep_tag
    content_tag :span, 'Conference Rep', class: 'badge badge-info'
  end

  def national_committee_tag
    content_tag :span, 'National Committee', class: 'badge badge-success'
  end
end
