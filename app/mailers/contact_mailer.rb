class ContactMailer < ApplicationMailer
  default to: ENV.fetch("CONTACT_RECIPIENT_EMAIL", "info@ukdmc.co.uk")

  def new_message
    @contact = params[:contact] || {}

    full_name = [@contact[:first_name], @contact[:last_name]].compact.join(" ").strip
    subject_name = full_name.empty? ? "Website Inquiry" : "Website Inquiry from #{full_name}"

    mail(
      subject: subject_name,
      reply_to: @contact[:email]
    )
  end
end
