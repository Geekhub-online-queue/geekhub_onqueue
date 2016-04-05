ActiveAdmin.register Hospital do
  permit_params :title, :city, :phone, :address, :description, :photo
  form :html => { :enctype => "multipart/form-data" } do |f|
   f.inputs "Details" do
    f.input :title
    f.input :city
    f.input :address
    f.input :description
    f.input :phone
    f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(download: true))
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
