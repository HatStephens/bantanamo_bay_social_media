
class Bant

	include DataMapper::Resource

	property :id,						Serial
	property :content,			String, length: 160
	property :length,				Integer
	property :date,					DateTime
	property :user,					String

end