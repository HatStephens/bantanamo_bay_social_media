require 'dm-timestamps'

class Bant

	include DataMapper::Resource

	property :id,						Serial
	property :content,			String, length: 160
	property :length,				Integer
	property :created_at,		DateTime
	property :time,					Time
	property :user,					String

end