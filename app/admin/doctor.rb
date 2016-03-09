ActiveAdmin.register Doctor do
  permit_params :photo, :name, :phone, :specialization, :description, :hospital_id, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at

  form :html => { :enctype => "multipart/form-data" } do |f|
   f.inputs "Details" do
    f.input :name
    f.input :phone
    f.input :specialization
    f.input :description
    f.input :hospital_id, :as => :select, :collection => Hospital.all.map {|u| [u.title.to_s, u.id]}
    f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:medium))
  end
  f.actions
end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
