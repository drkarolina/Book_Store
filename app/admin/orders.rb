ActiveAdmin.register Order do
  permit_params :status
  decorate_with OrderDecorator

  actions :index, :show

  index do
    selectable_column
    id_column
    column I18n.t('order.field.number'), :number
    column I18n.t('order.field.creation_date'), :creation_date
    column I18n.t('order.field.status'), :status
    column I18n.t('order.field.user'), :user
    actions
  end

  show do
    attributes_table do
      row I18n.t('order.field.number'), &:number
      row I18n.t('order.field.creation_date'), &:creation_date
      row I18n.t('order.field.status'), &:status
      row I18n.t('order.field.user'), &:user
    end
  end

  scope :complete, default: true
  scope :in_delivery
  scope :in_queue
  scope :delivered
  scope :canceled

  config.filters = false

  controller do
    private

    def update_order_status(status:, ids:)
      batch_action_collection.find(ids).each(&status.to_sym)
      redirect_back(fallback_location: admin_orders_path)
    end

    def update_order_status_for_member_action(status)
      order = Order.find(permitted_params[:id])
      order.update(status: status)
      redirect_to admin_order_path(order)
    end
  end

  batch_action :in_delivery, if: proc { @current_scope.scope_method != :in_delivery } do |ids|
    update_order_status(status: :in_delivery!, ids: ids)
  end

  batch_action :in_queue, if: proc { @current_scope.scope_method != :in_queue } do |ids|
    update_order_status(status: :in_queue!, ids: ids)
  end

  batch_action :delivered, if: proc { @current_scope.scope_method != :delivered } do |ids|
    update_order_status(status: :delivered!, ids: ids)
  end

  batch_action :canceled, if: proc { @current_scope.scope_method != :canceled } do |ids|
    update_order_status(status: :canceled!, ids: ids)
  end

  member_action :in_delivery, method: :put do
    update_order_status_for_member_action(:in_delivery)
  end

  member_action :in_queue, method: :put do
    update_order_status_for_member_action(:in_queue)
  end

  member_action :delivered, method: :put do
    update_order_status_for_member_action(:delivered)
  end

  member_action :canceled, method: :put do
    update_order_status_for_member_action(:canceled)
  end

  action_item :in_delivery, only: :show do
    link_to I18n.t('links.in_delivery'), in_delivery_admin_order_path(order), method: :put unless order.in_delivery?
  end

  action_item :in_queue, only: :show do
    link_to I18n.t('links.in_queue'), in_queue_admin_order_path(order), method: :put unless order.in_delivery?
  end

  action_item :delivered, only: :show do
    link_to I18n.t('links.delivered'), delivered_admin_order_path(order), method: :put unless order.delivered?
  end

  action_item :canceled, only: :show do
    link_to I18n.t('links.canceled'), canceled_admin_order_path(order), method: :put unless order.canceled?
  end
end
