class RepliesController < InheritedResources::Base

  private

    def reply_params
      params.require(:reply).permit(:string, :references)
    end
end

