class Article < ActiveRecord::Base
	belongs_to :usuario
	after_save :guardar_imagen
	acts_as_commentable
	PATH_IMAGENES = File.join Rails.root, 'public', 'imagenes_articulos'
	def photo=(archivo)
		unless archivo.blank?
			@archivo = archivo
			self.ext = archivo.original_filename.split('.').last.downcase
		end

	end
	def path_imagen 
		File.join PATH_IMAGENES, "#{self.id}.#{self.ext}"
	end
	def tiene_imagen?
		File.exists? path_imagen
	end
	private
	def guardar_imagen
		if @archivo
			FileUtils.mkdir_p PATH_IMAGENES
			File.open(path_imagen, 'wb') do |f|
				f.write(@archivo.read)
			end
			@archivo = nil
		end
	end
end
