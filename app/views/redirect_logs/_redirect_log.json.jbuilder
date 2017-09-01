json.extract! redirect_log, :id, :old_url, :new_url, :rule, :status, :created_at, :updated_at
json.url redirect_log_url(redirect_log, format: :json)
