ActiveAdmin.register Review do
  permit_params :title, :text, :rating, :status, :user_id, :book_id
end
