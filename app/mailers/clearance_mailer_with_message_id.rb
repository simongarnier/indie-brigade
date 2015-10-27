class ClearanceMailerWithMessageId < ClearanceMailer
  def message_id_in_header(sent_at=Time.now)
    headers["Message-ID"] = "#{Digest::SHA2.hexdigest(sent_at.to_i.to_s)}@indiebrigade.com"
  end
end
