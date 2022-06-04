module Api
  class Api::ApiController < ApplicationController
    include WorkImage
    def next_image
      current_index = params[:index].to_i
      theme_id = params[:theme_id].to_i
      length = params[:length].to_i

      new_image_index = next_index(current_index, length)
      next_image_data = show_image(theme_id, new_image_index)

      respond_to do |format|
        if new_image_index.blank?
          format.html{render nothing: true, status:
            :unprocessable_entity}
          format.json {}
        else
          format.html{render display_theme, status:
            :successfully}
          format.json{render json:
                             {new_image_index: next_image_data[:index],
                              name: next_image_data[:name],
                              file: next_image_data[:file],
                              image_id: next_image_data[:image_id],
                              user_valued: next_image_data[:user_valued],
                              common_avg_value: next_image_data[:common_avg_value],
                              value: next_image_data[:value],
                              status: :successfully,
                              notice: 'Successfully listed to next'} }
        end
      end
    end
    def prev_image
      current_index = params[:index].to_i
      theme_id = params[:theme_id].to_i
      length = params[:length].to_i

      new_image_index = prev_index(current_index, length)
      prev_image_data = show_image(theme_id, new_image_index)

      respond_to do |format|
        if new_image_index.blank?
          format.html{render nothing: true, status:
            :unprocessable_entity}
          format.json {}
        else
          format.html{render display_theme, status:
            :successfully}
          format.json{render json:
                               {new_image_index: prev_image_data[:index],
                                name: prev_image_data[:name],
                                file: prev_image_data[:file],
                                image_id: prev_image_data[:image_id],
                                user_valued: prev_image_data[:user_valued],
                                common_avg_value: prev_image_data[:common_avg_value],
                                value: prev_image_data[:value],
                                status: :successfully,
                                notice: 'Successfully listed to previous'} }
        end
      end
    end
    def next_index(index, length)
      new_index = index
      index < length-1 ? new_index += 1 : new_index = 0
      new_index
    end

    def prev_index(index, length)
      new_index = index
      index > 0 ? new_index -= 1 : new_index = length-1
      new_index
    end

    def savg_value
      user_id = params[:user_id].to_i
      image_id = params[:image_id].to_i
      user_valued = Value.user_valued_exists(user_id, image_id)[0] != nil;
      logger.info "IN SAVE VALUE #{user_valued}"
      value = params[:value].to_i
      new_value_data = {
        user_id: user_id,
        image_id: image_id,
        value: value
      }
      if (!user_valued)
        Value.create(new_value_data)
        new_avg_value = Value.avg_value_for(image_id)
        image = Image.update(image_id, {avg_value: new_avg_value})
      end

      logger.info "AVE VALUE #{new_avg_value != nil}"
      respond_to do |format|
        if new_avg_value != nil
          format.json {render json:
                                {
                                 name: image[:name],
                                 file: image[:file],
                                 image_id: image[:id],
                                 common_avg_value: image[:avg_value],
                                 status: :successfully,
                                  notice: 'Successfully added'
                                }
          }
        else
          format.html{render nothing: true, status:
            :unprocessable_entity}
          format.json {}
        end
      end
    end
  end
end
