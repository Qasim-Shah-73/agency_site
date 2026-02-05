class ContactsController < ApplicationController
  def create
    contact = contact_params.to_h.symbolize_keys

    if contact[:email].blank? || contact[:message].blank?
      redirect_to contact_path, alert: "Please complete the required fields and try again."
      return
    end

    ContactMailer.with(contact: contact).new_message.deliver_now
    redirect_to thank_you_path, notice: "Thanks for reaching out. We will respond within 4 business hours."
  rescue StandardError => e
    Rails.logger.error("Contact form delivery failed: #{e.class} - #{e.message}")
    redirect_to contact_path, alert: "Sorry, we could not send your message. Please email us at info@ukdmc.co.uk."
  end

  private

  def contact_params
    params.require(:contact).permit(
      :first_name,
      :last_name,
      :email,
      :phone,
      :company,
      :website,
      :timeline,
      :budget,
      :message,
      :source,
      :agree_communications,
      services: [],
      objectives: []
    )
  end
end
