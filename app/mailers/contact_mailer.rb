class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    #ENVファイルで指定した'TOMAIL'へ送信
    mail to: ENV['TOMAIL'], subject: "メールのタイトル"
  end
end
