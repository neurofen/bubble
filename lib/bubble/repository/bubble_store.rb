require 'pstore'

class BubbleStore
	def initialize db_path
		@makes_db = PStore.new("#{db_path}/makes_db.pstore")
		@make_models_db = PStore.new("#{db_path}/make_models_db.pstore")
	end

	def drop
		@makes_db.transaction do
			@makes_db.roots.each do | root |
				@makes_db.delete(root)
			end
		end

		@make_models_db.transaction do
			@make_models_db.roots.each do |root|
				@make_models_db.delete(root)
			end
		end
	end

	def store record
		save_or_update(record) unless record.nil?
	end

	def get_all_makes
		@makes_db.transaction do
			return @makes_db.roots.sort
		end
	end

	def get_models_for make
		@makes_db.transaction do
			return @makes_db[make].sort
		end
	end

	def get_thumbs_for make, model
		@make_models_db.transaction do
			return @make_models_db[[make, model]].sort
		end
	end

	private
		def save_or_update record
			save_update_makes(record[:make], record[:model])
			save_update_make_models([record[:make], record[:model]], record[:thumb])
		end

		def save_update_makes key, model
			@makes_db.transaction do
		    	if @makes_db[key].nil?
		    		@makes_db[key] = [model]
		    	else
		    		@makes_db[key] = @makes_db[key].push(model) unless @makes_db[key].include?(model)
		    	end
			end
		end

		def save_update_make_models key, thumb
			@make_models_db.transaction do
				if @make_models_db[key].nil?
					@make_models_db[key] = [thumb]
				else
					@make_models_db[key].push(thumb)
				end
			end
		end

end
