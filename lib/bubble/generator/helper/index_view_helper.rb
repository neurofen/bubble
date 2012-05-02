include VIEW::HELPER

class Index

  def create_page_from title, all_makes, thumb_bucket
    puts "create_index_page_from(#{title}, #{all_makes})"
    ["#{title}.html", index_display_data_from(all_makes, thumb_bucket)]
  end

  private
    def index_display_data_from all_makes, thumb_bucket
      DisplayData.new('index', create_index_navigation_using(all_makes), thumb_bucket.contents)
    end

    def create_index_navigation_using all_makes
      navigation = []
      all_makes.each do |make|
        navigation.push([make, "#{string2hex(make)}.html"])
      end
      navigation
    end
end