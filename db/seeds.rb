require 'nokogiri'
require 'open-uri'

user = User.find_by(email: "test@mail.ru") || User.create(email: "test@mail.ru", password: "testpassword", password_confirmation: "testpassword")
block = Block.find_by(title: "Testblock") || Block.create(title: "Testblock", user_id: user.id)
user.add_role :admin

doc = Nokogiri::HTML(open('http://www.learnathome.ru/blog/100-beautiful-words'))

doc.search('//table/tbody/tr').each do |row|
  original = row.search('td[2]/p')[0].content.downcase
  translated = row.search('td[1]/p')[0].content.downcase
  Card.create(original_text: original, translated_text: translated, review_date: Date.today, block_id: pack.id, user_id: user.id)
end
