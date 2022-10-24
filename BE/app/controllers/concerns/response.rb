module Response
  include Pagy::Backend
  DEFAULT_PER_PAGE = 12
  DEFAULT_PAGE = 1

  def response_success(data = {}, options = {})
    render({ json: data, status: :ok, **options })
  end

  def response_list(data, options = {})
    default_options = { adapter: :json, meta: pages }
    response_success(data, options.merge(default_options))
  end

  def response_error(error = {}, status = :unprocessable_entity)
    render json: error, status: status
  end

  def response_not_found(message = 'Not found')
    render json: { message: message }, status: :not_found
  end

  def pages
    {
      total: @pagy.count,
      page: @pagy.page,
      from: @pagy.from,
      to: @pagy.to,
      pages: @pagy.pages
    }
  end
end
