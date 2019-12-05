AlgoliaSearch.configuration = {
  application_id: Rails.application.credentials.algolia_search[:application_id],
  api_key: Rails.application.credentials.algolia_search[:api_key]
}
