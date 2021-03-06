require 'roo/excelx/extractor'

module Roo
  class Excelx
    class Images < Excelx::Extractor

      # Returns: Hash { id1: extracted_file_name1 },
      # Example: { "rId1"=>"roo_media_image1.png",
      #            "rId2"=>"roo_media_image2.png",
      #            "rId3"=>"roo_media_image3.png" }
      def list
        @images ||= extract_images_names
      end

      private

      def extract_images_names
        return {} unless doc_exists?

        Hash[doc.xpath('/Relationships/Relationship').map do |rel|
          [rel['Id'], "roo" + rel['Target'].gsub(/\.\.\/|\//, '_')]
        end]
      end
    end
  end
end
