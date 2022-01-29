5.times do
    Inbox.create({
        name: Faker::Creature::Cat.name,
        conversations_count: 0,
        token: Faker::Crypto.md5
    })
end
puts "finished"
10.times do
    Conversation.create(:inbox=>Inbox.order("RAND()").first)
end

20.times do
    Message.create(:conversation=>Conversation.order("RAND()").first, :content=>Faker::Food.description)
end 